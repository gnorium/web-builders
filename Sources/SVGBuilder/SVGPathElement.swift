import CSSBuilder
import CSSOMBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGPathElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
  public init(@SVGBuilder content: () -> [Node] = { [] }) {
    super.init("path", children: content())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGPathElement {
  public func d(_ value: String) -> Self { addingAttribute("d", value) }

  public func d(_ commands: SVGPath.Definition.Command...) -> Self {
    d(commands)
  }

  public func d(_ commands: [SVGPath.Definition.Command]) -> Self {
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

public func path(@SVGBuilder content: () -> [Node] = { [] }) -> SVGPathElement {
  SVGPathElement(content: content)
}
