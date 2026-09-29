import DOMBuilder
import WebTypes

/// MathML's elements (MathML Core), as `SVG` holds SVG's.
public enum MathML {}

extension MathML {
  /// A MathML element. MathML Core gives every element of the language one
  /// DOM interface, `MathMLElement`, so one class serves them all, named by
  /// its tag (`math`, `mrow`, `mi`, `mfrac`…).
  open class MathMLElement: DOM.Element, @unchecked Sendable {
    public init(
      _ tag: String, attributes: [(String, String)] = [], @MathMLBuilder content: () -> [DOM.Node] = { [] }
    ) {
      super.init(ns: .mathml, tag: tag, attributes: attributes, children: content(), inline: true)
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }
}
