import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

/// A specialized SVG animation element that is type-safe for a specific attribute.
public class TypedSVGAnimateElement<Value>: SVG.SVGElement, @unchecked Sendable {
  public let attribute: SVGAttribute<Value>

  public init(attribute: SVGAttribute<Value>, attributes: [(String, String)]) {
    self.attribute = attribute
    super.init("animate", attributes: attributes)
  }

  public override init(id: Int32) {
    fatalError("TypedSVGAnimateElement cannot be initialized by ID alone")
  }

  @discardableResult
  public override func addingAttribute(_ key: String, _ value: String) -> Self {
    super.addingAttribute(key, value)
    return self
  }
}

// MARK: - Specialized Overloads

extension TypedSVGAnimateElement where Value == CSS.Length {
  public func from(_ value: CSS.Length) -> Self { addingAttribute("from", value.value) }
  public func to(_ value: CSS.Length) -> Self { addingAttribute("to", value.value) }
  public func values(_ items: CSS.Length...) -> Self {
    addingAttribute("values", stringJoin(items.map { $0.value }, separator: ";"))
  }
}

extension TypedSVGAnimateElement where Value == CSS.Percentage {
  public func from(_ value: CSS.Percentage) -> Self { addingAttribute("from", value.value) }
  public func to(_ value: CSS.Percentage) -> Self { addingAttribute("to", value.value) }
  public func values(_ items: CSS.Percentage...) -> Self {
    addingAttribute("values", stringJoin(items.map { $0.value }, separator: ";"))
  }
}

extension TypedSVGAnimateElement where Value == Double {
  public func from(_ value: Double) -> Self { addingAttribute("from", doubleToString(value)) }
  public func to(_ value: Double) -> Self { addingAttribute("to", doubleToString(value)) }
  public func values(_ items: Double...) -> Self {
    addingAttribute("values", stringJoin(items.map { doubleToString($0) }, separator: ";"))
  }
}

extension TypedSVGAnimateElement where Value == [(Double, Double)] {
  public func from(_ coordinates: (Double, Double)...) -> Self {
    let str = stringJoin(
      coordinates.map { "\(doubleToString($0.0)),\(doubleToString($0.1))" }, separator: " ")
    return addingAttribute("from", str)
  }

  public func to(_ coordinates: (Double, Double)...) -> Self {
    let str = stringJoin(
      coordinates.map { "\(doubleToString($0.0)),\(doubleToString($0.1))" }, separator: " ")
    return addingAttribute("to", str)
  }

  public func values(_ steps: [(Double, Double)]...) -> Self {
    let strings = steps.map { coords in
      stringJoin(coords.map { "\(doubleToString($0.0)),\(doubleToString($0.1))" }, separator: " ")
    }
    return addingAttribute("values", stringJoin(strings, separator: ";"))
  }
}

extension TypedSVGAnimateElement where Value == [SVG.Path.Definition.Command] {
  public func from(_ commands: SVG.Path.Definition.Command...) -> Self {
    let str = stringJoin(commands.map { $0.pathString }, separator: " ")
    return addingAttribute("from", str)
  }

  public func to(_ commands: SVG.Path.Definition.Command...) -> Self {
    let str = stringJoin(commands.map { $0.pathString }, separator: " ")
    return addingAttribute("to", str)
  }

  public func values(_ paths: [SVG.Path.Definition.Command]...) -> Self {
    let strings = paths.map { cmds in
      stringJoin(cmds.map { $0.pathString }, separator: " ")
    }
    return addingAttribute("values", stringJoin(strings, separator: ";"))
  }
}

extension TypedSVGAnimateElement {
  public func dur(_ value: String) -> Self { addingAttribute("dur", value) }
  public func dur(_ value: CSS.Time) -> Self { addingAttribute("dur", value.value) }

  public func repeatCount(_ value: String) -> Self { addingAttribute("repeatCount", value) }
  public func repeatCount(_ count: SVG.Animate.RepeatCount) -> Self {
    addingAttribute("repeatCount", count.value)
  }

  public func fill(_ value: String) -> Self { addingAttribute("fill", value) }
  public func fill(_ fill: SVG.Animate.Fill) -> Self { addingAttribute("fill", fill.rawValue) }

  public func begin(_ value: String) -> Self { addingAttribute("begin", value) }
  public func begin(_ begin: SVG.Animate.Begin) -> Self { addingAttribute("begin", begin.rawValue) }

  public func attributeType(_ value: String) -> Self { addingAttribute("attributeType", value) }
  public func attributeType(_ type: SVG.Animate.AttributeType) -> Self {
    addingAttribute("attributeType", type.rawValue)
  }

  public func keyTimes(_ times: Double...) -> Self {
    addingAttribute("keyTimes", stringJoin(times.map { doubleToString($0) }, separator: ";"))
  }
  public func keyTimes(_ times: Int...) -> Self {
    addingAttribute("keyTimes", stringJoin(times.map { intToString($0) }, separator: ";"))
  }

  public func calcMode(_ mode: SVG.Animate.CalcMode) -> Self {
    addingAttribute("calcMode", mode.rawValue)
  }

  public func keySplines(_ splines: (Double, Double, Double, Double)...) -> Self {
    let strings = splines.map { s in
      "\(doubleToString(s.0)) \(doubleToString(s.1)) \(doubleToString(s.2)) \(doubleToString(s.3))"
    }
    return addingAttribute("keySplines", stringJoin(strings, separator: ";"))
  }
}
