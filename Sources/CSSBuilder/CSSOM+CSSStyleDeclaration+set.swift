import CSSOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension CSSOM.CSSStyleDeclaration {
  public func set(_ property: CSS.Property) {
    setProperty(property.property, property.value, property.isImportant ? "important" : "")
  }
}
