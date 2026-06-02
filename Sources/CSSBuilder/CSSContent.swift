import CSSOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

/// Protocol for types that can appear inside a @CSSBuilder block.
/// Mirrors HTMLContent / SVGContent — requires cssText so content can be rendered.
public protocol CSSContent: Sendable {
  var cssText: String { get }
}

extension CSS.Property: CSSContent {
  public var cssText: String {
    let suffix = isImportant ? " !important;" : ";"
    return stringJoin([property, ": ", value, suffix], separator: "")
  }
}

extension CSSOM.CSSRule: CSSContent {}
