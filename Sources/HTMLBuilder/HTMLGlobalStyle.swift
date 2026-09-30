import EmbeddedSwiftUtilities
#if SERVER
  import Foundation
#endif

/// Global CSSContent accumulator - collects all non-inlineable styles during rendering.
/// Deduplicates identical CSS blocks (pseudo-classes, media queries, etc.) to avoid bloat
/// when many elements share the same class and pseudo-class styles.
///
/// On the server every response renders into its own collector, bound to the
/// request's task by `withRequestCollector`. One process-wide instance shared by
/// concurrent requests raced on these arrays—`append` crashed releasing a
/// half-mutated dictionary—and one response's `getAndResetStyleSheets` drained
/// registrations another was about to link, so pages shipped without their CSS.
/// `shared` resolves to the request's collector when one is bound, else to the
/// process-wide one used by the build-time StyleSheetEmitter and the client.
public final class HTMLGlobalStyle: @unchecked Sendable {
  private static let global = HTMLGlobalStyle()

  #if SERVER
    @TaskLocal private static var requestCollector: HTMLGlobalStyle?

    public static var shared: HTMLGlobalStyle { requestCollector ?? global }

    /// Runs `body` with a fresh collector bound to the current task—one per
    /// response, from the middleware that wraps every request.
    public static func withRequestCollector<T>(_ body: () async throws -> T) async rethrows -> T {
      try await $requestCollector.withValue(HTMLGlobalStyle()) { try await body() }
    }

    /// Runs `body` with a fresh collector bound to the current thread or task
    /// and returns it—for the StyleSheetEmitter, which renders its catalog
    /// on many threads at once and merges the collectors in catalog order
    /// with `append(_:)`.
    public static func collecting(_ body: () throws -> Void) rethrows -> HTMLGlobalStyle {
      let collector = HTMLGlobalStyle()
      try $requestCollector.withValue(collector) { try body() }
      return collector
    }

    /// Serializes the rare shared use—the process-wide collector outside a
    /// request—and costs nothing measurable on a per-request one.
    private let lock = NSLock()
  #else
    public static var shared: HTMLGlobalStyle { global }
  #endif

  private func synchronized<T>(_ body: () -> T) -> T {
    #if SERVER
      lock.lock()
      defer { lock.unlock() }
    #endif
    return body()
  }

  private var blocks: [String] = []

  // StyleSheet ownership is a server-rendering concern. Keeping its String
  // dictionary out of the Embedded Swift client is essential: Swift's native
  // String hashing/equality brings in Unicode normalization tables that the
  // minimal WASI runtime intentionally does not ship.
  #if SERVER
  private var styleSheetBlocks: [String: [String]] = [:]
  private var styleSheetOwners: [String] = []
  /// The blocks each destination already holds ("" for `blocks`), so a
  /// duplicate is found by hash. Scanning the array compared every new block
  /// with every kept one: about half of the StyleSheetEmitter's 23s run.
  private var seen: [String: Set<String>] = [:]
  #endif

  private init() {}

  public func append(_ content: String, styleSheet: String? = nil) {
    synchronized {
      #if SERVER
      if let styleSheet {
        append(content, to: &styleSheetBlocks[styleSheet, default: []], key: styleSheet)
        if !styleSheetOwners.contains(styleSheet) {
          styleSheetOwners.append(styleSheet)
        }
        return
      }
      #endif
      append(content, to: &blocks, key: "")
    }
  }

  #if SERVER
  /// Appends everything `other` collected as though its renders had run here,
  /// after this one's: owners new to this collector in `other`'s registration
  /// order (an owner that collected nothing included, since it holds its
  /// place), and each owner's blocks in order, those already held dropped.
  /// Merging per-thread collectors in render order so gives exactly what one
  /// collector would have held after rendering everything in that order.
  public func append(_ other: HTMLGlobalStyle) {
    let (otherBlocks, owners, ownerBlocks) = other.synchronized {
      (other.blocks, other.styleSheetOwners, other.styleSheetBlocks)
    }
    synchronized {
      for block in otherBlocks where seen["", default: []].insert(block).inserted {
        blocks.append(block)
      }
      for owner in owners {
        if styleSheetBlocks[owner] == nil {
          styleSheetOwners.append(owner)
          styleSheetBlocks[owner] = []
        }
        for block in ownerBlocks[owner] ?? [] where seen[owner, default: []].insert(block).inserted {
          styleSheetBlocks[owner, default: []].append(block)
        }
      }
    }
  }
  #endif

  private func append(_ content: String, to destination: inout [String], key: String) {
    // Split into individual CSS blocks and deduplicate
    for block in stringSplit(content, separator: "\n\n") {
      let trimmed = stringTrim(block)
      guard !stringIsEmpty(trimmed) else { continue }

      #if SERVER
        if seen[key, default: []].insert(trimmed).inserted { destination.append(trimmed) }
      #else
        // The client can't hash Strings (see styleSheetBlocks), and collects few.
        var alreadySeen = false
        for kept in destination {
          if stringEquals(kept, trimmed) {
            alreadySeen = true
            break
          }
        }

        if !alreadySeen {
          destination.append(trimmed)
        }
      #endif
    }
  }

  public func getAndReset() -> String {
    synchronized {
      let result = blocks.joinedString(separator: "\n\n")
      blocks = []
      #if SERVER
      seen[""] = nil
      #endif
      return stringIsEmpty(result) ? result : "\(result)\n"
    }
  }

  /// Returns the current cacheable stylesheet owners without draining. Use this
  /// when you need to LINK the cacheable sheets in a page response (e.g. as
  /// `<link rel="stylesheet">`) but must leave the data intact for the
  /// StyleSheetEmitter to collect after the build.
  public func currentStyleSheetOwners() -> [String] {
    #if SERVER
    return synchronized { styleSheetOwners }
    #else
    return []
    #endif
  }

  /// Returns the complete cacheable stylesheet contents without draining them.
  /// Server responses use this to link only build-emitted files, while the
  /// dedicated StyleSheetEmitter drains the same registrations after a complete
  /// catalog render.
  public func currentStyleSheets() -> [(owner: String, css: String)] {
    #if SERVER
    return synchronized {
      styleSheetOwners.compactMap { owner -> (owner: String, css: String)? in
        guard let blocks = styleSheetBlocks[owner], !blocks.isEmpty else { return nil }
        return (owner, blocks.joinedString(separator: "\n\n") + "\n")
      }
    }
    #else
    return []
    #endif
  }

  /// Returns each source-owned StyleSheet in registration order. Ownership is
  /// inferred from the Swift declaration file, so LayoutView can link separate
  /// cacheable CSS assets without call sites naming them.
  public func getAndResetStyleSheets() -> [(owner: String, css: String)] {
    #if SERVER
    return synchronized {
      let result = styleSheetOwners.compactMap { owner -> (owner: String, css: String)? in
        guard let blocks = styleSheetBlocks[owner], !blocks.isEmpty else { return nil }
        return (owner, blocks.joinedString(separator: "\n\n") + "\n")
      }
      styleSheetBlocks = [:]
      styleSheetOwners = []
      seen = seen.filter { $0.key.isEmpty }
      return result
    }
    #else
    return []
    #endif
  }

  public func reset() {
    synchronized {
      blocks = []
      #if SERVER
      styleSheetBlocks = [:]
      styleSheetOwners = []
      seen = [:]
      #endif
    }
  }
}
