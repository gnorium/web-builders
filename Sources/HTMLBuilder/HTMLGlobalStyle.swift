import EmbeddedSwiftUtilities

/// Global CSSContent accumulator - collects all non-inlineable styles during rendering.
/// Deduplicates identical CSS blocks (pseudo-classes, media queries, etc.) to avoid bloat
/// when many elements share the same class and pseudo-class styles.
public final class HTMLGlobalStyle: @unchecked Sendable {
  public static let shared = HTMLGlobalStyle()

  private var blocks: [String] = []

  // StyleSheet ownership is a server-rendering concern. Keeping its String
  // dictionary out of the Embedded Swift client is essential: Swift's native
  // String hashing/equality brings in Unicode normalization tables that the
  // minimal WASI runtime intentionally does not ship.
  #if SERVER
  private var styleSheetBlocks: [String: [String]] = [:]
  private var styleSheetOwners: [String] = []
  #endif

  private init() {}

  public func append(_ content: String, styleSheet: String? = nil) {
    #if SERVER
    if let styleSheet {
      append(content, to: &styleSheetBlocks[styleSheet, default: []])
      if !styleSheetOwners.contains(styleSheet) {
        styleSheetOwners.append(styleSheet)
      }
      return
    }
    #endif
    append(content, to: &blocks)
  }

  private func append(_ content: String, to destination: inout [String]) {
    // Split into individual CSS blocks and deduplicate
    for block in stringSplit(content, separator: "\n\n") {
      let trimmed = stringTrim(block)
      guard !stringIsEmpty(trimmed) else { continue }

      var alreadySeen = false
      for seen in destination {
        if stringEquals(seen, trimmed) {
          alreadySeen = true
          break
        }
      }

      if !alreadySeen {
        destination.append(trimmed)
      }
    }
  }

  public func getAndReset() -> String {
    let result = blocks.joinedString(separator: "\n\n")
    blocks = []
    return stringIsEmpty(result) ? result : "\(result)\n"
  }

  /// Returns the current cacheable stylesheet owners without draining. Use this
  /// when you need to LINK the cacheable sheets in a page response (e.g. as
  /// `<link rel="stylesheet">`) but must leave the data intact for the
  /// StyleSheetEmitter to collect after the build.
  public func currentStyleSheetOwners() -> [String] {
    #if SERVER
    return styleSheetOwners
    #else
    return []
    #endif
  }

  /// Returns the complete cacheable stylesheet contents without draining them.
  /// Server responses use this to link only build-emitted files, while the
  /// dedicated StyleSheetEmitter drains the same registrations after a complete
  /// catalogue render.
  public func currentStyleSheets() -> [(owner: String, css: String)] {
    #if SERVER
    return styleSheetOwners.compactMap { owner -> (owner: String, css: String)? in
      guard let blocks = styleSheetBlocks[owner], !blocks.isEmpty else { return nil }
      return (owner, blocks.joinedString(separator: "\n\n") + "\n")
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
    let result = styleSheetOwners.compactMap { owner -> (owner: String, css: String)? in
      guard let blocks = styleSheetBlocks[owner], !blocks.isEmpty else { return nil }
      return (owner, blocks.joinedString(separator: "\n\n") + "\n")
    }
    styleSheetBlocks = [:]
    styleSheetOwners = []
    return result
    #else
    return []
    #endif
  }

  public func reset() {
    blocks = []
    #if SERVER
    styleSheetBlocks = [:]
    styleSheetOwners = []
    #endif
  }
}
