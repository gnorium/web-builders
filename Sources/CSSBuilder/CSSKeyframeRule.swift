import CSSOMBuilder
import WebTypes

public struct CSSKeyframeRule: CSSContent {
  public let keyText: String
  public var style: [CSSRule]

  public init(_ keyText: String, @CSSOMBuilder _ content: () -> [CSSRule]) {
    self.keyText = keyText
    var decs: [CSSRule] = []
    for item in content() {
      if case .styleDeclaration = item {
        decs.append(item)
      }
    }
    self.style = decs
  }

  public func render() -> CSSRule {
    .keyframeRule(keyText: keyText, style: style)
  }

  public var cssRuleType: CSSRuleType { .keyframeRule }
}

public func at(_ percentage: Percentage, @CSSOMBuilder _ content: () -> [CSSRule])
  -> CSSKeyframeRule
{
  CSSKeyframeRule(percentage.value, content)
}

public func from(@CSSOMBuilder _ content: () -> [CSSRule]) -> CSSKeyframeRule {
  CSSKeyframeRule("from", content)
}

public func to(@CSSOMBuilder _ content: () -> [CSSRule]) -> CSSKeyframeRule {
  CSSKeyframeRule("to", content)
}
