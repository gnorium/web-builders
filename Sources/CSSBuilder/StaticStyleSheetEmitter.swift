#if SERVER
  import Foundation

  /// Reusable build-time emitter for cacheable `Public/style-sheets/*.css`.
  /// Centralized in `web-builders` so `web-components`, `admin-core`,
  /// `artifact-core`, `gnorium-web` and external projects (e.g. madhavik blog)
  /// can share the same logic without repeating file I/O. `publicDirectory` is
  /// configurable per project.
  public enum StaticStyleSheetEmitter {
    private final class State: @unchecked Sendable {
      let lock = NSLock()
      var configuredPublicDirectory: String?
      var emittedPaths: [String] = []
    }

    private static let state = State()

    /// Enables emission for the dedicated build executable only. Normal server
    /// rendering never configures this context and therefore never writes CSS.
    public static func begin(publicDirectory: String) {
      state.lock.lock()
      state.configuredPublicDirectory = publicDirectory
      state.emittedPaths = []
      state.lock.unlock()
    }

    /// True only while the dedicated build executable is collecting styles.
    /// Normal server rendering drains its request-local registrations after it
    /// has selected the external stylesheet URLs.
    public static var isEmitting: Bool {
      state.lock.lock()
      defer { state.lock.unlock() }
      return state.configuredPublicDirectory != nil
    }

    public static func emitCollected(_ styleSheets: [(owner: String, css: String)]) throws {
      state.lock.lock()
      let publicDirectory = state.configuredPublicDirectory
      state.lock.unlock()
      guard let publicDirectory else { return }

      for styleSheet in styleSheets.sorted(by: { $0.owner < $1.owner }) {
        let path = try emit(
          owner: styleSheet.owner,
          css: styleSheet.css,
          publicDirectory: publicDirectory
        )
        state.lock.lock()
        state.emittedPaths.append(path)
        state.lock.unlock()
      }
    }

    public static func finish() -> [String] {
      state.lock.lock()
      let paths = state.emittedPaths
      state.configuredPublicDirectory = nil
      state.emittedPaths = []
      state.lock.unlock()
      return paths
    }

    /// Atomically writes one build-generated stylesheet below `Public/`.
    /// The stable path is cache-busted by the project's `VersionedAssetURLRegistry`.
    @discardableResult
    public static func emit(owner: String, css: String, publicDirectory: String) throws -> String {
      let directory = URL(fileURLWithPath: publicDirectory).appendingPathComponent("style-sheets")
      try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
      let destination = directory.appendingPathComponent("\(owner).css")
      try Data(css.utf8).write(to: destination, options: .atomic)
      return "style-sheets/\(owner).css"
    }
  }
#endif
