import CSSOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public func from(@CSSBuilder _ declarations: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSKeyframeRule {
  CSSOM.CSSKeyframeRule("from", style: declarations())
}

public func to(@CSSBuilder _ declarations: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSKeyframeRule {
  CSSOM.CSSKeyframeRule("to", style: declarations())
}

public func at(_ percentage: CSS.Percentage, @CSSBuilder _ declarations: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSKeyframeRule {
  CSSOM.CSSKeyframeRule(percentage.value, style: declarations())
}
