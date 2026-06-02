import CSSBuilder
import CSSOMBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGPathElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
    public init(@SVGBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("path", children: content())
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }
}

extension SVG.SVGPathElement {
  public func d(_ value: String) -> Self { addingAttribute("d", value) }

  public func d(_ commands: SVG.Path.Definition.Command...) -> Self {
    d(commands)
  }

  public func d(_ commands: [SVG.Path.Definition.Command]) -> Self {
    var value = ""
    for (index, cmd) in commands.enumerated() {
      value = "\(value)\(cmd.pathString)"
      if index < commands.count - 1 {
        value = "\(value) "
      }
    }
    return addingAttribute("d", value)
  }

  public func pathLength(_ value: Double) -> Self {
    addingAttribute("pathLength", doubleToString(value))
  }
}

public func path(@SVGBuilder content: () -> [DOM.Node] = { [] }) -> SVG.SVGPathElement {
  SVG.SVGPathElement(content: content)
}
