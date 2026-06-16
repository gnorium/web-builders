import CSSOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public func container(_ condition: String, @CSSBuilder _ content: () -> [CSSOM.CSSRule]) -> CSSOM.CSSContainerRule {
  CSSOM.CSSContainerRule(condition, rules: content())
}
