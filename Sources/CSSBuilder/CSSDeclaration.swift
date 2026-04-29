import CSSOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public struct CSSDeclaration: CSSContent {
  public let property: String
  public let value: String
  public let isImportant: Bool

  public init(_ property: String, _ value: String, isImportant: Bool = false) {
    self.property = property
    self.value = value
    self.isImportant = isImportant
  }

  public func render() -> CSSRule {
    .styleDeclaration(property: property, value: value, isImportant: isImportant)
  }

  public func important() -> CSSDeclaration {
    CSSDeclaration(property, value, isImportant: true)
  }

  public var cssRuleType: CSSRuleType { .declaration }
}

public func display(_ value: CSSDisplay.Outside) -> CSSDeclaration {
  CSSDeclaration("display", value.rawValue)
}

public func display(_ value: CSSDisplay.Inside) -> CSSDeclaration {
  CSSDeclaration("display", value.rawValue)
}

public func display(_ value: CSSDisplay.ListItem) -> CSSDeclaration {
  CSSDeclaration("display", value.rawValue)
}

public func display(_ value: CSSDisplay.Internal) -> CSSDeclaration {
  CSSDeclaration("display", value.rawValue)
}

public func display(_ value: CSSDisplay.Box) -> CSSDeclaration {
  CSSDeclaration("display", value.rawValue)
}

public func display(_ value: CSSDisplay.Legacy) -> CSSDeclaration {
  CSSDeclaration("display", value.rawValue)
}

public func display(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("display", value.rawValue)
}

public func display(_ outside: CSSDisplay.Outside, _ inside: CSSDisplay.Inside) -> CSSDeclaration {
  CSSDeclaration("display", "\(outside.rawValue) \(inside.rawValue)")
}

public func position(_ value: CSSPosition) -> CSSDeclaration {
  CSSDeclaration("position", value.rawValue)
}

public func direction(_ value: CSSDirection) -> CSSDeclaration {
  CSSDeclaration("direction", value.rawValue)
}
@available(*, deprecated)
public func display(_ value: String) -> CSSDeclaration {
  CSSDeclaration("display", value)
}
@available(*, deprecated)
public func position(_ value: String) -> CSSDeclaration {
  CSSDeclaration("position", value)
}

public func width(_ value: Int) -> CSSDeclaration { CSSDeclaration("width", intToString(value)) }

public func width(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("width", doubleToString(value))
}

public func width(_ value: Length) -> CSSDeclaration { CSSDeclaration("width", value.value) }

public func width(_ value: Percentage) -> CSSDeclaration { CSSDeclaration("width", value.value) }

public func width(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("width", value.value)
}

public func width(_ value: CSSKeyword.Length) -> CSSDeclaration {
  CSSDeclaration("width", value.rawValue)
}

public func width(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("width", value.rawValue)
}

public func height(_ value: Int) -> CSSDeclaration { CSSDeclaration("height", intToString(value)) }

public func height(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("height", doubleToString(value))
}

public func height(_ value: Length) -> CSSDeclaration { CSSDeclaration("height", value.value) }

public func height(_ value: Percentage) -> CSSDeclaration { CSSDeclaration("height", value.value) }

public func height(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("height", value.value)
}

public func height(_ value: CSSKeyword.Length) -> CSSDeclaration {
  CSSDeclaration("height", value.rawValue)
}

public func height(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("height", value.rawValue)
}

public func padding(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("padding", intToString(value))
}

public func padding(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("padding", doubleToString(value))
}

public func padding(_ value: Length) -> CSSDeclaration { CSSDeclaration("padding", value.value) }

public func padding(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("padding", value.value)
}

public func padding(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding", value.value)
}

public func padding(_ vertical: Length, _ horizontal: Length) -> CSSDeclaration {
  CSSDeclaration("padding", "\(vertical.value) \(horizontal.value)")
}

public func padding(_ vertical: Percentage, _ horizontal: Percentage) -> CSSDeclaration {
  CSSDeclaration("padding", "\(vertical.value) \(horizontal.value)")
}

public func padding(_ v: LengthPercentage, _ h: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding", "\(v.value) \(h.value)")
}

public func padding(_ v: Int, _ h: Length) -> CSSDeclaration {
  CSSDeclaration("padding", "\(intToString(v)) \(h.value)")
}

public func padding(_ v: Double, _ h: Length) -> CSSDeclaration {
  CSSDeclaration("padding", "\(doubleToString(v)) \(h.value)")
}

public func padding(_ v: Length, _ h: Int) -> CSSDeclaration {
  CSSDeclaration("padding", "\(v.value) \(intToString(h))")
}

public func padding(_ v: Length, _ h: Double) -> CSSDeclaration {
  CSSDeclaration("padding", "\(v.value) \(doubleToString(h))")
}

public func padding(_ v: Length, _ h: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding", "\(v.value) \(h.value)")
}

public func padding(_ v: LengthPercentage, _ h: Length) -> CSSDeclaration {
  CSSDeclaration("padding", "\(v.value) \(h.value)")
}

public func padding(_ top: Length, _ horizontal: Length, _ bottom: Length) -> CSSDeclaration {
  CSSDeclaration("padding", "\(top.value) \(horizontal.value) \(bottom.value)")
}

public func padding(_ top: LengthPercentage, _ horizontal: Length, _ bottom: Length)
  -> CSSDeclaration
{ CSSDeclaration("padding", "\(top.value) \(horizontal.value) \(bottom.value)") }

public func padding(_ t: LengthPercentage, _ h: LengthPercentage, _ b: LengthPercentage)
  -> CSSDeclaration
{ CSSDeclaration("padding", "\(t.value) \(h.value) \(b.value)") }

public func padding(_ top: Length, _ right: Length, _ bottom: Length, _ left: Length)
  -> CSSDeclaration
{ CSSDeclaration("padding", "\(top.value) \(right.value) \(bottom.value) \(left.value)") }

public func padding(_ top: Length, _ right: LengthPercentage, _ bottom: Length, _ left: Length)
  -> CSSDeclaration
{ CSSDeclaration("padding", "\(top.value) \(right.value) \(bottom.value) \(left.value)") }

public func padding(
  _ t: LengthPercentage, _ r: LengthPercentage, _ b: LengthPercentage, _ l: LengthPercentage
) -> CSSDeclaration { CSSDeclaration("padding", "\(t.value) \(r.value) \(b.value) \(l.value)") }

public func margin(_ value: Int) -> CSSDeclaration { CSSDeclaration("margin", intToString(value)) }

public func margin(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("margin", doubleToString(value))
}

public func margin(_ value: Length) -> CSSDeclaration { CSSDeclaration("margin", value.value) }

public func margin(_ value: Percentage) -> CSSDeclaration { CSSDeclaration("margin", value.value) }

public func margin(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("margin", value.value)
}

public func margin(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("margin", value.rawValue)
}

public func margin(_ vertical: Length, _ horizontal: Length) -> CSSDeclaration {
  CSSDeclaration("margin", "\(vertical.value) \(horizontal.value)")
}

public func margin(_ vertical: Percentage, _ horizontal: Percentage) -> CSSDeclaration {
  CSSDeclaration("margin", "\(vertical.value) \(horizontal.value)")
}

public func margin(_ v: LengthPercentage, _ h: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("margin", "\(v.value) \(h.value)")
}

public func margin(_ v: Length, _ h: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("margin", "\(v.value) \(h.rawValue)")
}

public func margin(_ v: CSSKeyword.Auto, _ h: Length) -> CSSDeclaration {
  CSSDeclaration("margin", "\(v.rawValue) \(h.value)")
}

public func margin(_ v: CSSKeyword.Auto, _ h: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("margin", "\(v.rawValue) \(h.rawValue)")
}

public func margin(_ top: Length, _ horizontal: Length, _ bottom: Length) -> CSSDeclaration {
  CSSDeclaration("margin", "\(top.value) \(horizontal.value) \(bottom.value)")
}

public func margin(_ t: LengthPercentage, _ h: LengthPercentage, _ b: LengthPercentage)
  -> CSSDeclaration
{ CSSDeclaration("margin", "\(t.value) \(h.value) \(b.value)") }

public func margin(_ top: Length, _ right: Length, _ bottom: Length, _ left: Length)
  -> CSSDeclaration
{ CSSDeclaration("margin", "\(top.value) \(right.value) \(bottom.value) \(left.value)") }

public func margin(
  _ t: LengthPercentage, _ r: LengthPercentage, _ b: LengthPercentage, _ l: LengthPercentage
) -> CSSDeclaration { CSSDeclaration("margin", "\(t.value) \(r.value) \(b.value) \(l.value)") }

@_disfavoredOverload
public func margin(
  _ top: Length, _ right: CSSKeyword.Auto, _ bottom: Length, _ left: CSSKeyword.Auto
) -> CSSDeclaration {
  CSSDeclaration("margin", "\(top.value) \(right.rawValue) \(bottom.value) \(left.rawValue)")
}

public func margin(
  _ top: LengthPercentage, _ right: CSSKeyword.Auto, _ bottom: LengthPercentage,
  _ left: CSSKeyword.Auto
) -> CSSDeclaration {
  CSSDeclaration("margin", "\(top.value) \(right.rawValue) \(bottom.value) \(left.rawValue)")
}

public func fontSize(_ value: Length) -> CSSDeclaration { CSSDeclaration("font-size", value.value) }

public func fontSize(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("font-size", value.value)
}

public func fontSize(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("font-size", value.value)
}

public func fontSize(_ value: CSSKeyword.Global) -> CSSDeclaration {
  CSSDeclaration("font-size", value.rawValue)
}

public func fontWeight(_ value: CSSFontWeight) -> CSSDeclaration {
  CSSDeclaration("font-weight", value.value)
}

public func fontWeight(_ value: String) -> CSSDeclaration {
  CSSDeclaration("font-weight", value)
}

public func fontWeight(_ value: CSSKeyword.Global) -> CSSDeclaration {
  CSSDeclaration("font-weight", value.rawValue)
}

public func fontFamily(_ value: String) -> CSSDeclaration {
  CSSDeclaration("font-family", value)
}

public func fontFamily(_ value: CSSFontFamily) -> CSSDeclaration {
  CSSDeclaration("font-family", value.value)
}

public func fontFamily(_ value: CSSFontFamily.GenericFamily.GenericComplete) -> CSSDeclaration {
  CSSDeclaration("font-family", value.rawValue)
}

public func fontFamily(_ value: CSSFontFamily.GenericFamily.GenericIncomplete) -> CSSDeclaration {
  CSSDeclaration("font-family", value.rawValue)
}

public func fontFamily(_ value: CSSFontFamily.GenericFamily.GenericScriptSpecific) -> CSSDeclaration
{
  CSSDeclaration("font-family", value.description)
}

public func fontFamily(_ value: CSSFontFamily.GenericFamily) -> CSSDeclaration {
  CSSDeclaration("font-family", value.description)
}

public func fontFamily(_ value: CSSKeyword.Global) -> CSSDeclaration {
  CSSDeclaration("font-family", value.rawValue)
}

public func fontStyle(_ value: String) -> CSSDeclaration {
  CSSDeclaration("font-style", value)
}

public func fontStyle(_ value: CSSFontStyle) -> CSSDeclaration {
  CSSDeclaration("font-style", value.rawValue)
}

public func lineHeight(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("line-height", value.value)
}

public func lineHeight(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("line-height", value.value)
}

public func lineHeight(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("line-height", value.value)
}

public func lineHeight(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("line-height", doubleToString(value))
}

public func lineHeight(_ value: Int) -> CSSDeclaration {
  #if SERVER
    CSSDeclaration("line-height", "\(value)")

  #endif

  #if CLIENT
    CSSDeclaration("line-height", intToString(value))

  #endif
}

public func leadingTrim(_ value: String) -> CSSDeclaration {
  CSSDeclaration("leading-trim", value)
}

public func textAlign(_ value: CSSTextAlign) -> CSSDeclaration {
  CSSDeclaration("text-align", value.rawValue)
}

public func textAlign(_ value: CSSKeyword.Global) -> CSSDeclaration {
  CSSDeclaration("text-align", value.rawValue)
}
@available(*, deprecated)
public func textAlign(_ value: String) -> CSSDeclaration {
  CSSDeclaration("text-align", value)
}

public func fontVariantNumeric(_ value: CSSFontVariantNumeric) -> CSSDeclaration {
  CSSDeclaration("font-variant-numeric", value.rawValue)
}

public func textOverflow(_ value: CSSTextOverflow) -> CSSDeclaration {
  CSSDeclaration("text-overflow", value.value)
}

public func textOverflow(_ value: String) -> CSSDeclaration {
  CSSDeclaration("text-overflow", value)
}

public func color(_ value: CSSColor) -> CSSDeclaration {
  CSSDeclaration("color", value.value)
}

public func color(_ value: String) -> CSSDeclaration {
  CSSDeclaration("color", value)
}

public func color(_ value: CSSKeyword.Global) -> CSSDeclaration {
  CSSDeclaration("color", value.rawValue)
}

public func colorScheme(_ scheme: CSSColorScheme) -> CSSDeclaration {
  CSSDeclaration("color-scheme", scheme.rawValue)
}

public func colorScheme(_ s1: CSSColorScheme, _ s2: CSSColorScheme) -> CSSDeclaration {
  CSSDeclaration("color-scheme", "\(s1.rawValue) \(s2.rawValue)")
}
@available(*, deprecated)
public func colorScheme(_ value: String) -> CSSDeclaration {
  CSSDeclaration("color-scheme", value)
}

public func src(_ value: String) -> CSSDeclaration {
  CSSDeclaration("src", value)
}

public func backgroundColor(_ value: CSSColor) -> CSSDeclaration {
  CSSDeclaration("background-color", value.value)
}

public func backgroundColor(_ value: CSSKeyword.Transparent) -> CSSDeclaration {
  CSSDeclaration("background-color", value.rawValue)
}

public func backgroundColor(_ value: CSSKeyword.Global) -> CSSDeclaration {
  CSSDeclaration("background-color", value.rawValue)
}

public func backgroundColor(_ value: String) -> CSSDeclaration {
  CSSDeclaration("background-color", value)
}

public func borderRadius(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("border-radius", intToString(value))
}

public func borderRadius(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("border-radius", doubleToString(value))
}

public func borderRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("border-radius", value.value)
}

public func borderRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("border-radius", value.value)
}

public func borderRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("border-radius", value.value)
}

public func borderRadius(
  _ topLeft: Length, _ topRight: Length, _ bottomRight: Length, _ bottomLeft: Length
) -> CSSDeclaration {
  CSSDeclaration(
    "border-radius", "\(topLeft.value) \(topRight.value) \(bottomRight.value) \(bottomLeft.value)")
}

public func borderRadius(
  _ tL: LengthPercentage, _ tR: LengthPercentage, _ bR: LengthPercentage, _ bL: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("border-radius", "\(tL.value) \(tR.value) \(bR.value) \(bL.value)")
}

// Directional border radius functions
public func borderTopLeftRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("border-top-left-radius", value.value)
}

public func borderTopLeftRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("border-top-left-radius", value.value)
}

public func borderTopLeftRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("border-top-left-radius", value.value)
}

public func borderTopRightRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("border-top-right-radius", value.value)
}

public func borderTopRightRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("border-top-right-radius", value.value)
}

public func borderTopRightRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("border-top-right-radius", value.value)
}

public func borderBottomLeftRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("border-bottom-left-radius", value.value)
}

public func borderBottomLeftRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("border-bottom-left-radius", value.value)
}

public func borderBottomLeftRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("border-bottom-left-radius", value.value)
}

public func borderBottomRightRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("border-bottom-right-radius", value.value)
}

public func borderBottomRightRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("border-bottom-right-radius", value.value)
}

public func borderBottomRightRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("border-bottom-right-radius", value.value)
}

public func borderStartStartRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("border-start-start-radius", value.value)
}

public func borderStartStartRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("border-start-start-radius", value.value)
}

public func borderStartStartRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("border-start-start-radius", value.value)
}

public func borderStartEndRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("border-start-end-radius", value.value)
}

public func borderStartEndRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("border-start-end-radius", value.value)
}

public func borderStartEndRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("border-start-end-radius", value.value)
}

public func borderEndStartRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("border-end-start-radius", value.value)
}

public func borderEndStartRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("border-end-start-radius", value.value)
}

public func borderEndStartRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("border-end-start-radius", value.value)
}

public func borderEndEndRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("border-end-end-radius", value.value)
}

public func borderEndEndRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("border-end-end-radius", value.value)
}

public func borderEndEndRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("border-end-end-radius", value.value)
}

public func border(_ value: String) -> CSSDeclaration {
  CSSDeclaration("border", value)
}

public func border(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("border", value.rawValue)
}

public func border(_ width: Length, _ style: CSSBorder.LineStyle) -> CSSDeclaration {
  CSSDeclaration("border", "\(width.value) \(style.value)")
}

public func border(_ width: Percentage, _ style: CSSBorder.LineStyle) -> CSSDeclaration {
  CSSDeclaration("border", "\(width.value) \(style.value)")
}

public func border(_ width: LengthPercentage, _ style: CSSBorder.LineStyle) -> CSSDeclaration {
  CSSDeclaration("border", "\(width.value) \(style.value)")
}

public func border(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border", "\(width.value) \(style.value) \(color.value)") }

public func border(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border", "\(width.value) \(style.value) \(color.value)") }

public func border(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border", "\(width.value) \(style.value) \(color.value)") }

public func borderWidth(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("border-width", intToString(value))
}

public func borderWidth(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("border-width", doubleToString(value))
}

public func borderWidth(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("border-width", value.value)
}

public func borderWidth(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("border-width", value.value)
}

public func borderWidth(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("border-width", value.value)
}

public func borderWidth(_ value: String) -> CSSDeclaration {
  CSSDeclaration("border-width", value)
}

public func borderStyle(_ value: CSSBorder.LineStyle) -> CSSDeclaration {
  CSSDeclaration("border-style", value.value)
}

public func borderStyle(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("border-style", value.rawValue)
}

public func borderStyle(_ value: String) -> CSSDeclaration {
  CSSDeclaration("border-style", value)
}

public func fill(_ value: CSSColor) -> CSSDeclaration {
  CSSDeclaration("fill", value.value)
}

public func fill(_ value: SVGPaint) -> CSSDeclaration {
  CSSDeclaration("fill", value.value)
}

public func fill(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("fill", value.rawValue)
}
@_disfavoredOverload
public func fill(_ value: String) -> CSSDeclaration {
  CSSDeclaration("fill", value)
}

public func stroke(_ value: CSSColor) -> CSSDeclaration {
  CSSDeclaration("stroke", value.value)
}

public func stroke(_ value: SVGPaint) -> CSSDeclaration {
  CSSDeclaration("stroke", value.value)
}

public func stroke(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("stroke", value.rawValue)
}
@_disfavoredOverload
public func stroke(_ value: String) -> CSSDeclaration {
  CSSDeclaration("stroke", value)
}

public func fillRule(_ value: String) -> CSSDeclaration {
  CSSDeclaration("fill-rule", value)
}

public func clipRule(_ value: String) -> CSSDeclaration {
  CSSDeclaration("clip-rule", value)
}

public func strokeLinejoin(_ value: String) -> CSSDeclaration {
  CSSDeclaration("stroke-linejoin", value)
}
@_disfavoredOverload
public func strokeMiterlimit(_ value: String) -> CSSDeclaration {
  CSSDeclaration("stroke-miterlimit", value)
}
@_disfavoredOverload
public func strokeMiterlimit(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("stroke-miterlimit", doubleToString(value))
}

public func flexDirection(_ value: CSSFlexDirection) -> CSSDeclaration {
  CSSDeclaration("flex-direction", value.rawValue)
}

public func alignItems(_ value: CSSAlignItems) -> CSSDeclaration {
  CSSDeclaration("align-items", value.rawValue)
}

public func justifyContent(_ value: CSSJustifyContent) -> CSSDeclaration {
  CSSDeclaration("justify-content", value.rawValue)
}
@_disfavoredOverload
public func flexDirection(_ value: String) -> CSSDeclaration {
  CSSDeclaration("flex-direction", value)
}

@_disfavoredOverload
public func alignItems(_ value: String) -> CSSDeclaration {
  CSSDeclaration("align-items", value)
}

public func alignSelf(_ value: String) -> CSSDeclaration {
  CSSDeclaration("align-self", value)
}

public func alignSelf(_ value: CSSAlignSelf) -> CSSDeclaration {
  CSSDeclaration("align-self", value.rawValue)
}
@_disfavoredOverload
public func justifyContent(_ value: String) -> CSSDeclaration {
  CSSDeclaration("justify-content", value)
}

public func boxSizing(_ value: CSSBoxSizing) -> CSSDeclaration {
  CSSDeclaration("box-sizing", value.value)
}
@available(*, deprecated)
public func boxSizing(_ value: String) -> CSSDeclaration {
  CSSDeclaration("box-sizing", value)
}

public func fieldSizing(_ value: CSSFieldSizing) -> CSSDeclaration {
  CSSDeclaration("field-sizing", value.rawValue)
}

public func maxWidth(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("max-width", intToString(value))
}

public func maxWidth(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("max-width", doubleToString(value))
}

public func maxWidth(_ value: Length) -> CSSDeclaration { CSSDeclaration("max-width", value.value) }

public func maxWidth(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("max-width", value.value)
}

public func maxWidth(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("max-width", value.value)
}

public func maxWidth(_ value: CSSKeyword.Length) -> CSSDeclaration {
  CSSDeclaration("max-width", value.rawValue)
}

public func maxWidth(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("max-width", value.rawValue)
}

public func maxWidth(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("max-width", value.rawValue)
}

public func paddingRight(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("padding-right", intToString(value))
}

public func paddingRight(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("padding-right", doubleToString(value))
}

public func paddingRight(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("padding-right", value.value)
}

public func paddingRight(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("padding-right", value.value)
}

public func paddingRight(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding-right", value.value)
}

public func paddingLeft(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("padding-left", intToString(value))
}

public func paddingLeft(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("padding-left", doubleToString(value))
}

public func paddingLeft(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("padding-left", value.value)
}

public func paddingLeft(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("padding-left", value.value)
}

public func paddingLeft(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding-left", value.value)
}
// MARK: - Transition Property
public func transition(_ value: String) -> CSSDeclaration {
  CSSDeclaration("transition", value)
}

public func transition(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("transition", value.rawValue)
}

// transition-property = none | <single-transition-property>#
public func transitionProperty(_ properties: CSSSingleTransitionProperty...) -> CSSDeclaration {
  var results = ""
  for (index, p) in properties.enumerated() {
    results = "\(results)\(p.value)"
    if index < properties.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("transition-property", results)
}

public func transitionProperty(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("transition-property", value.rawValue)
}

// transition-duration = <time>#
public func transitionDuration(_ durations: CSSTime...) -> CSSDeclaration {
  var results = ""
  for (index, d) in durations.enumerated() {
    results = "\(results)\(d.value)"
    if index < durations.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("transition-duration", results)
}

// transition-timing-function = <easing-function>#
public func transitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSDeclaration {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("transition-timing-function", results)
}

public func transitionTimingFunction(_ value: String) -> CSSDeclaration {
  CSSDeclaration("transition-timing-function", value)
}

// transition-delay = <time>#
public func transitionDelay(_ delays: CSSTime...) -> CSSDeclaration {
  var results = ""
  for (index, d) in delays.enumerated() {
    results = "\(results)\(d.value)"
    if index < delays.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("transition-delay", results)
}

// transition-behavior = <transition-behavior-value>#
public func transitionBehavior(_ behaviors: CSSTransitionBehaviorValue...) -> CSSDeclaration {
  var results = ""
  for (index, b) in behaviors.enumerated() {
    results = "\(results)\(b.rawValue)"
    if index < behaviors.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("transition-behavior", results)
}

public func letterSpacing(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("letter-spacing", value.value)
}

public func letterSpacing(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("letter-spacing", value.value)
}

public func letterSpacing(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("letter-spacing", value.value)
}

public func transform(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("transform", value.value)
}

public func transform(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("transform", value.value)
}

public func transform(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("transform", value.value)
}

public func transformStyle(_ value: CSSTransformStyle) -> CSSDeclaration {
  CSSDeclaration("transform-style", value.rawValue)
}

public func transformStyle(_ value: String) -> CSSDeclaration {
  CSSDeclaration("transform-style", value)
}

// transition = <single-transition>#
// <single-transition> = [ none | <single-transition-property> ] || <time> || <easing-function> || <time> || <transition-behavior-value>
public func transition(_ transitions: CSSSingleTransition...) -> CSSDeclaration {
  var results = ""
  for (index, t) in transitions.enumerated() {
    results = "\(results)\(t.value)"
    if index < transitions.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("transition", results)
}

// Convenience: unwrapped tuple syntax
public func transition(_ property: CSSSingleTransitionProperty, _ duration: CSSTime)
  -> CSSDeclaration
{
  transition(CSSSingleTransition(property, duration, .ease))
}

public func transition(_ property: String, _ duration: CSSTime) -> CSSDeclaration {
  CSSDeclaration("transition", "\(property) \(duration.value)")
}

public func transition(_ property: CSSKeyword.All, _ duration: CSSTime) -> CSSDeclaration {
  CSSDeclaration("transition", "all \(duration.value)")
}

public func transition(
  _ property: CSSSingleTransitionProperty, _ duration: CSSTime, _ easingFunction: CSSEasingFunction
) -> CSSDeclaration {
  transition(CSSSingleTransition(property, duration, easingFunction))
}

public func transition(
  _ property: CSSKeyword.All, _ duration: CSSTime, _ easingFunction: CSSEasingFunction
) -> CSSDeclaration {
  CSSDeclaration("transition", "all \(duration.value) \(easingFunction.value)")
}

public func transition(_ property: String, _ duration: CSSTime, _ easingFunction: CSSEasingFunction)
  -> CSSDeclaration
{
  CSSDeclaration("transition", "\(property) \(duration.value) \(easingFunction.value)")
}

public func transition(
  _ property: CSSSingleTransitionProperty, _ duration: CSSTime, _ easingFunction: CSSEasingFunction,
  _ delay: CSSTime
) -> CSSDeclaration {
  transition(CSSSingleTransition(property, duration, easingFunction, delay))
}

public func transition(
  _ property: CSSSingleTransitionProperty, _ duration: CSSTime, _ easingFunction: CSSEasingFunction,
  _ behavior: CSSTransitionBehaviorValue
) -> CSSDeclaration {
  transition(CSSSingleTransition(property, duration, easingFunction, nil, behavior))
}

public func transition(
  _ property: CSSSingleTransitionProperty, _ duration: CSSTime, _ easingFunction: CSSEasingFunction,
  _ delay: CSSTime, _ behavior: CSSTransitionBehaviorValue
) -> CSSDeclaration {
  transition(CSSSingleTransition(property, duration, easingFunction, delay, behavior))
}

// Overload for multiple (property, duration) tuples
public func transition(
  _ transition1: (CSSSingleTransitionProperty, CSSTime),
  _ transition2: (CSSSingleTransitionProperty, CSSTime)
) -> CSSDeclaration {
  transition(
    CSSSingleTransition(transition1.0, transition1.1, .ease),
    CSSSingleTransition(transition2.0, transition2.1, .ease)
  )
}

public func transition(
  _ transition1: (CSSSingleTransitionProperty, CSSTime),
  _ transition2: (CSSSingleTransitionProperty, CSSTime),
  _ transition3: (CSSSingleTransitionProperty, CSSTime)
) -> CSSDeclaration {
  transition(
    CSSSingleTransition(transition1.0, transition1.1, .ease),
    CSSSingleTransition(transition2.0, transition2.1, .ease),
    CSSSingleTransition(transition3.0, transition3.1, .ease)
  )
}

// Convenience: multiple transitions with unwrapped tuples
public func transition(
  _ t1: (CSSSingleTransitionProperty, CSSTime, CSSEasingFunction),
  _ t2: (CSSSingleTransitionProperty, CSSTime, CSSEasingFunction)
) -> CSSDeclaration {
  transition(
    CSSSingleTransition(t1.0, t1.1, t1.2),
    CSSSingleTransition(t2.0, t2.1, t2.2)
  )
}

public func transition(
  _ t1: (CSSSingleTransitionProperty, CSSTime, CSSEasingFunction),
  _ t2: (CSSSingleTransitionProperty, CSSTime, CSSEasingFunction),
  _ t3: (CSSSingleTransitionProperty, CSSTime, CSSEasingFunction)
) -> CSSDeclaration {
  transition(
    CSSSingleTransition(t1.0, t1.1, t1.2),
    CSSSingleTransition(t2.0, t2.1, t2.2),
    CSSSingleTransition(t3.0, t3.1, t3.2)
  )
}

public func transition(
  _ t1: (CSSSingleTransitionProperty, CSSTime, CSSEasingFunction),
  _ t2: (CSSSingleTransitionProperty, CSSTime, CSSEasingFunction),
  _ t3: (CSSSingleTransitionProperty, CSSTime, CSSEasingFunction),
  _ t4: (CSSSingleTransitionProperty, CSSTime, CSSEasingFunction)
) -> CSSDeclaration {
  transition(
    CSSSingleTransition(t1.0, t1.1, t1.2),
    CSSSingleTransition(t2.0, t2.1, t2.2),
    CSSSingleTransition(t3.0, t3.1, t3.2),
    CSSSingleTransition(t4.0, t4.1, t4.2)
  )
}

public func cursor(_ value: CSSCursor) -> CSSDeclaration {
  CSSDeclaration("cursor", value.value)
}

public func cursor(_ urlValue: String, _ fallback: CSSCursor) -> CSSDeclaration {
  CSSDeclaration("cursor", "\(urlValue), \(fallback.value)")
}

public func cursor(_ value: String) -> CSSDeclaration {
  CSSDeclaration("cursor", value)
}

public func outline(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("outline", value.rawValue)
}

public func outline(_ value: CSSKeyword.Global) -> CSSDeclaration {
  CSSDeclaration("outline", value.rawValue)
}

public func outline(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("outline", "\(width.value) \(style.value) \(color.value)") }

public func outline(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("outline", "\(width.value) \(style.value) \(color.value)") }

public func outline(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("outline", "\(width.value) \(style.value) \(color.value)") }

public func outline(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSKeyword.Transparent)
  -> CSSDeclaration
{ CSSDeclaration("outline", "\(width.value) \(style.value) \(color.rawValue)") }

public func outline(_ value: String) -> CSSDeclaration {
  CSSDeclaration("outline", value)
}

public func outlineWidth(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("outline-width", value.value)
}

public func outlineWidth(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("outline-width", value.value)
}

public func outlineWidth(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("outline-width", value.value)
}

public func outlineWidth(_ value: String) -> CSSDeclaration {
  CSSDeclaration("outline-width", value)
}

public func outlineStyle(_ value: CSSBorder.LineStyle) -> CSSDeclaration {
  CSSDeclaration("outline-style", value.value)
}

public func outlineStyle(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("outline-style", value.rawValue)
}

public func outlineStyle(_ value: String) -> CSSDeclaration {
  CSSDeclaration("outline-style", value)
}

public func outlineColor(_ value: CSSColor) -> CSSDeclaration {
  CSSDeclaration("outline-color", value.value)
}

public func outlineColor(_ value: String) -> CSSDeclaration {
  CSSDeclaration("outline-color", value)
}

public func transform(_ value: String) -> CSSDeclaration {
  CSSDeclaration("transform", value)
}

public func transform(_ value: CSSTransformFunction) -> CSSDeclaration {
  CSSDeclaration("transform", value.value)
}

public func transform(_ f1: CSSTransformFunction, _ f2: CSSTransformFunction) -> CSSDeclaration {
  CSSDeclaration("transform", "\(f1.value) \(f2.value)")
}

public func transform(
  _ f1: CSSTransformFunction, _ f2: CSSTransformFunction, _ f3: CSSTransformFunction
) -> CSSDeclaration {
  CSSDeclaration("transform", "\(f1.value) \(f2.value) \(f3.value)")
}

public func transform(
  _ f1: CSSTransformFunction, _ f2: CSSTransformFunction, _ f3: CSSTransformFunction,
  _ f4: CSSTransformFunction
) -> CSSDeclaration {
  CSSDeclaration("transform", "\(f1.value) \(f2.value) \(f3.value) \(f4.value)")
}

public func zIndex(_ value: String) -> CSSDeclaration {
  CSSDeclaration("z-index", value)
}

public func zIndex(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("z-index", "\(value)")
}

public func zIndex(_ value: CSSNumber) -> CSSDeclaration {
  CSSDeclaration("z-index", value.value)
}

public func top(_ value: Int) -> CSSDeclaration { CSSDeclaration("top", intToString(value)) }

public func top(_ value: Double) -> CSSDeclaration { CSSDeclaration("top", doubleToString(value)) }

public func top(_ value: Length) -> CSSDeclaration { CSSDeclaration("top", value.value) }

public func top(_ value: Percentage) -> CSSDeclaration { CSSDeclaration("top", value.value) }

public func top(_ value: LengthPercentage) -> CSSDeclaration { CSSDeclaration("top", value.value) }

public func left(_ value: Int) -> CSSDeclaration { CSSDeclaration("left", intToString(value)) }

public func left(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("left", doubleToString(value))
}

public func left(_ value: Length) -> CSSDeclaration { CSSDeclaration("left", value.value) }

public func left(_ value: Percentage) -> CSSDeclaration { CSSDeclaration("left", value.value) }

public func left(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("left", value.value)
}

public func right(_ value: Int) -> CSSDeclaration { CSSDeclaration("right", intToString(value)) }

public func right(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("right", doubleToString(value))
}

public func right(_ value: Length) -> CSSDeclaration { CSSDeclaration("right", value.value) }

public func right(_ value: Percentage) -> CSSDeclaration { CSSDeclaration("right", value.value) }

public func right(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("right", value.value)
}

public func bottom(_ value: Int) -> CSSDeclaration { CSSDeclaration("bottom", intToString(value)) }

public func bottom(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("bottom", doubleToString(value))
}

public func bottom(_ value: Length) -> CSSDeclaration { CSSDeclaration("bottom", value.value) }

public func bottom(_ value: Percentage) -> CSSDeclaration { CSSDeclaration("bottom", value.value) }

public func bottom(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("bottom", value.value)
}

public func overflowY(_ value: String) -> CSSDeclaration {
  CSSDeclaration("overflow-y", value)
}

public func overflowY(_ value: CSSOverflow) -> CSSDeclaration {
  CSSDeclaration("overflow-y", value.rawValue)
}

public func overflowY(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("overflow-y", value.rawValue)
}

public func overflowX(_ value: String) -> CSSDeclaration {
  CSSDeclaration("overflow-x", value)
}

public func overflowX(_ value: CSSOverflow) -> CSSDeclaration {
  CSSDeclaration("overflow-x", value.rawValue)
}

public func overflowX(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("overflow-x", value.rawValue)
}

public func overflow(_ value: String) -> CSSDeclaration {
  CSSDeclaration("overflow", value)
}

public func overflow(_ value: CSSOverflow) -> CSSDeclaration {
  CSSDeclaration("overflow", value.rawValue)
}

public func overflow(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("overflow", value.rawValue)
}

public func objectFit(_ value: CSSObjectFit) -> CSSDeclaration {
  CSSDeclaration("object-fit", value.rawValue)
}

public func objectFit(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("object-fit", value.rawValue)
}

public func objectFit(_ value: String) -> CSSDeclaration {
  CSSDeclaration("object-fit", value)
}

public func objectPosition(_ value: CSSObjectPosition) -> CSSDeclaration {
  CSSDeclaration("object-position", value.rawValue)
}

public func objectPosition(_ value: String) -> CSSDeclaration {
  CSSDeclaration("object-position", value)
}

public func maxHeight(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("max-height", intToString(value))
}

public func maxHeight(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("max-height", doubleToString(value))
}

public func maxHeight(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("max-height", value.value)
}

public func maxHeight(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("max-height", value.value)
}

public func maxHeight(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("max-height", value.value)
}

public func minWidth(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("min-width", intToString(value))
}

public func minWidth(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("min-width", doubleToString(value))
}

public func minWidth(_ value: Length) -> CSSDeclaration { CSSDeclaration("min-width", value.value) }

public func minWidth(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("min-width", value.value)
}

public func minWidth(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("min-width", value.value)
}

public func minHeight(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("min-height", intToString(value))
}

public func minHeight(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("min-height", doubleToString(value))
}

public func minHeight(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("min-height", value.value)
}

public func minHeight(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("min-height", value.value)
}

public func minHeight(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("min-height", value.value)
}

public func marginTop(_ value: String) -> CSSDeclaration {
  CSSDeclaration("margin-top", value)
}

public func marginTop(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("margin-top", value.rawValue)
}

public func marginTop(_ value: CSSKeyword.Global) -> CSSDeclaration {
  CSSDeclaration("margin-top", value.rawValue)
}

public func marginTop(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("margin-top", intToString(value))
}

public func marginTop(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("margin-top", doubleToString(value))
}

public func marginTop(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("margin-top", value.value)
}

public func marginTop(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("margin-top", value.value)
}

public func marginTop(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("margin-top", value.value)
}

public func marginLeft(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("margin-left", intToString(value))
}

public func marginLeft(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("margin-left", doubleToString(value))
}

public func marginLeft(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("margin-left", value.value)
}

public func marginLeft(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("margin-left", value.value)
}

public func marginLeft(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("margin-left", value.value)
}

public func marginBottom(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("margin-bottom", intToString(value))
}

public func marginBottom(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("margin-bottom", doubleToString(value))
}

public func marginBottom(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("margin-bottom", value.value)
}

public func marginBottom(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("margin-bottom", value.value)
}

public func marginBottom(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("margin-bottom", value.value)
}

public func marginRight(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("margin-right", intToString(value))
}

public func marginRight(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("margin-right", doubleToString(value))
}

public func marginRight(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("margin-right", value.value)
}

public func marginRight(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("margin-right", value.value)
}

public func marginRight(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("margin-right", value.value)
}

public func paddingTop(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("padding-top", intToString(value))
}

public func paddingTop(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("padding-top", doubleToString(value))
}

public func paddingTop(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("padding-top", value.value)
}

public func paddingTop(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("padding-top", value.value)
}

public func paddingTop(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding-top", value.value)
}

public func paddingBottom(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("padding-bottom", intToString(value))
}

public func paddingBottom(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("padding-bottom", doubleToString(value))
}

public func paddingBottom(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("padding-bottom", value.value)
}

public func paddingBottom(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("padding-bottom", value.value)
}

public func paddingBottom(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding-bottom", value.value)
}

public func textDecoration(_ value: String) -> CSSDeclaration {
  CSSDeclaration("text-decoration", value)
}

public func textDecoration(_ value: CSSTextDecoration) -> CSSDeclaration {
  CSSDeclaration("text-decoration", value.value)
}

public func textDecoration(_ value: CSSTextDecoration.Line) -> CSSDeclaration {
  CSSDeclaration("text-decoration", value.value)
}

public func textDecoration(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("text-decoration", value.rawValue)
}

public func letterSpacing(_ value: String) -> CSSDeclaration {
  CSSDeclaration("letter-spacing", value)
}

public func textTransform(_ value: String) -> CSSDeclaration {
  CSSDeclaration("text-transform", value)
}

public func textTransform(_ value: CSSTextTransform) -> CSSDeclaration {
  CSSDeclaration("text-transform", value.rawValue)
}

public func textTransform(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("text-transform", value.rawValue)
}

public func textTransform(_ value: CSSKeyword.Global) -> CSSDeclaration {
  CSSDeclaration("text-transform", value.rawValue)
}

public func whiteSpace(_ value: String) -> CSSDeclaration {
  CSSDeclaration("white-space", value)
}

public func wordWrap(_ value: String) -> CSSDeclaration {
  CSSDeclaration("word-wrap", value)
}

public func wordWrap(_ value: CSSWordWrap) -> CSSDeclaration {
  CSSDeclaration("word-wrap", value.rawValue)
}

public func listStyle(_ value: String) -> CSSDeclaration {
  CSSDeclaration("list-style", value)
}

public func listStyle(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("list-style", value.rawValue)
}

public func listStyleType(_ value: String) -> CSSDeclaration {
  CSSDeclaration("list-style-type", value)
}

public func listStyleType(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("list-style-type", value.rawValue)
}

public func borderBottom(_ value: String) -> CSSDeclaration {
  CSSDeclaration("border-bottom", value)
}

public func borderBottom(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("border-bottom", value.rawValue)
}

public func borderBottom(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-bottom", "\(width.value) \(style.value) \(color.value)") }

public func borderBottom(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-bottom", "\(width.value) \(style.value) \(color.value)") }

public func borderBottom(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-bottom", "\(width.value) \(style.value) \(color.value)") }

public func borderBottom(
  _ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSKeyword.Transparent
) -> CSSDeclaration {
  CSSDeclaration("border-bottom", "\(width.value) \(style.value) \(color.rawValue)")
}

public func borderTop(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("border-top", value.rawValue)
}

public func borderTop(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-top", "\(width.value) \(style.value) \(color.value)") }

public func borderTop(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-top", "\(width.value) \(style.value) \(color.value)") }

public func borderTop(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-top", "\(width.value) \(style.value) \(color.value)") }

public func borderRight(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("border-right", value.rawValue)
}

public func borderRight(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-right", "\(width.value) \(style.value) \(color.value)") }

public func borderRight(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-right", "\(width.value) \(style.value) \(color.value)") }

public func borderRight(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-right", "\(width.value) \(style.value) \(color.value)") }

public func borderLeft(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("border-left", value.rawValue)
}

public func borderLeft(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-left", "\(width.value) \(style.value) \(color.value)") }

public func borderLeft(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-left", "\(width.value) \(style.value) \(color.value)") }

public func borderLeft(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-left", "\(width.value) \(style.value) \(color.value)") }

public func borderColor(_ value: String) -> CSSDeclaration {
  CSSDeclaration("border-color", value)
}

public func borderColor(_ value: CSSColor) -> CSSDeclaration {
  CSSDeclaration("border-color", value.value)
}

public func borderColor(_ value: CSSKeyword.Transparent) -> CSSDeclaration {
  CSSDeclaration("border-color", value.rawValue)
}

public func borderTopColor(_ value: String) -> CSSDeclaration {
  CSSDeclaration("border-top-color", value)
}

public func borderTopColor(_ value: CSSColor) -> CSSDeclaration {
  CSSDeclaration("border-top-color", value.value)
}

public func borderBottomColor(_ value: String) -> CSSDeclaration {
  CSSDeclaration("border-bottom-color", value)
}

public func borderBottomColor(_ value: CSSColor) -> CSSDeclaration {
  CSSDeclaration("border-bottom-color", value.value)
}

public func borderLeftColor(_ value: String) -> CSSDeclaration {
  CSSDeclaration("border-left-color", value)
}

public func borderLeftColor(_ value: CSSColor) -> CSSDeclaration {
  CSSDeclaration("border-left-color", value.value)
}

public func borderLeftStyle(_ value: CSSBorder.LineStyle) -> CSSDeclaration {
  CSSDeclaration("border-left-style", value.value)
}

public func borderLeftStyle(_ value: String) -> CSSDeclaration {
  CSSDeclaration("border-left-style", value)
}

public func borderLeftWidth(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("border-left-width", value.value)
}

public func borderLeftWidth(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("border-left-width", intToString(value))
}

public func borderRightColor(_ value: String) -> CSSDeclaration {
  CSSDeclaration("border-right-color", value)
}

public func borderRightColor(_ value: CSSColor) -> CSSDeclaration {
  CSSDeclaration("border-right-color", value.value)
}

public func borderCollapse(_ value: String) -> CSSDeclaration {
  CSSDeclaration("border-collapse", value)
}

public func borderCollapse(_ value: CSSBorderCollapse) -> CSSDeclaration {
  CSSDeclaration("border-collapse", value.rawValue)
}

public func tableLayout(_ value: String) -> CSSDeclaration {
  CSSDeclaration("table-layout", value)
}

public func tableLayout(_ value: CSSTableLayout) -> CSSDeclaration {
  CSSDeclaration("table-layout", value.rawValue)
}

public func flex(_ value: String) -> CSSDeclaration {
  CSSDeclaration("flex", value)
}

public func flex(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("flex", "\(value)")
}

public func flex(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("flex", doubleToString(value))
}

public func flexGrow(_ value: String) -> CSSDeclaration {
  CSSDeclaration("flex-grow", value)
}

public func flexGrow(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("flex-grow", "\(value)")
}

public func flexGrow(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("flex-grow", doubleToString(value))
}

public func flexShrink(_ value: String) -> CSSDeclaration {
  CSSDeclaration("flex-shrink", value)
}

public func flexShrink(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("flex-shrink", "\(value)")
}

public func flexShrink(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("flex-shrink", doubleToString(value))
}

public func flexWrap(_ value: CSSFlexWrap) -> CSSDeclaration {
  CSSDeclaration("flex-wrap", value.rawValue)
}

public func flexWrap(_ value: String) -> CSSDeclaration {
  CSSDeclaration("flex-wrap", value)
}
// flexBasis consolidated to String and Global, added protocol-based one if missing
public func flexBasis(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("flex-basis", value.value)
}

public func flexBasis(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("flex-basis", value.value)
}

public func flexBasis(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("flex-basis", value.value)
}

public func flexBasis(_ value: CSSKeyword.Global) -> CSSDeclaration {
  CSSDeclaration("flex-basis", value.rawValue)
}

public func flexBasis(_ value: String) -> CSSDeclaration {
  CSSDeclaration("flex-basis", value)
}

public func order(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("order", "\(value)")
}

public func order(_ value: String) -> CSSDeclaration {
  CSSDeclaration("order", value)
}

public func verticalAlign(_ value: String) -> CSSDeclaration {
  CSSDeclaration("vertical-align", value)
}

public func verticalAlign(_ value: CSSVerticalAlign) -> CSSDeclaration {
  CSSDeclaration("vertical-align", value.rawValue)
}

public func scrollbarWidth(_ value: CSSScrollbarWidth) -> CSSDeclaration {
  CSSDeclaration("scrollbar-width", value.value)
}

public func scrollbarWidth(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("scrollbar-width", value.rawValue)
}

public func scrollbarWidth(_ value: String) -> CSSDeclaration {
  CSSDeclaration("scrollbar-width", value)
}

public func background(_ value: CSSColor) -> CSSDeclaration {
  CSSDeclaration("background", value.value)
}

public func background(_ value: CSSKeyword.Transparent) -> CSSDeclaration {
  CSSDeclaration("background", value.rawValue)
}

public func background(_ value: CSSImage.Gradient) -> CSSDeclaration {
  CSSDeclaration("background", value.value)
}

public func background(_ value: String) -> CSSDeclaration {
  CSSDeclaration("background", value)
}

public func backgroundImage(_ value: String) -> CSSDeclaration {
  CSSDeclaration("background-image", value)
}

public func backgroundSize(_ value: CSSBackgroundSize) -> CSSDeclaration {
  CSSDeclaration("background-size", value.value)
}

public func backgroundSize(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("background-size", value.rawValue)
}

public func backgroundSize(_ value: String) -> CSSDeclaration {
  CSSDeclaration("background-size", value)
}

public func backgroundSize(_ width: Length, _ height: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("background-size", "\(width.value) \(height.rawValue)")
}

public func backgroundRepeat(_ value: CSSBackgroundRepeat) -> CSSDeclaration {
  CSSDeclaration("background-repeat", value.rawValue)
}

public func backgroundRepeat(_ value: String) -> CSSDeclaration {
  CSSDeclaration("background-repeat", value)
}

public func backgroundPosition(_ value: String) -> CSSDeclaration {
  CSSDeclaration("background-position", value)
}

public func backgroundPosition(_ value: CSSBackgroundPosition) -> CSSDeclaration {
  CSSDeclaration("background-position", value.value)
}

public func backgroundPosition(
  _ x: CSSBackgroundPosition, _ xOffset: Length, _ y: CSSBackgroundPosition
) -> CSSDeclaration {
  CSSDeclaration("background-position", "\(x.value) \(xOffset.value) \(y.value)")
}

public func backgroundPosition(
  _ x: CSSBackgroundPosition, _ xOffset: Length, _ y: CSSBackgroundPosition, _ yOffset: Length
) -> CSSDeclaration {
  CSSDeclaration("background-position", "\(x.value) \(xOffset.value) \(y.value) \(yOffset.value)")
}

public func appearance(_ value: String) -> CSSDeclaration {
  CSSDeclaration("appearance", value)
}

public func appearance(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("appearance", value.rawValue)
}

public func appearance(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("appearance", value.rawValue)
}

public func appearance(_ value: CSSAppearance) -> CSSDeclaration {
  CSSDeclaration("appearance", value.rawValue)
}

public func appearance(_ value: CSSAppearance.CompatAuto) -> CSSDeclaration {
  CSSDeclaration("appearance", value.rawValue)
}

public func appearance(_ value: CSSAppearance.CompatSpecial) -> CSSDeclaration {
  CSSDeclaration("appearance", value.rawValue)
}

public func pointerEvents(_ value: String) -> CSSDeclaration {
  CSSDeclaration("pointer-events", value)
}

public func pointerEvents(_ value: CSSPointerEvents) -> CSSDeclaration {
  CSSDeclaration("pointer-events", value.rawValue)
}

public func pointerEvents(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("pointer-events", value.rawValue)
}

public func pointerEvents(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("pointer-events", value.rawValue)
}

@_disfavoredOverload
public func strokeWidth(_ value: String) -> CSSDeclaration {
  CSSDeclaration("stroke-width", value)
}

public func strokeWidth(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("stroke-width", value.value)
}

public func strokeWidth(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("stroke-width", value.value)
}

public func strokeWidth(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("stroke-width", value.value)
}

public func strokeOpacity(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("stroke-opacity", doubleToString(value))
}

public func strokeOpacity(_ value: String) -> CSSDeclaration {
  CSSDeclaration("stroke-opacity", value)
}

public func strokeLinecap(_ value: String) -> CSSDeclaration {
  CSSDeclaration("stroke-linecap", value)
}

public func dominantBaseline(_ value: CSSDominantBaseline) -> CSSDeclaration {
  CSSDeclaration("dominant-baseline", value.rawValue)
}

public func alignmentBaseline(_ value: CSSAlignmentBaseline) -> CSSDeclaration {
  CSSDeclaration("alignment-baseline", value.rawValue)
}

public func textAnchor(_ value: CSSTextAnchor) -> CSSDeclaration {
  CSSDeclaration("text-anchor", value.rawValue)
}

@_disfavoredOverload
public func opacity(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("opacity", doubleToString(value))
}

@_disfavoredOverload
public func opacity(_ value: String) -> CSSDeclaration {
  CSSDeclaration("opacity", value)
}

public func opacity(_ value: CSSNumber) -> CSSDeclaration {
  CSSDeclaration("opacity", value.value)
}

public func gap(_ value: Int) -> CSSDeclaration { CSSDeclaration("gap", intToString(value)) }

public func gap(_ value: Double) -> CSSDeclaration { CSSDeclaration("gap", doubleToString(value)) }

public func gap(_ value: Length) -> CSSDeclaration { CSSDeclaration("gap", value.value) }

public func gap(_ value: Percentage) -> CSSDeclaration { CSSDeclaration("gap", value.value) }

public func gap(_ value: LengthPercentage) -> CSSDeclaration { CSSDeclaration("gap", value.value) }

public func gap(_ rowGap: Length, _ columnGap: Length) -> CSSDeclaration {
  CSSDeclaration("gap", "\(rowGap.value) \(columnGap.value)")
}

public func gap(_ rowGap: Percentage, _ columnGap: Percentage) -> CSSDeclaration {
  CSSDeclaration("gap", "\(rowGap.value) \(columnGap.value)")
}

public func gap(_ rowGap: LengthPercentage, _ columnGap: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("gap", "\(rowGap.value) \(columnGap.value)")
}

public func gap(_ rowGap: Length, _ columnGap: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("gap", "\(rowGap.value) \(columnGap.value)")
}

public func gap(_ rowGap: LengthPercentage, _ columnGap: Length) -> CSSDeclaration {
  CSSDeclaration("gap", "\(rowGap.value) \(columnGap.value)")
}

public func content(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("content", value.rawValue)
}

public func content(_ value: String) -> CSSDeclaration {
  CSSDeclaration("content", value)
}

// CSSContent content with counter() function
public func content(_ counter: CSSCounter, _ suffix: String = "") -> CSSDeclaration {
  let value =
    stringIsEmpty(suffix) ? "counter(\(counter.name))" : "counter(\(counter.name)) \"\(suffix)\""
  return CSSDeclaration("content", value)
}

public func content(_ c1: CSSCounter, _ s1: String, _ c2: CSSCounter, _ s2: String)
  -> CSSDeclaration
{
  let value = "counter(\(c1.name)) \"\(s1)\" counter(\(c2.name)) \"\(s2)\""
  return CSSDeclaration("content", value)
}

public func content(_ c: CSSCounters, _ s: String) -> CSSDeclaration {
  let value = "counters(\(c.name), \"\(c.delimiter)\") \"\(s)\""
  return CSSDeclaration("content", value)
}

public func content(_ items: CSSContentItem...) -> CSSDeclaration {
  var results = ""
  for (index, item) in items.enumerated() {
    switch item {
    case .counter(let counter):
      results = "\(results)counter(\(counter.name))"
    case .counters(let counters):
      results = "\(results)counters(\(counters.name), \"\(counters.delimiter)\")"
    case .string(let str):
      results = "\(results)\"\(str)\""
    }
    if index < items.count - 1 {
      results = "\(results) "
    }
  }
  return CSSDeclaration("content", results)
}

public func counter(_ name: String) -> CSSCounter {
  CSSCounter(name)
}

public func counters(_ name: String, _ delimiter: String) -> CSSCounters {
  CSSCounters(name, delimiter)
}

public func counterReset(_ name: String) -> CSSDeclaration {
  CSSDeclaration("counter-reset", name)
}

public func counterIncrement(_ name: String) -> CSSDeclaration {
  CSSDeclaration("counter-increment", name)
}

// box-shadow = <spread-shadow>#
public func boxShadow(_ shadows: CSSSpreadShadow...) -> CSSDeclaration {
  var results = ""
  for (index, s) in shadows.enumerated() {
    results = "\(results)\(s.value)"
    if index < shadows.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("box-shadow", results)
}

// Convenience: Apply color to shadow (e.g., boxShadow(boxShadowOutsetSmall, boxShadowColorProgressiveFocus))
public func boxShadow(_ shadow: CSSSpreadShadow, _ color: CSSColor) -> CSSDeclaration {
  // Combine the shadow with the color by prepending color to shadow value
  let value = "\(color.value) \(shadow.value)"
  return CSSDeclaration("box-shadow", value)
}

// Convenience: Two shadows with colors (e.g., boxShadow((boxShadowOutsetMediumBelow, boxShadowColorAlphaBase), (boxShadowOutsetMediumAround, boxShadowColorAlphaBase)))
public func boxShadow(
  _ shadow1: (CSSSpreadShadow, CSSColor), _ shadow2: (CSSSpreadShadow, CSSColor)
) -> CSSDeclaration {
  let value1 = "\(shadow1.1.value) \(shadow1.0.value)"
  let value2 = "\(shadow2.1.value) \(shadow2.0.value)"
  return CSSDeclaration("box-shadow", "\(value1), \(value2)")
}

public func boxShadow(
  _ shadow1: (Length, Length, Length, CSSColor), _ shadow2: (Length, Length, Length, CSSColor)
) -> CSSDeclaration {
  CSSDeclaration(
    "box-shadow",
    "\(shadow1.0.value) \(shadow1.1.value) \(shadow1.2.value) \(shadow1.3.value), \(shadow2.0.value) \(shadow2.1.value) \(shadow2.2.value) \(shadow2.3.value)"
  )
}

public func boxShadow(
  _ shadow1: (LengthPercentage, LengthPercentage, LengthPercentage, CSSColor),
  _ shadow2: (LengthPercentage, LengthPercentage, LengthPercentage, CSSColor)
) -> CSSDeclaration {
  CSSDeclaration(
    "box-shadow",
    "\(shadow1.0.value) \(shadow1.1.value) \(shadow1.2.value) \(shadow1.3.value), \(shadow2.0.value) \(shadow2.1.value) \(shadow2.2.value) \(shadow2.3.value)"
  )
}

// Convenience: color, offsetX, offsetY, blur, spread, position (CSSColor)
public func boxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length,
  _ spread: Length, _ position: CSSSpreadShadow.BoxShadowPosition
) -> CSSDeclaration {
  boxShadow(
    CSSSpreadShadow(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSSSpreadShadow.BoxShadowBlur(blur),
      spread: CSSSpreadShadow.BoxShadowSpread(spread),
      position: position
    ))
}

public func boxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length,
  _ spread: Length
) -> CSSDeclaration {
  boxShadow(
    CSSSpreadShadow(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSSSpreadShadow.BoxShadowBlur(blur),
      spread: CSSSpreadShadow.BoxShadowSpread(spread)
    ))
}

// Convenience: offsetX, offsetY, blur, spread, color (color last)
public func boxShadow(
  _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length, _ color: CSSColor
) -> CSSDeclaration {
  boxShadow(
    CSSSpreadShadow(
      color: CSSSpreadShadow.BoxShadowColor(color),
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSSSpreadShadow.BoxShadowBlur(blur),
      spread: CSSSpreadShadow.BoxShadowSpread(spread)
    ))
}

public func boxShadow(_ offsetX: Length, _ offsetY: Length, _ blur: Length, _ color: CSSColor)
  -> CSSDeclaration
{
  boxShadow(
    CSSSpreadShadow(
      color: CSSSpreadShadow.BoxShadowColor(color),
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSSSpreadShadow.BoxShadowBlur(blur)
    ))
}

public func boxShadow(_ offsetX: Length, _ offsetY: Length, _ color: CSSColor) -> CSSDeclaration {
  boxShadow(
    CSSSpreadShadow(
      color: CSSSpreadShadow.BoxShadowColor(color),
      offsetX: offsetX,
      offsetY: offsetY
    ))
}

public func boxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length
) -> CSSDeclaration {
  boxShadow(
    CSSSpreadShadow(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSSSpreadShadow.BoxShadowBlur(blur)
    ))
}

public func boxShadow(_ color: CSSColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length)
  -> CSSDeclaration
{
  boxShadow(
    CSSSpreadShadow(
      color: CSSSpreadShadow.BoxShadowColor(color),
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSSSpreadShadow.BoxShadowBlur(blur)
    ))
}

public func boxShadow(
  _ offsetX: Int, _ offsetY: Int, _ blur: Int, _ spread: Length, _ color: CSSColor
) -> CSSDeclaration {
  boxShadow(
    Length(integerLiteral: offsetX), Length(integerLiteral: offsetY), Length(integerLiteral: blur),
    spread, color)
}

public func boxShadow(_ offsetX: Int, _ offsetY: Int, _ blur: Int, _ color: CSSColor)
  -> CSSDeclaration
{
  boxShadow(
    color, Length(integerLiteral: offsetX), Length(integerLiteral: offsetY),
    Length(integerLiteral: blur))
}

// Convenience: color, offsetX, offsetY (no blur, spread, position) (CSSColor)
public func boxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length)
  -> CSSDeclaration
{
  boxShadow(
    CSSSpreadShadow(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY
    ))
}

public func boxShadow(_ value: String) -> CSSDeclaration {
  CSSDeclaration("box-shadow", value)
}

public func boxShadow(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("box-shadow", value.rawValue)
}

public func listStylePosition(_ value: CSSListStylePosition) -> CSSDeclaration {
  CSSDeclaration("list-style-position", value.rawValue)
}

public func listStylePosition(_ value: String) -> CSSDeclaration {
  CSSDeclaration("list-style-position", value)
}

// Convenience: position-first overload for inset shadows
// Usage: boxShadow(.inset, 0, 0, 0, px(1), color)
public func boxShadow(
  _ position: CSSSpreadShadow.BoxShadowPosition, _ offsetX: Length, _ offsetY: Length,
  _ blur: Length, _ spread: Length, _ color: CSSColor
) -> CSSDeclaration {
  boxShadow(
    CSSSpreadShadow(
      color: CSSSpreadShadow.BoxShadowColor(color),
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSSSpreadShadow.BoxShadowBlur(blur),
      spread: CSSSpreadShadow.BoxShadowSpread(spread),
      position: position
    ))
}

// Convenience: position-first without blur
// Usage: boxShadow(.inset, px(2), px(2), color)
public func boxShadow(
  _ position: CSSSpreadShadow.BoxShadowPosition, _ offsetX: Length, _ offsetY: Length,
  _ color: CSSColor
) -> CSSDeclaration {
  boxShadow(
    CSSSpreadShadow(
      color: CSSSpreadShadow.BoxShadowColor(color),
      offsetX: offsetX,
      offsetY: offsetY,
      position: position
    ))
}

public func boxShadow(
  _ position: CSSSpreadShadow.BoxShadowPosition, _ offsetX: Int, _ offsetY: Int, _ blur: Int,
  _ spread: Length, _ color: CSSColor
) -> CSSDeclaration {
  boxShadow(
    position, Length(integerLiteral: offsetX), Length(integerLiteral: offsetY),
    Length(integerLiteral: blur), spread, color)
}

public func outlineOffset(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("outline-offset", value.value)
}

public func outlineOffset(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("outline-offset", value.value)
}

public func outlineOffset(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("outline-offset", value.value)
}
// MARK: - Animation
// animation = <single-animation>#
public func animation(_ animations: CSSSingleAnimation...) -> CSSDeclaration {
  var results = ""
  for (index, a) in animations.enumerated() {
    results = "\(results)\(a.value)"
    if index < animations.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("animation", results)
}

public func animation(_ value: String) -> CSSDeclaration {
  CSSDeclaration("animation", value)
}

// Convenience: unwrapped tuple syntax - minimal 3-param (name, duration, easing)
public func animation(_ name: String, _ duration: CSSTime, _ easingFunction: CSSEasingFunction)
  -> CSSDeclaration
{
  animation(
    CSSSingleAnimation(
      duration: .time(duration),
      easingFunction: easingFunction,
      name: .name(name)
    ))
}

// With iteration count (4 params)
public func animation(
  _ name: String, _ duration: CSSTime, _ easingFunction: CSSEasingFunction,
  _ iterationCount: CSSSingleAnimationIterationCount
) -> CSSDeclaration {
  animation(
    CSSSingleAnimation(
      duration: .time(duration),
      easingFunction: easingFunction,
      iterationCount: iterationCount,
      name: .name(name)
    ))
}

// Convenience: accept CSSTime directly (auto-wraps in duration type)
public func animation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String,
  _ iterationCount: CSSSingleAnimationIterationCount
) -> CSSDeclaration {
  animation(
    CSSSingleAnimation(
      duration: .time(duration),
      easingFunction: easingFunction,
      iterationCount: iterationCount,
      name: .name(name)
    ))
}

// With timeline as CSSScroll
public func animation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll
) -> CSSDeclaration {
  animation(
    CSSSingleAnimation(
      duration: .time(duration),
      easingFunction: easingFunction,
      name: .name(name),
      timeline: .scroll(timeline)
    ))
}

// With timeline as CSSView
public func animation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView
) -> CSSDeclaration {
  animation(
    CSSSingleAnimation(
      duration: .time(duration),
      easingFunction: easingFunction,
      name: .name(name),
      timeline: .view(timeline)
    ))
}

// With timeline as String (auto-converts to dashed-ident)
public func animation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String
) -> CSSDeclaration {
  animation(
    CSSSingleAnimation(
      duration: .time(duration),
      easingFunction: easingFunction,
      name: .name(name),
      timeline: .dashedIdent(CSSDashedIdent(timeline))
    ))
}

// Full parameter convenience (5 params)
public func animation(
  duration: CSSAnimationDuration? = nil,
  easingFunction: CSSEasingFunction? = nil,
  delay: CSSAnimationDelay? = nil,
  iterationCount: CSSSingleAnimationIterationCount? = nil,
  direction: CSSSingleAnimationDirection? = nil,
  fillMode: CSSSingleAnimationFillMode? = nil,
  playState: CSSSingleAnimationPlayState? = nil,
  name: CSSKeyframesName? = nil,
  timeline: CSSSingleAnimationTimeline? = nil
) -> CSSDeclaration {
  animation(
    CSSSingleAnimation(
      duration: duration,
      easingFunction: easingFunction,
      delay: delay,
      iterationCount: iterationCount,
      direction: direction,
      fillMode: fillMode,
      playState: playState,
      name: name,
      timeline: timeline
    ))
}

public func animation(
  duration: CSSTime? = nil,
  easingFunction: CSSEasingFunction? = nil,
  delay: CSSTime? = nil,
  iterationCount: CSSSingleAnimationIterationCount? = nil,
  direction: CSSSingleAnimationDirection? = nil,
  fillMode: CSSSingleAnimationFillMode? = nil,
  playState: CSSSingleAnimationPlayState? = nil,
  name: CSSKeyframesName? = nil,
  timeline: CSSSingleAnimationTimeline? = nil
) -> CSSDeclaration {
  animation(
    CSSSingleAnimation(
      duration: duration.map { .time($0) },
      easingFunction: easingFunction,
      delay: delay.map { CSSAnimationDelay($0) },
      iterationCount: iterationCount,
      direction: direction,
      fillMode: fillMode,
      playState: playState,
      name: name,
      timeline: timeline
    ))
}

// Multiple animations with tuples (2-4 animations)
public func animation(
  _ a1: (CSSTime, CSSEasingFunction, String, CSSSingleAnimationIterationCount),
  _ a2: (CSSTime, CSSEasingFunction, String, CSSSingleAnimationIterationCount)
) -> CSSDeclaration {
  animation(
    CSSSingleAnimation(
      duration: .time(a1.0), easingFunction: a1.1, iterationCount: a1.3, name: .name(a1.2)),
    CSSSingleAnimation(
      duration: .time(a2.0), easingFunction: a2.1, iterationCount: a2.3, name: .name(a2.2))
  )
}

public func animation(
  _ a1: (CSSTime, CSSEasingFunction, String, CSSSingleAnimationIterationCount),
  _ a2: (CSSTime, CSSEasingFunction, String, CSSSingleAnimationIterationCount),
  _ a3: (CSSTime, CSSEasingFunction, String, CSSSingleAnimationIterationCount)
) -> CSSDeclaration {
  animation(
    CSSSingleAnimation(
      duration: .time(a1.0), easingFunction: a1.1, iterationCount: a1.3, name: .name(a1.2)),
    CSSSingleAnimation(
      duration: .time(a2.0), easingFunction: a2.1, iterationCount: a2.3, name: .name(a2.2)),
    CSSSingleAnimation(
      duration: .time(a3.0), easingFunction: a3.1, iterationCount: a3.3, name: .name(a3.2))
  )
}

// animation-name = [ none | <keyframes-name> ]#
public func animationName(_ value: String) -> CSSDeclaration {
  CSSDeclaration("animation-name", value)
}

public func animationName(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("animation-name", value.rawValue)
}

// animation-duration = [ auto | <time [0s,∞]> ]#
public func animationDuration(_ durations: CSSTime...) -> CSSDeclaration {
  var results = ""
  for (index, d) in durations.enumerated() {
    results = "\(results)\(d.value)"
    if index < durations.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("animation-duration", results)
}

public func animationDuration(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("animation-duration", value.rawValue)
}

public func animationDuration(_ value: String) -> CSSDeclaration {
  CSSDeclaration("animation-duration", value)
}

// animation-timing-function = <easing-function>#
public func animationTimingFunction(_ functions: CSSEasingFunction...) -> CSSDeclaration {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("animation-timing-function", results)
}

public func animationTimingFunction(_ value: String) -> CSSDeclaration {
  CSSDeclaration("animation-timing-function", value)
}

// animation-delay = <time>#
public func animationDelay(_ delays: CSSTime...) -> CSSDeclaration {
  var results = ""
  for (index, d) in delays.enumerated() {
    results = "\(results)\(d.value)"
    if index < delays.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("animation-delay", results)
}

public func animationDelay(_ value: String) -> CSSDeclaration {
  CSSDeclaration("animation-delay", value)
}

// animation-iteration-count = <single-animation-iteration-count>#
public func animationIterationCount(_ counts: CSSSingleAnimationIterationCount...) -> CSSDeclaration
{
  var results = ""
  for (index, c) in counts.enumerated() {
    results = "\(results)\(c.value)"
    if index < counts.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("animation-iteration-count", results)
}

public func animationIterationCount(_ value: CSSKeyword.Infinite) -> CSSDeclaration {
  CSSDeclaration("animation-iteration-count", value.rawValue)
}

public func animationIterationCount(_ value: String) -> CSSDeclaration {
  CSSDeclaration("animation-iteration-count", value)
}

// animation-direction = <single-animation-direction>#
public func animationDirection(_ directions: CSSSingleAnimationDirection...) -> CSSDeclaration {
  var results = ""
  for (index, d) in directions.enumerated() {
    results = "\(results)\(d.rawValue)"
    if index < directions.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("animation-direction", results)
}

public func animationDirection(_ value: String) -> CSSDeclaration {
  CSSDeclaration("animation-direction", value)
}

// animation-fill-mode = <single-animation-fill-mode>#
public func animationFillMode(_ modes: CSSSingleAnimationFillMode...) -> CSSDeclaration {
  var results = ""
  for (index, m) in modes.enumerated() {
    results = "\(results)\(m.rawValue)"
    if index < modes.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("animation-fill-mode", results)
}

public func animationFillMode(_ value: String) -> CSSDeclaration {
  CSSDeclaration("animation-fill-mode", value)
}

// animation-play-state = <single-animation-play-state>#
public func animationPlayState(_ states: CSSSingleAnimationPlayState...) -> CSSDeclaration {
  var results = ""
  for (index, s) in states.enumerated() {
    results = "\(results)\(s.rawValue)"
    if index < states.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("animation-play-state", results)
}

public func animationPlayState(_ value: String) -> CSSDeclaration {
  CSSDeclaration("animation-play-state", value)
}

public func backfaceVisibility(_ value: CSSBackfaceVisibility) -> CSSDeclaration {
  CSSDeclaration("backface-visibility", value.rawValue)
}

public func backfaceVisibility(_ value: String) -> CSSDeclaration {
  CSSDeclaration("backface-visibility", value)
}
// Single value
public func transformOrigin(_ value: CSSTransformOrigin.Horizontal) -> CSSDeclaration {
  CSSDeclaration("transform-origin", value.rawValue)
}

public func transformOrigin(_ value: CSSTransformOrigin.Vertical) -> CSSDeclaration {
  CSSDeclaration("transform-origin", value.rawValue)
}

public func transformOrigin(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("transform-origin", value.value)
}

public func transformOrigin(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("transform-origin", value.value)
}

public func transformOrigin(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("transform-origin", value.value)
}

// Two values
public func transformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical)
  -> CSSDeclaration
{
  CSSDeclaration("transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func transformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSDeclaration {
  CSSDeclaration("transform-origin", "\(x.rawValue) \(y.value)")
}

public func transformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Percentage) -> CSSDeclaration {
  CSSDeclaration("transform-origin", "\(x.rawValue) \(y.value)")
}

public func transformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage)
  -> CSSDeclaration
{ CSSDeclaration("transform-origin", "\(x.rawValue) \(y.value)") }

public func transformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
  CSSDeclaration("transform-origin", "\(x.value) \(y.rawValue)")
}

public func transformOrigin(_ x: Percentage, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
  CSSDeclaration("transform-origin", "\(x.value) \(y.rawValue)")
}

public func transformOrigin(_ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical)
  -> CSSDeclaration
{ CSSDeclaration("transform-origin", "\(x.value) \(y.rawValue)") }

public func transformOrigin(_ x: Length, _ y: Length) -> CSSDeclaration {
  CSSDeclaration("transform-origin", "\(x.value) \(y.value)")
}

public func transformOrigin(_ x: Percentage, _ y: Percentage) -> CSSDeclaration {
  CSSDeclaration("transform-origin", "\(x.value) \(y.value)")
}

public func transformOrigin(_ x: LengthPercentage, _ y: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("transform-origin", "\(x.value) \(y.value)")
}

// Three values
public func transformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSDeclaration {
  CSSDeclaration("transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func transformOrigin(_ x: LengthPercentage, _ y: LengthPercentage, _ z: LengthPercentage)
  -> CSSDeclaration
{ CSSDeclaration("transform-origin", "\(x.value) \(y.value) \(z.value)") }

// MARK: - Independent Transform Properties

@_disfavoredOverload
public func scale(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("scale", doubleToString(value))
}

@_disfavoredOverload
public func scale(_ x: Double, _ y: Double) -> CSSDeclaration {
  CSSDeclaration("scale", "\(doubleToString(x)) \(doubleToString(y))")
}

@_disfavoredOverload
public func scale(_ x: Double, _ y: Double, _ z: Double) -> CSSDeclaration {
  CSSDeclaration("scale", "\(doubleToString(x)) \(doubleToString(y)) \(doubleToString(z))")
}

@_disfavoredOverload
public func rotate(_ angle: CSSAngle) -> CSSDeclaration {
  CSSDeclaration("rotate", angle.value)
}

@_disfavoredOverload
public func translate(_ x: Length) -> CSSDeclaration { CSSDeclaration("translate", x.value) }

@_disfavoredOverload
public func translate(_ x: Percentage) -> CSSDeclaration { CSSDeclaration("translate", x.value) }

@_disfavoredOverload
public func translate(_ x: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("translate", x.value)
}

@_disfavoredOverload
public func translate(_ x: Length, _ y: Length) -> CSSDeclaration {
  CSSDeclaration("translate", "\(x.value) \(y.value)")
}

@_disfavoredOverload
public func translate(_ x: LengthPercentage, _ y: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("translate", "\(x.value) \(y.value)")
}

@_disfavoredOverload
public func translate(_ x: Length, _ y: Length, _ z: Length) -> CSSDeclaration {
  CSSDeclaration("translate", "\(x.value) \(y.value) \(z.value)")
}

@_disfavoredOverload
public func translate(_ x: LengthPercentage, _ y: LengthPercentage, _ z: LengthPercentage)
  -> CSSDeclaration
{ CSSDeclaration("translate", "\(x.value) \(y.value) \(z.value)") }

public func visibility(_ value: String) -> CSSDeclaration {
  CSSDeclaration("visibility", value)
}

public func visibility(_ value: CSSKeyword.Visibility) -> CSSDeclaration {
  CSSDeclaration("visibility", value.rawValue)
}
@_disfavoredOverload
public func stopColor(_ value: String) -> CSSDeclaration {
  CSSDeclaration("stop-color", value)
}

public func stopColor(_ value: CSSColor) -> CSSDeclaration {
  CSSDeclaration("stop-color", value.value)
}
@_disfavoredOverload
public func stopOpacity(_ value: String) -> CSSDeclaration {
  CSSDeclaration("stop-opacity", value)
}
@_disfavoredOverload
public func stopOpacity(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("stop-opacity", doubleToString(value))
}

public func gridTemplateRows(_ value: String) -> CSSDeclaration {
  CSSDeclaration("grid-template-rows", value)
}

public func gridTemplateRows(_ values: Length...) -> CSSDeclaration {
  CSSDeclaration("grid-template-rows", values.map { $0.value }.joinedString(separator: " "))
}

public func gridTemplateRows(_ values: Percentage...) -> CSSDeclaration {
  CSSDeclaration("grid-template-rows", values.map { $0.value }.joinedString(separator: " "))
}

public func gridTemplateRows(_ values: LengthPercentage...) -> CSSDeclaration {
  CSSDeclaration("grid-template-rows", values.map { $0.value }.joinedString(separator: " "))
}

public func gridTemplateColumns(_ value: String) -> CSSDeclaration {
  CSSDeclaration("grid-template-columns", value)
}

public func gridTemplateColumns(_ values: Length...) -> CSSDeclaration {
  CSSDeclaration("grid-template-columns", values.map { $0.value }.joinedString(separator: " "))
}

public func gridTemplateColumns(_ values: Percentage...) -> CSSDeclaration {
  CSSDeclaration("grid-template-columns", values.map { $0.value }.joinedString(separator: " "))
}

public func gridTemplateColumns(_ values: LengthPercentage...) -> CSSDeclaration {
  CSSDeclaration("grid-template-columns", values.map { $0.value }.joinedString(separator: " "))
}

public func accentColor(_ value: String) -> CSSDeclaration {
  CSSDeclaration("accent-color", value)
}

public func accentColor(_ value: CSSColor) -> CSSDeclaration {
  CSSDeclaration("accent-color", value.value)
}

public func resize(_ value: String) -> CSSDeclaration {
  CSSDeclaration("resize", value)
}

public func resize(_ value: CSSResize) -> CSSDeclaration {
  CSSDeclaration("resize", value.rawValue)
}

public func resize(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("resize", value.rawValue)
}

public func clip(_ value: String) -> CSSDeclaration {
  CSSDeclaration("clip", value)
}

public func backgroundBlendMode(_ value: CSSBlendMode) -> CSSDeclaration {
  CSSDeclaration("background-blend-mode", value.value)
}

public func backgroundBlendMode(_ value: String) -> CSSDeclaration {
  CSSDeclaration("background-blend-mode", value)
}

public func mixBlendMode(_ value: CSSBlendMode) -> CSSDeclaration {
  CSSDeclaration("mix-blend-mode", value.value)
}

public func mixBlendMode(_ value: CSSMixBlendMode) -> CSSDeclaration {
  CSSDeclaration("mix-blend-mode", value.rawValue)
}

public func textSizeAdjust(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("text-size-adjust", value.rawValue)
}

public func textSizeAdjust(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("text-size-adjust", value.rawValue)
}

public func userSelect(_ value: CSSUserSelect) -> CSSDeclaration {
  CSSDeclaration("user-select", value.rawValue)
}

public func userSelect(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("user-select", value.rawValue)
}

@_disfavoredOverload
public func userSelect(_ value: String) -> CSSDeclaration {
  CSSDeclaration("user-select", value)
}

public func whiteSpace(_ value: CSSWhiteSpace) -> CSSDeclaration {
  CSSDeclaration("white-space", value.rawValue)
}

public func tabSize(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("tab-size", "\(value)")
}

public func tabSize(_ value: Length) -> CSSDeclaration { CSSDeclaration("tab-size", value.value) }

public func tabSize(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("tab-size", value.value)
}

public func tabSize(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("tab-size", value.value)
}

public func wordBreak(_ value: CSSWordBreak) -> CSSDeclaration {
  CSSDeclaration("word-break", value.rawValue)
}

public func overflowWrap(_ value: CSSWordWrap) -> CSSDeclaration {
  CSSDeclaration("overflow-wrap", value.rawValue)
}

public func customProperty(_ name: String, _ value: String) -> CSSDeclaration {
  CSSDeclaration(name, value)
}

public func customProperty(_ name: String, _ value: Int) -> CSSDeclaration {
  CSSDeclaration(name, "\(value)")
}

public func customProperty(_ name: String, _ value: Double) -> CSSDeclaration {
  CSSDeclaration(name, doubleToString(value))
}

public func customProperty(_ name: String, _ value: CSSColor) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSBlendMode) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSMixBlendMode) -> CSSDeclaration {
  CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSCursor) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSEasingFunction) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSSingleAnimationIterationCount)
  -> CSSDeclaration
{
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSTextDecoration) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSTextDecoration.Line) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSTextDecoration.Style) -> CSSDeclaration {
  CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSTextDecoration.Thickness) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSTextOverflow) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSPosition) -> CSSDeclaration {
  CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSFlexDirection) -> CSSDeclaration {
  CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSAlignItems) -> CSSDeclaration {
  CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSJustifyContent) -> CSSDeclaration {
  CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSDisplay.Outside) -> CSSDeclaration {
  CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSDisplay.Inside) -> CSSDeclaration {
  CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSFontFamily) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSFontFamily.GenericFamily.GenericComplete)
  -> CSSDeclaration
{
  CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSFontFamily.GenericFamily.GenericIncomplete)
  -> CSSDeclaration
{
  CSSDeclaration(name, value.rawValue)
}

public func customProperty(
  _ name: String, _ value: CSSFontFamily.GenericFamily.GenericScriptSpecific
) -> CSSDeclaration {
  CSSDeclaration(name, value.description)
}

public func customProperty(_ name: String, _ value: CSSFontFamily.GenericFamily) -> CSSDeclaration {
  CSSDeclaration(name, value.description)
}

public func customProperty(_ name: String, _ value: CSSBorder.LineStyle) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: Length) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: Percentage) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSKeyword.Length) -> CSSDeclaration {
  CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSBoxSizing) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSBackgroundSize) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSBackgroundPosition) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSTransformFunction) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSSingleTransitionProperty) -> CSSDeclaration {
  CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSKeyword.Transparent) -> CSSDeclaration {
  CSSDeclaration(name, value.rawValue)
}

public func customProperty(
  _ name: String,
  _ properties: (
    CSSSingleTransitionProperty, CSSSingleTransitionProperty, CSSSingleTransitionProperty
  )
) -> CSSDeclaration {
  CSSDeclaration(name, "\(properties.0.value), \(properties.1.value), \(properties.2.value)")
}

public func customProperty(
  _ name: String,
  _ properties: (
    CSSSingleTransitionProperty, CSSSingleTransitionProperty, CSSSingleTransitionProperty,
    CSSSingleTransitionProperty
  )
) -> CSSDeclaration {
  CSSDeclaration(
    name,
    "\(properties.0.value), \(properties.1.value), \(properties.2.value), \(properties.3.value)")
}

@_disfavoredOverload
public func customProperty(
  _ name: String, _ boxShadow: (CSSSpreadShadow.BoxShadowPosition, Length, Length, Length, Length)
) -> CSSDeclaration {
  CSSDeclaration(
    name,
    "\(boxShadow.0.rawValue) \(boxShadow.1.value) \(boxShadow.2.value) \(boxShadow.3.value) \(boxShadow.4.value)"
  )
}

public func customProperty(
  _ name: String,
  _ boxShadow: (
    CSSSpreadShadow.BoxShadowPosition, LengthPercentage, LengthPercentage, LengthPercentage,
    LengthPercentage
  )
) -> CSSDeclaration {
  CSSDeclaration(
    name,
    "\(boxShadow.0.rawValue) \(boxShadow.1.value) \(boxShadow.2.value) \(boxShadow.3.value) \(boxShadow.4.value)"
  )
}

public func customProperty(_ name: String, _ boxShadow: (Length, Length, Length, Length))
  -> CSSDeclaration
{
  CSSDeclaration(
    name, "\(boxShadow.0.value) \(boxShadow.1.value) \(boxShadow.2.value) \(boxShadow.3.value)")
}

public func customProperty(
  _ name: String,
  _ boxShadow: (LengthPercentage, LengthPercentage, LengthPercentage, LengthPercentage)
) -> CSSDeclaration {
  CSSDeclaration(
    name, "\(boxShadow.0.value) \(boxShadow.1.value) \(boxShadow.2.value) \(boxShadow.3.value)")
}

public func customProperty(_ name: String, _ value: (CSSSpreadShadow, CSSColor)) -> CSSDeclaration {
  CSSDeclaration(name, "\(value.0.value) \(value.1.value)")
}

// Two box shadows with colors
public func customProperty(
  _ name: String, _ value: ((CSSSpreadShadow, CSSColor), (CSSSpreadShadow, CSSColor))
) -> CSSDeclaration {
  let shadow1 = "\(value.0.1.value) \(value.0.0.value)"
  let shadow2 = "\(value.1.1.value) \(value.1.0.value)"
  return CSSDeclaration(name, "\(shadow1), \(shadow2)")
}

// Border tuple (width, style, color)

public func customProperty(_ name: String, _ value: (Length, CSSBorder.LineStyle, CSSColor))
  -> CSSDeclaration
{
  CSSDeclaration(name, "\(value.0.value) \(value.1.value) \(value.2.value)")
}

public func customProperty(
  _ name: String, _ value: (LengthPercentage, CSSBorder.LineStyle, CSSColor)
) -> CSSDeclaration {
  CSSDeclaration(name, "\(value.0.value) \(value.1.value) \(value.2.value)")
}

public func customProperty(
  _ name: String, _ value: (Length, CSSBorder.LineStyle, CSSKeyword.Transparent)
) -> CSSDeclaration {
  CSSDeclaration(name, "\(value.0.value) \(value.1.value) \(value.2.rawValue)")
}

public func customProperty(
  _ name: String, _ value: (LengthPercentage, CSSBorder.LineStyle, CSSKeyword.Transparent)
) -> CSSDeclaration {
  CSSDeclaration(name, "\(value.0.value) \(value.1.value) \(value.2.rawValue)")
}

// Font stacks with GenericComplete
public func customProperty(
  _ name: String, _ fonts: (String, CSSFontFamily.GenericFamily.GenericComplete)
) -> CSSDeclaration {
  CSSDeclaration(name, "\(fonts.0), \(fonts.1.rawValue)")
}

public func customProperty(
  _ name: String, _ fonts: (String, String, CSSFontFamily.GenericFamily.GenericComplete)
) -> CSSDeclaration {
  CSSDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2.rawValue)")
}

public func customProperty(
  _ name: String, _ fonts: (String, String, String, CSSFontFamily.GenericFamily.GenericComplete)
) -> CSSDeclaration {
  CSSDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3.rawValue)")
}

public func customProperty(
  _ name: String,
  _ fonts: (String, String, String, String, CSSFontFamily.GenericFamily.GenericComplete)
) -> CSSDeclaration {
  CSSDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4.rawValue)")
}

public func customProperty(
  _ name: String,
  _ fonts: (String, String, String, String, String, CSSFontFamily.GenericFamily.GenericComplete)
) -> CSSDeclaration {
  CSSDeclaration(
    name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4), \(fonts.5.rawValue)")
}

public func customProperty(
  _ name: String,
  _ fonts: (
    String, String, String, String, String, String, CSSFontFamily.GenericFamily.GenericComplete
  )
) -> CSSDeclaration {
  CSSDeclaration(
    name,
    "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4), \(fonts.5), \(fonts.6.rawValue)")
}

public func customProperty(
  _ name: String,
  _ fonts: (
    String, String, String, String, String, String, String,
    CSSFontFamily.GenericFamily.GenericComplete
  )
) -> CSSDeclaration {
  CSSDeclaration(
    name,
    "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4), \(fonts.5), \(fonts.6), \(fonts.7.rawValue)"
  )
}

// Font stacks with GenericIncomplete + CSSFontFamily
public func customProperty(
  _ name: String, _ fonts: (String, CSSFontFamily.GenericFamily.GenericIncomplete, CSSFontFamily)
) -> CSSDeclaration {
  CSSDeclaration(name, "\(fonts.0), \(fonts.1.rawValue), \(fonts.2.value)")
}

// Font stacks with just GenericIncomplete + CSSFontFamily (no initial string)
public func customProperty(
  _ name: String, _ fonts: (CSSFontFamily.GenericFamily.GenericIncomplete, CSSFontFamily)
) -> CSSDeclaration {
  CSSDeclaration(name, "\(fonts.0.rawValue), \(fonts.1.value)")
}

// Font stacks with String + CSSFontFamily
public func customProperty(_ name: String, _ fonts: (String, CSSFontFamily)) -> CSSDeclaration {
  CSSDeclaration(name, "\(fonts.0), \(fonts.1.value)")
}

@available(*, deprecated)
public func property(_ name: String, _ value: String) -> CSSDeclaration {
  CSSDeclaration(name, value)
}

// Vendor-prefixed properties following CSSBuilder pattern

// MARK: - Appearance
public func webkitAppearance(_ value: CSSAppearance) -> CSSDeclaration {
  CSSDeclaration("-webkit-appearance", value.rawValue)
}

public func webkitAppearance(_ value: CSSAppearance.CompatAuto) -> CSSDeclaration {
  CSSDeclaration("-webkit-appearance", value.rawValue)
}

public func webkitAppearance(_ value: CSSAppearance.CompatSpecial) -> CSSDeclaration {
  CSSDeclaration("-webkit-appearance", value.rawValue)
}

public func webkitAppearance(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-webkit-appearance", value.rawValue)
}

public func webkitAppearance(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("-webkit-appearance", value.rawValue)
}

public func mozAppearance(_ value: CSSAppearance) -> CSSDeclaration {
  CSSDeclaration("-moz-appearance", value.rawValue)
}

public func mozAppearance(_ value: CSSAppearance.CompatAuto) -> CSSDeclaration {
  CSSDeclaration("-moz-appearance", value.rawValue)
}

public func mozAppearance(_ value: CSSAppearance.CompatSpecial) -> CSSDeclaration {
  CSSDeclaration("-moz-appearance", value.rawValue)
}

public func mozAppearance(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-moz-appearance", value.rawValue)
}

public func mozAppearance(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("-moz-appearance", value.rawValue)
}

// MARK: - User Select
public func webkitUserSelect(_ value: CSSUserSelect) -> CSSDeclaration {
  CSSDeclaration("-webkit-user-select", value.rawValue)
}

public func mozUserSelect(_ value: CSSUserSelect) -> CSSDeclaration {
  CSSDeclaration("-moz-user-select", value.rawValue)
}

public func msUserSelect(_ value: CSSUserSelect) -> CSSDeclaration {
  CSSDeclaration("-ms-user-select", value.rawValue)
}

// MARK: - Box Sizing
public func webkitBoxSizing(_ value: CSSBoxSizing) -> CSSDeclaration {
  CSSDeclaration("-webkit-box-sizing", value.value)
}

public func mozBoxSizing(_ value: CSSBoxSizing) -> CSSDeclaration {
  CSSDeclaration("-moz-box-sizing", value.value)
}

// MARK: - Transform
public func webkitTransform(_ value: CSSTransformFunction) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform", value.value)
}

public func mozTransform(_ value: CSSTransformFunction) -> CSSDeclaration {
  CSSDeclaration("-moz-transform", value.value)
}

public func msTransform(_ value: CSSTransformFunction) -> CSSDeclaration {
  CSSDeclaration("-ms-transform", value.value)
}

public func oTransform(_ value: CSSTransformFunction) -> CSSDeclaration {
  CSSDeclaration("-o-transform", value.value)
}

// MARK: - Transform Origin
// Webkit - Single value
public func webkitTransformOrigin(_ value: CSSTransformOrigin.Horizontal) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-origin", value.rawValue)
}

public func webkitTransformOrigin(_ value: CSSTransformOrigin.Vertical) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-origin", value.rawValue)
}

public func webkitTransformOrigin(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-origin", value.value)
}

public func webkitTransformOrigin(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-origin", value.value)
}

public func webkitTransformOrigin(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-origin", value.value)
}

public func webkitTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical
) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSDeclaration
{ CSSDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.value)") }

public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Percentage)
  -> CSSDeclaration
{ CSSDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.value)") }

public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage)
  -> CSSDeclaration
{ CSSDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.value)") }

public func webkitTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-origin", "\(x.value) \(y.rawValue)")
}

public func webkitTransformOrigin(_ x: Percentage, _ y: CSSTransformOrigin.Vertical)
  -> CSSDeclaration
{ CSSDeclaration("-webkit-transform-origin", "\(x.value) \(y.rawValue)") }

public func webkitTransformOrigin(_ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical)
  -> CSSDeclaration
{ CSSDeclaration("-webkit-transform-origin", "\(x.value) \(y.rawValue)") }

public func webkitTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Length
) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func webkitTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Percentage
) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func webkitTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length, _ z: Length)
  -> CSSDeclaration
{ CSSDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }

public func webkitTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage, _ z: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.value) \(z.value)")
}

public func webkitTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical, _ z: Length)
  -> CSSDeclaration
{ CSSDeclaration("-webkit-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }

public func webkitTransformOrigin(
  _ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-origin", "\(x.value) \(y.rawValue) \(z.value)")
}

public func webkitTransformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func webkitTransformOrigin(
  _ x: LengthPercentage, _ y: LengthPercentage, _ z: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-origin", "\(x.value) \(y.value) \(z.value)")
}

// Mozilla - Single value
public func mozTransformOrigin(_ value: CSSTransformOrigin.Horizontal) -> CSSDeclaration {
  CSSDeclaration("-moz-transform-origin", value.rawValue)
}

public func mozTransformOrigin(_ value: CSSTransformOrigin.Vertical) -> CSSDeclaration {
  CSSDeclaration("-moz-transform-origin", value.rawValue)
}

public func mozTransformOrigin(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-moz-transform-origin", value.value)
}

public func mozTransformOrigin(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-moz-transform-origin", value.value)
}

public func mozTransformOrigin(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-moz-transform-origin", value.value)
}

public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical)
  -> CSSDeclaration
{
  CSSDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSDeclaration {
  CSSDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.value)")
}

public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Percentage)
  -> CSSDeclaration
{ CSSDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.value)") }

public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage)
  -> CSSDeclaration
{ CSSDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.value)") }

public func mozTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
  CSSDeclaration("-moz-transform-origin", "\(x.value) \(y.rawValue)")
}

public func mozTransformOrigin(_ x: Percentage, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration
{ CSSDeclaration("-moz-transform-origin", "\(x.value) \(y.rawValue)") }

public func mozTransformOrigin(_ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical)
  -> CSSDeclaration
{ CSSDeclaration("-moz-transform-origin", "\(x.value) \(y.rawValue)") }

public func mozTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Length
) -> CSSDeclaration {
  CSSDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func mozTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Percentage
) -> CSSDeclaration {
  CSSDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func mozTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length, _ z: Length)
  -> CSSDeclaration
{ CSSDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }

public func mozTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage, _ z: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.value) \(z.value)")
}

public func mozTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical, _ z: Length)
  -> CSSDeclaration
{ CSSDeclaration("-moz-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }

public func mozTransformOrigin(
  _ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-moz-transform-origin", "\(x.value) \(y.rawValue) \(z.value)")
}

public func mozTransformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSDeclaration {
  CSSDeclaration("-moz-transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func mozTransformOrigin(_ x: LengthPercentage, _ y: LengthPercentage, _ z: LengthPercentage)
  -> CSSDeclaration
{ CSSDeclaration("-moz-transform-origin", "\(x.value) \(y.value) \(z.value)") }

// Microsoft - Single value
public func msTransformOrigin(_ value: CSSTransformOrigin.Horizontal) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-origin", value.rawValue)
}

public func msTransformOrigin(_ value: CSSTransformOrigin.Vertical) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-origin", value.rawValue)
}

public func msTransformOrigin(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-origin", value.value)
}

public func msTransformOrigin(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-origin", value.value)
}

public func msTransformOrigin(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-origin", value.value)
}

public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical)
  -> CSSDeclaration
{
  CSSDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.value)")
}

public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Percentage) -> CSSDeclaration
{ CSSDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.value)") }

public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage)
  -> CSSDeclaration
{ CSSDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.value)") }

public func msTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-origin", "\(x.value) \(y.rawValue)")
}

public func msTransformOrigin(_ x: Percentage, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-origin", "\(x.value) \(y.rawValue)")
}

public func msTransformOrigin(_ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical)
  -> CSSDeclaration
{ CSSDeclaration("-ms-transform-origin", "\(x.value) \(y.rawValue)") }

public func msTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Length
) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func msTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Percentage
) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func msTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length, _ z: Length)
  -> CSSDeclaration
{ CSSDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }

public func msTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage, _ z: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.value) \(z.value)")
}

public func msTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical, _ z: Length)
  -> CSSDeclaration
{ CSSDeclaration("-ms-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }

public func msTransformOrigin(
  _ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-origin", "\(x.value) \(y.rawValue) \(z.value)")
}

public func msTransformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func msTransformOrigin(_ x: LengthPercentage, _ y: LengthPercentage, _ z: LengthPercentage)
  -> CSSDeclaration
{ CSSDeclaration("-ms-transform-origin", "\(x.value) \(y.value) \(z.value)") }

// Opera - Single value
public func oTransformOrigin(_ value: CSSTransformOrigin.Horizontal) -> CSSDeclaration {
  CSSDeclaration("-o-transform-origin", value.rawValue)
}

public func oTransformOrigin(_ value: CSSTransformOrigin.Vertical) -> CSSDeclaration {
  CSSDeclaration("-o-transform-origin", value.rawValue)
}

public func oTransformOrigin(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-o-transform-origin", value.value)
}

public func oTransformOrigin(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-o-transform-origin", value.value)
}

public func oTransformOrigin(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-o-transform-origin", value.value)
}

public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical)
  -> CSSDeclaration
{
  CSSDeclaration("-o-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSDeclaration {
  CSSDeclaration("-o-transform-origin", "\(x.rawValue) \(y.value)")
}

public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage)
  -> CSSDeclaration
{ CSSDeclaration("-o-transform-origin", "\(x.rawValue) \(y.value)") }

public func oTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
  CSSDeclaration("-o-transform-origin", "\(x.value) \(y.rawValue)")
}

public func oTransformOrigin(_ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical)
  -> CSSDeclaration
{ CSSDeclaration("-o-transform-origin", "\(x.value) \(y.rawValue)") }

public func oTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Length
) -> CSSDeclaration {
  CSSDeclaration("-o-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func oTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-o-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length, _ z: Length)
  -> CSSDeclaration
{ CSSDeclaration("-o-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }

public func oTransformOrigin(
  _ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage, _ z: LengthPercentage
) -> CSSDeclaration { CSSDeclaration("-o-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }

public func oTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical, _ z: Length)
  -> CSSDeclaration
{ CSSDeclaration("-o-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }

public func oTransformOrigin(
  _ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage
) -> CSSDeclaration { CSSDeclaration("-o-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }

public func oTransformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSDeclaration {
  CSSDeclaration("-o-transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func oTransformOrigin(_ x: LengthPercentage, _ y: LengthPercentage, _ z: LengthPercentage)
  -> CSSDeclaration
{ CSSDeclaration("-o-transform-origin", "\(x.value) \(y.value) \(z.value)") }

// MARK: - Transform Style
public func webkitTransformStyle(_ value: CSSTransformStyle) -> CSSDeclaration {
  CSSDeclaration("-webkit-transform-style", value.rawValue)
}

public func mozTransformStyle(_ value: CSSTransformStyle) -> CSSDeclaration {
  CSSDeclaration("-moz-transform-style", value.rawValue)
}

public func msTransformStyle(_ value: CSSTransformStyle) -> CSSDeclaration {
  CSSDeclaration("-ms-transform-style", value.rawValue)
}

public func oTransformStyle(_ value: CSSTransformStyle) -> CSSDeclaration {
  CSSDeclaration("-o-transform-style", value.rawValue)
}

// MARK: - Transition
public func webkitTransition(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-transition", value)
}

public func mozTransition(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-moz-transition", value)
}

public func msTransition(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-transition", value)
}

public func oTransition(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-o-transition", value)
}

// MARK: - Transition Delay
public func webkitTransitionDelay(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-webkit-transition-delay", value.value)
}

public func mozTransitionDelay(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-moz-transition-delay", value.value)
}

public func msTransitionDelay(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-ms-transition-delay", value.value)
}

public func oTransitionDelay(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-o-transition-delay", value.value)
}

// MARK: - Transition Duration
public func webkitTransitionDuration(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-webkit-transition-duration", value.value)
}

public func mozTransitionDuration(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-moz-transition-duration", value.value)
}

public func msTransitionDuration(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-ms-transition-duration", value.value)
}

public func oTransitionDuration(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-o-transition-duration", value.value)
}

// MARK: - Transition Property
public func webkitTransitionProperty(_ properties: CSSSingleTransitionProperty...) -> CSSDeclaration
{
  var results = ""
  for (index, p) in properties.enumerated() {
    results = "\(results)\(p.value)"
    if index < properties.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("-webkit-transition-property", results)
}

public func mozTransitionProperty(_ properties: CSSSingleTransitionProperty...) -> CSSDeclaration {
  var results = ""
  for (index, p) in properties.enumerated() {
    results = "\(results)\(p.value)"
    if index < properties.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("-moz-transition-property", results)
}

public func msTransitionProperty(_ properties: CSSSingleTransitionProperty...) -> CSSDeclaration {
  var results = ""
  for (index, p) in properties.enumerated() {
    results = "\(results)\(p.value)"
    if index < properties.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("-ms-transition-property", results)
}

public func oTransitionProperty(_ properties: CSSSingleTransitionProperty...) -> CSSDeclaration {
  var results = ""
  for (index, p) in properties.enumerated() {
    results = "\(results)\(p.value)"
    if index < properties.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("-o-transition-property", results)
}

// MARK: - Transition Timing Function
public func webkitTransitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSDeclaration {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("-webkit-transition-timing-function", results)
}

public func mozTransitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSDeclaration {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("-moz-transition-timing-function", results)
}

public func msTransitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSDeclaration {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("-ms-transition-timing-function", results)
}

public func oTransitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSDeclaration {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("-o-transition-timing-function", results)
}

// MARK: - Animation
public func webkitAnimation(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-animation", value)
}

// Convenience overloads for webkit
public func webkitAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String,
  _ iterationCount: CSSSingleAnimationIterationCount
) -> CSSDeclaration {
  CSSDeclaration(
    "-webkit-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)"
  )
}

public func webkitAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll
) -> CSSDeclaration {
  CSSDeclaration(
    "-webkit-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func webkitAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView
) -> CSSDeclaration {
  CSSDeclaration(
    "-webkit-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func webkitAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String
) -> CSSDeclaration {
  CSSDeclaration(
    "-webkit-animation",
    "\(duration.value) \(easingFunction.value) \(name) \(CSSDashedIdent(timeline).value)")
}

public func mozAnimation(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-moz-animation", value)
}

// Convenience overloads for moz
public func mozAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String,
  _ iterationCount: CSSSingleAnimationIterationCount
) -> CSSDeclaration {
  CSSDeclaration(
    "-moz-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)")
}

public func mozAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll
) -> CSSDeclaration {
  CSSDeclaration(
    "-moz-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func mozAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView
) -> CSSDeclaration {
  CSSDeclaration(
    "-moz-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func mozAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String
) -> CSSDeclaration {
  CSSDeclaration(
    "-moz-animation",
    "\(duration.value) \(easingFunction.value) \(name) \(CSSDashedIdent(timeline).value)")
}

public func msAnimation(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-animation", value)
}

// Convenience overloads for ms
public func msAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String,
  _ iterationCount: CSSSingleAnimationIterationCount
) -> CSSDeclaration {
  CSSDeclaration(
    "-ms-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)")
}

public func msAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll
) -> CSSDeclaration {
  CSSDeclaration(
    "-ms-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func msAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView
) -> CSSDeclaration {
  CSSDeclaration(
    "-ms-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func msAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String
) -> CSSDeclaration {
  CSSDeclaration(
    "-ms-animation",
    "\(duration.value) \(easingFunction.value) \(name) \(CSSDashedIdent(timeline).value)")
}

public func oAnimation(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-o-animation", value)
}

// Convenience overloads for o
public func oAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String,
  _ iterationCount: CSSSingleAnimationIterationCount
) -> CSSDeclaration {
  CSSDeclaration(
    "-o-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)")
}

public func oAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll
) -> CSSDeclaration {
  CSSDeclaration(
    "-o-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func oAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView
) -> CSSDeclaration {
  CSSDeclaration(
    "-o-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func oAnimation(
  _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String
) -> CSSDeclaration {
  CSSDeclaration(
    "-o-animation",
    "\(duration.value) \(easingFunction.value) \(name) \(CSSDashedIdent(timeline).value)")
}

// MARK: - Animation Delay
public func webkitAnimationDelay(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-webkit-animation-delay", value.value)
}

public func webkitAnimationDelay(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-animation-delay", value)
}

public func mozAnimationDelay(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-moz-animation-delay", value.value)
}

public func mozAnimationDelay(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-moz-animation-delay", value)
}

public func msAnimationDelay(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-ms-animation-delay", value.value)
}

public func msAnimationDelay(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-animation-delay", value)
}

public func oAnimationDelay(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-o-animation-delay", value.value)
}

public func oAnimationDelay(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-o-animation-delay", value)
}

// MARK: - Animation Direction
public func webkitAnimationDirection(_ value: CSSSingleAnimationDirection) -> CSSDeclaration {
  CSSDeclaration("-webkit-animation-direction", value.rawValue)
}

public func webkitAnimationDirection(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-animation-direction", value)
}

public func mozAnimationDirection(_ value: CSSSingleAnimationDirection) -> CSSDeclaration {
  CSSDeclaration("-moz-animation-direction", value.rawValue)
}

public func mozAnimationDirection(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-moz-animation-direction", value)
}

public func msAnimationDirection(_ value: CSSSingleAnimationDirection) -> CSSDeclaration {
  CSSDeclaration("-ms-animation-direction", value.rawValue)
}

public func msAnimationDirection(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-animation-direction", value)
}

public func oAnimationDirection(_ value: CSSSingleAnimationDirection) -> CSSDeclaration {
  CSSDeclaration("-o-animation-direction", value.rawValue)
}

public func oAnimationDirection(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-o-animation-direction", value)
}

// MARK: - Animation Duration
public func webkitAnimationDuration(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-webkit-animation-duration", value.value)
}

public func webkitAnimationDuration(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-animation-duration", value)
}

public func mozAnimationDuration(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-moz-animation-duration", value.value)
}

public func mozAnimationDuration(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-moz-animation-duration", value)
}

public func msAnimationDuration(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-ms-animation-duration", value.value)
}

public func msAnimationDuration(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-animation-duration", value)
}

public func oAnimationDuration(_ value: CSSTime) -> CSSDeclaration {
  CSSDeclaration("-o-animation-duration", value.value)
}

public func oAnimationDuration(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-o-animation-duration", value)
}

// MARK: - Animation Fill Mode
public func webkitAnimationFillMode(_ value: CSSSingleAnimationFillMode) -> CSSDeclaration {
  CSSDeclaration("-webkit-animation-fill-mode", value.rawValue)
}

public func mozAnimationFillMode(_ value: CSSSingleAnimationFillMode) -> CSSDeclaration {
  CSSDeclaration("-moz-animation-fill-mode", value.rawValue)
}

public func msAnimationFillMode(_ value: CSSSingleAnimationFillMode) -> CSSDeclaration {
  CSSDeclaration("-ms-animation-fill-mode", value.rawValue)
}

public func oAnimationFillMode(_ value: CSSSingleAnimationFillMode) -> CSSDeclaration {
  CSSDeclaration("-o-animation-fill-mode", value.rawValue)
}

// MARK: - Animation Iteration Count
public func webkitAnimationIterationCount(_ value: CSSSingleAnimationIterationCount)
  -> CSSDeclaration
{
  CSSDeclaration("-webkit-animation-iteration-count", value.value)
}

public func webkitAnimationIterationCount(_ value: CSSKeyword.Infinite) -> CSSDeclaration {
  CSSDeclaration("-webkit-animation-iteration-count", value.rawValue)
}

public func mozAnimationIterationCount(_ value: CSSSingleAnimationIterationCount) -> CSSDeclaration
{
  CSSDeclaration("-moz-animation-iteration-count", value.value)
}

public func mozAnimationIterationCount(_ value: CSSKeyword.Infinite) -> CSSDeclaration {
  CSSDeclaration("-moz-animation-iteration-count", value.rawValue)
}

public func msAnimationIterationCount(_ value: CSSSingleAnimationIterationCount) -> CSSDeclaration {
  CSSDeclaration("-ms-animation-iteration-count", value.value)
}

public func msAnimationIterationCount(_ value: CSSKeyword.Infinite) -> CSSDeclaration {
  CSSDeclaration("-ms-animation-iteration-count", value.rawValue)
}

public func oAnimationIterationCount(_ value: CSSSingleAnimationIterationCount) -> CSSDeclaration {
  CSSDeclaration("-o-animation-iteration-count", value.value)
}

public func oAnimationIterationCount(_ value: CSSKeyword.Infinite) -> CSSDeclaration {
  CSSDeclaration("-o-animation-iteration-count", value.rawValue)
}

// MARK: - Animation Name
public func webkitAnimationName(_ value: CSSKeyframesName) -> CSSDeclaration {
  CSSDeclaration("-webkit-animation-name", value.value)
}

public func webkitAnimationName(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-webkit-animation-name", value.rawValue)
}

public func mozAnimationName(_ value: CSSKeyframesName) -> CSSDeclaration {
  CSSDeclaration("-moz-animation-name", value.value)
}

public func mozAnimationName(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-moz-animation-name", value.rawValue)
}

public func msAnimationName(_ value: CSSKeyframesName) -> CSSDeclaration {
  CSSDeclaration("-ms-animation-name", value.value)
}

public func msAnimationName(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-ms-animation-name", value.rawValue)
}

public func oAnimationName(_ value: CSSKeyframesName) -> CSSDeclaration {
  CSSDeclaration("-o-animation-name", value.value)
}

public func oAnimationName(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-o-animation-name", value.rawValue)
}

// MARK: - Animation Play State
public func webkitAnimationPlayState(_ value: CSSSingleAnimationPlayState) -> CSSDeclaration {
  CSSDeclaration("-webkit-animation-play-state", value.rawValue)
}

public func mozAnimationPlayState(_ value: CSSSingleAnimationPlayState) -> CSSDeclaration {
  CSSDeclaration("-moz-animation-play-state", value.rawValue)
}

public func msAnimationPlayState(_ value: CSSSingleAnimationPlayState) -> CSSDeclaration {
  CSSDeclaration("-ms-animation-play-state", value.rawValue)
}

public func oAnimationPlayState(_ value: CSSSingleAnimationPlayState) -> CSSDeclaration {
  CSSDeclaration("-o-animation-play-state", value.rawValue)
}

// MARK: - Animation Timing Function
public func webkitAnimationTimingFunction(_ value: CSSEasingFunction) -> CSSDeclaration {
  CSSDeclaration("-webkit-animation-timing-function", value.value)
}

public func mozAnimationTimingFunction(_ value: CSSEasingFunction) -> CSSDeclaration {
  CSSDeclaration("-moz-animation-timing-function", value.value)
}

public func msAnimationTimingFunction(_ value: CSSEasingFunction) -> CSSDeclaration {
  CSSDeclaration("-ms-animation-timing-function", value.value)
}

public func oAnimationTimingFunction(_ value: CSSEasingFunction) -> CSSDeclaration {
  CSSDeclaration("-o-animation-timing-function", value.value)
}

// MARK: - Backface Visibility
public func webkitBackfaceVisibility(_ value: CSSBackfaceVisibility) -> CSSDeclaration {
  CSSDeclaration("-webkit-backface-visibility", value.rawValue)
}

public func webkitBackfaceVisibility(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-backface-visibility", value)
}

public func mozBackfaceVisibility(_ value: CSSBackfaceVisibility) -> CSSDeclaration {
  CSSDeclaration("-moz-backface-visibility", value.rawValue)
}

public func mozBackfaceVisibility(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-moz-backface-visibility", value)
}

public func msBackfaceVisibility(_ value: CSSBackfaceVisibility) -> CSSDeclaration {
  CSSDeclaration("-ms-backface-visibility", value.rawValue)
}

public func msBackfaceVisibility(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-backface-visibility", value)
}

public func oBackfaceVisibility(_ value: CSSBackfaceVisibility) -> CSSDeclaration {
  CSSDeclaration("-o-backface-visibility", value.rawValue)
}

public func oBackfaceVisibility(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-o-backface-visibility", value)
}

// MARK: - Perspective

@_disfavoredOverload
public func perspective(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("perspective", value.value)
}

@_disfavoredOverload
public func perspective(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("perspective", value.value)
}

public func webkitPerspective(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-webkit-perspective", value.value)
}

public func webkitPerspective(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-perspective", value.value)
}

public func webkitPerspective(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-perspective", value.value)
}

public func mozPerspective(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-moz-perspective", value.value)
}

public func mozPerspective(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-moz-perspective", value.value)
}

public func mozPerspective(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-moz-perspective", value.value)
}

public func msPerspective(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-ms-perspective", value.value)
}

public func msPerspective(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-ms-perspective", value.value)
}

public func msPerspective(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-ms-perspective", value.value)
}

public func oPerspective(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-o-perspective", value.value)
}

public func oPerspective(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-o-perspective", value.value)
}

public func oPerspective(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-o-perspective", value.value)
}

public func oPerspective(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-o-perspective", value.rawValue)
}

// MARK: - Perspective Origin
public func webkitPerspectiveOrigin(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-webkit-perspective-origin", value.value)
}

public func webkitPerspectiveOrigin(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-perspective-origin", value.value)
}

public func webkitPerspectiveOrigin(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-perspective-origin", value.value)
}

public func mozPerspectiveOrigin(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-moz-perspective-origin", value.value)
}

public func mozPerspectiveOrigin(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-moz-perspective-origin", value.value)
}

public func mozPerspectiveOrigin(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-moz-perspective-origin", value.value)
}

public func msPerspectiveOrigin(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-ms-perspective-origin", value.value)
}

public func msPerspectiveOrigin(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-ms-perspective-origin", value.value)
}

public func msPerspectiveOrigin(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-ms-perspective-origin", value.value)
}

public func oPerspectiveOrigin(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-o-perspective-origin", value.value)
}

public func oPerspectiveOrigin(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-o-perspective-origin", value.value)
}

public func oPerspectiveOrigin(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-o-perspective-origin", value.value)
}

// MARK: - Border Radius
public func webkitBorderRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-radius", value.value)
}

public func webkitBorderRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-radius", value.value)
}

public func webkitBorderRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-radius", value.value)
}

public func mozBorderRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-moz-border-radius", value.value)
}

public func mozBorderRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-moz-border-radius", value.value)
}

public func mozBorderRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-moz-border-radius", value.value)
}

public func webkitBorderTopLeftRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-top-left-radius", value.value)
}

public func webkitBorderTopLeftRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-top-left-radius", value.value)
}

public func webkitBorderTopLeftRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-top-left-radius", value.value)
}

public func mozBorderTopLeftRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-moz-border-top-left-radius", value.value)
}

public func mozBorderTopLeftRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-moz-border-top-left-radius", value.value)
}

public func mozBorderTopLeftRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-moz-border-top-left-radius", value.value)
}

public func webkitBorderTopRightRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-top-right-radius", value.value)
}

public func webkitBorderTopRightRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-top-right-radius", value.value)
}

public func webkitBorderTopRightRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-top-right-radius", value.value)
}

public func mozBorderTopRightRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-moz-border-top-right-radius", value.value)
}

public func mozBorderTopRightRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-moz-border-top-right-radius", value.value)
}

public func mozBorderTopRightRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-moz-border-top-right-radius", value.value)
}

public func webkitBorderBottomLeftRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-bottom-left-radius", value.value)
}

public func webkitBorderBottomLeftRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-bottom-left-radius", value.value)
}

public func webkitBorderBottomLeftRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-bottom-left-radius", value.value)
}

public func mozBorderBottomLeftRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-moz-border-bottom-left-radius", value.value)
}

public func mozBorderBottomLeftRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-moz-border-bottom-left-radius", value.value)
}

public func mozBorderBottomLeftRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-moz-border-bottom-left-radius", value.value)
}

public func webkitBorderBottomRightRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-bottom-right-radius", value.value)
}

public func webkitBorderBottomRightRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-bottom-right-radius", value.value)
}

public func webkitBorderBottomRightRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-webkit-border-bottom-right-radius", value.value)
}

public func mozBorderBottomRightRadius(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-moz-border-bottom-right-radius", value.value)
}

public func mozBorderBottomRightRadius(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-moz-border-bottom-right-radius", value.value)
}

public func mozBorderBottomRightRadius(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-moz-border-bottom-right-radius", value.value)
}

public func mozBorderBottomRightRadius(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-moz-border-bottom-right-radius", value)
}

// MARK: - Box Shadow
public func webkitBoxShadow(_ shadows: CSSSpreadShadow...) -> CSSDeclaration {
  var results = ""
  for (index, s) in shadows.enumerated() {
    results = "\(results)\(s.value)"
    if index < shadows.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("-webkit-box-shadow", results)
}

public func webkitBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length,
  _ spread: Length, _ position: CSSSpreadShadow.BoxShadowPosition
) -> CSSDeclaration {
  webkitBoxShadow(
    CSSSpreadShadow(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSSSpreadShadow.BoxShadowBlur(blur),
      spread: CSSSpreadShadow.BoxShadowSpread(spread),
      position: position
    ))
}

public func webkitBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length,
  _ spread: Length
) -> CSSDeclaration {
  CSSDeclaration(
    "-webkit-box-shadow",
    "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value) \(spread.value)")
}

public func webkitBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage,
  _ b: LengthPercentage, _ s: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration(
    "-webkit-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value) \(s.value)")
}

public func webkitBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length
) -> CSSDeclaration {
  CSSDeclaration(
    "-webkit-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value)")
}

public func webkitBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage,
  _ b: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-webkit-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value)")
}

public func webkitBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length
) -> CSSDeclaration {
  CSSDeclaration("-webkit-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value)")
}

public func webkitBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-webkit-box-shadow", "\(color.value) \(oX.value) \(oY.value)")
}

public func webkitBoxShadow(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-box-shadow", value)
}

public func webkitBoxShadow(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-webkit-box-shadow", value.rawValue)
}

public func mozBoxShadow(_ shadows: CSSSpreadShadow...) -> CSSDeclaration {
  var results = ""
  for (index, s) in shadows.enumerated() {
    results = "\(results)\(s.value)"
    if index < shadows.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("-moz-box-shadow", results)
}

public func mozBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length,
  _ spread: Length, _ position: CSSSpreadShadow.BoxShadowPosition
) -> CSSDeclaration {
  mozBoxShadow(
    CSSSpreadShadow(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSSSpreadShadow.BoxShadowBlur(blur),
      spread: CSSSpreadShadow.BoxShadowSpread(spread),
      position: position
    ))
}

public func mozBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length,
  _ spread: Length
) -> CSSDeclaration {
  CSSDeclaration(
    "-moz-box-shadow",
    "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value) \(spread.value)")
}

public func mozBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage,
  _ b: LengthPercentage, _ s: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-moz-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value) \(s.value)")
}

public func mozBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length
) -> CSSDeclaration {
  CSSDeclaration(
    "-moz-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value)")
}

public func mozBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage,
  _ b: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-moz-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value)")
}

public func mozBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length
) -> CSSDeclaration {
  CSSDeclaration("-moz-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value)")
}

public func mozBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-moz-box-shadow", "\(color.value) \(oX.value) \(oY.value)")
}

public func mozBoxShadow(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-moz-box-shadow", value)
}

public func mozBoxShadow(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-moz-box-shadow", value.rawValue)
}

public func msBoxShadow(_ shadows: CSSSpreadShadow...) -> CSSDeclaration {
  var results = ""
  for (index, s) in shadows.enumerated() {
    results = "\(results)\(s.value)"
    if index < shadows.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("-ms-box-shadow", results)
}

public func msBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length,
  _ spread: Length, _ position: CSSSpreadShadow.BoxShadowPosition
) -> CSSDeclaration {
  msBoxShadow(
    CSSSpreadShadow(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSSSpreadShadow.BoxShadowBlur(blur),
      spread: CSSSpreadShadow.BoxShadowSpread(spread),
      position: position
    ))
}

public func msBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length,
  _ spread: Length
) -> CSSDeclaration {
  CSSDeclaration(
    "-ms-box-shadow",
    "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value) \(spread.value)")
}

public func msBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage,
  _ b: LengthPercentage, _ s: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-ms-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value) \(s.value)")
}

public func msBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length
) -> CSSDeclaration {
  CSSDeclaration("-ms-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value)")
}

public func msBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage,
  _ b: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-ms-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value)")
}

public func msBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length
) -> CSSDeclaration {
  CSSDeclaration("-ms-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value)")
}

public func msBoxShadow(
  _ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage
) -> CSSDeclaration {
  CSSDeclaration("-ms-box-shadow", "\(color.value) \(oX.value) \(oY.value)")
}

public func msBoxShadow(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-box-shadow", value)
}

public func msBoxShadow(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-ms-box-shadow", value.rawValue)
}

// MARK: - Filter
// filter = none | <filter-value-list>
public func filter(_ functions: CSSFilterFunction...) -> CSSDeclaration {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results) "
    }
  }
  return CSSDeclaration("filter", results)
}

public func filter(_ value: String) -> CSSDeclaration {
  CSSDeclaration("filter", value)
}

public func filter(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("filter", value.rawValue)
}

public func webkitFilter(_ functions: CSSFilterFunction...) -> CSSDeclaration {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results) "
    }
  }
  return CSSDeclaration("-webkit-filter", results)
}

public func webkitFilter(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-filter", value)
}

public func msFilter(_ functions: CSSFilterFunction...) -> CSSDeclaration {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results) "
    }
  }
  return CSSDeclaration("-ms-filter", results)
}

public func msFilter(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-filter", value)
}

// MARK: - Backdrop Filter
public func backdropFilter(_ functions: CSSFilterFunction...) -> CSSDeclaration {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results) "
    }
  }
  return CSSDeclaration("backdrop-filter", results)
}

public func backdropFilter(_ value: String) -> CSSDeclaration {
  CSSDeclaration("backdrop-filter", value)
}

public func backdropFilter(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("backdrop-filter", value.rawValue)
}

public func webkitBackdropFilter(_ functions: CSSFilterFunction...) -> CSSDeclaration {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results) "
    }
  }
  return CSSDeclaration("-webkit-backdrop-filter", results)
}

public func webkitBackdropFilter(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-backdrop-filter", value)
}

// MARK: - Mask
// mask = <mask-layer>#
public func mask(_ layers: CSSMaskLayer...) -> CSSDeclaration {
  var results = ""
  for (index, l) in layers.enumerated() {
    results = "\(results)\(l.value)"
    if index < layers.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("mask", results)
}

public func mask(_ value: String) -> CSSDeclaration {
  CSSDeclaration("mask", value)
}

public func mask(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("mask", value.rawValue)
}

public func webkitMask(_ layers: CSSMaskLayer...) -> CSSDeclaration {
  var results = ""
  for (index, l) in layers.enumerated() {
    results = "\(results)\(l.value)"
    if index < layers.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("-webkit-mask", results)
}

// Convenience: webkitMask(url, position, size, repeat) - all double
public func webkitMask(
  _ reference: CSSMaskLayer.MaskReference,
  _ position: (
    CSSMaskLayer.Position.PositionOne.PositionKeyword,
    CSSMaskLayer.Position.PositionOne.PositionKeyword
  ),
  _ size: (Length, Length),
  _ repeatStyle: (CSSMaskLayer.RepeatStyle.Repetition, CSSMaskLayer.RepeatStyle.Repetition)
) -> CSSDeclaration {
  let pos1 = CSSMaskLayer.Position.PositionOne.keyword(position.0)
  let pos2 = CSSMaskLayer.Position.PositionOne.keyword(position.1)
  let posTwo = CSSMaskLayer.Position.PositionTwo(pos1, pos2)
  return webkitMask(
    CSSMaskLayer(
      reference: reference,
      position: .two(posTwo),
      size: .twoLengths(size.0, size.1),
      repeatStyle: .repetition(repeatStyle.0, repeatStyle.1)
    ))
}

// Convenience: webkitMask(url, position, size, repeat) - single repeat
public func webkitMask(
  _ reference: CSSMaskLayer.MaskReference,
  _ position: (
    CSSMaskLayer.Position.PositionOne.PositionKeyword,
    CSSMaskLayer.Position.PositionOne.PositionKeyword
  ),
  _ size: (Length, Length),
  _ repeatStyle: CSSMaskLayer.RepeatStyle.Repetition
) -> CSSDeclaration {
  let pos1 = CSSMaskLayer.Position.PositionOne.keyword(position.0)
  let pos2 = CSSMaskLayer.Position.PositionOne.keyword(position.1)
  let posTwo = CSSMaskLayer.Position.PositionTwo(pos1, pos2)
  return webkitMask(
    CSSMaskLayer(
      reference: reference,
      position: .two(posTwo),
      size: .twoLengths(size.0, size.1),
      repeatStyle: .repetition(repeatStyle, nil)
    ))
}

public func webkitMask(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-mask", value)
}

public func webkitMask(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-webkit-mask", value.rawValue)
}

// MARK: - Font Smoothing
public func webkitFontSmoothing(_ value: CSSFontSmoothing) -> CSSDeclaration {
  CSSDeclaration("-webkit-font-smoothing", value.rawValue)
}

public func webkitFontSmoothing(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-webkit-font-smoothing", value.rawValue)
}

public func webkitFontSmoothing(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-font-smoothing", value)
}

public func mozOsxFontSmoothing(_ value: CSSFontSmoothing) -> CSSDeclaration {
  CSSDeclaration("-moz-osx-font-smoothing", value.rawValue)
}

public func mozOsxFontSmoothing(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-moz-osx-font-smoothing", value)
}

// MARK: - Text Size Adjust
public func webkitTextSizeAdjust(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-webkit-text-size-adjust", value.rawValue)
}

public func webkitTextSizeAdjust(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("-webkit-text-size-adjust", value.rawValue)
}

public func webkitTextSizeAdjust(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-text-size-adjust", value)
}

// MARK: - Tap Highlight Color
public func webkitTapHighlightColor(_ color: CSSColor) -> CSSDeclaration {
  CSSDeclaration("-webkit-tap-highlight-color", color.value)
}

public func webkitTapHighlightColor(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-tap-highlight-color", value)
}

// MARK: - Touch Callout
public func webkitTouchCallout(_ value: CSSTouchCallout) -> CSSDeclaration {
  CSSDeclaration("-webkit-touch-callout", value.rawValue)
}

public func webkitTouchCallout(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-webkit-touch-callout", value.rawValue)
}

public func webkitTouchCallout(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-touch-callout", value)
}

// MARK: - Mask Image
// mask-image = <mask-reference>#
public func maskImage(_ references: CSSMaskLayer.MaskReference...) -> CSSDeclaration {
  var results = ""
  for (index, r) in references.enumerated() {
    results = "\(results)\(r.value)"
    if index < references.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("mask-image", results)
}

public func maskImage(_ value: String) -> CSSDeclaration {
  CSSDeclaration("mask-image", value)
}

public func webkitMaskImage(_ references: CSSMaskLayer.MaskReference...) -> CSSDeclaration {
  var results = ""
  for (index, r) in references.enumerated() {
    results = "\(results)\(r.value)"
    if index < references.count - 1 {
      results = "\(results), "
    }
  }
  return CSSDeclaration("-webkit-mask-image", results)
}

public func webkitMaskImage(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-mask-image", value)
}

public func webkitMaskSize(_ value: CSSMaskSize) -> CSSDeclaration {
  CSSDeclaration("-webkit-mask-size", value.rawValue)
}

public func webkitMaskSize(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-mask-size", value)
}

public func webkitMaskRepeat(_ value: CSSMaskRepeat) -> CSSDeclaration {
  CSSDeclaration("-webkit-mask-repeat", value.rawValue)
}

public func webkitMaskRepeat(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-mask-repeat", value)
}

public func webkitMaskPosition(_ value: CSSObjectPosition) -> CSSDeclaration {
  CSSDeclaration("-webkit-mask-position", value.rawValue)
}

public func webkitMaskPosition(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-mask-position", value)
}

// MARK: - Clip Path
// clip-path = <clip-source> | [ <basic-shape> || <geometry-box> ] | none
public func clipPath(_ value: CSSClipPath) -> CSSDeclaration {
  CSSDeclaration("clip-path", value.value)
}

public func clipPath(_ shape: CSSBasicShape) -> CSSDeclaration {
  CSSDeclaration("clip-path", shape.value)
}

public func clipPath(_ shape: CSSBasicShape, _ box: CSSGeometryBox) -> CSSDeclaration {
  CSSDeclaration("clip-path", "\(shape.value) \(box.rawValue)")
}

public func clipPath(_ box: CSSGeometryBox) -> CSSDeclaration {
  CSSDeclaration("clip-path", box.rawValue)
}

public func clipPath(_ source: CSSClipSource) -> CSSDeclaration {
  CSSDeclaration("clip-path", source.value)
}

public func clipPath(_ value: String) -> CSSDeclaration {
  CSSDeclaration("clip-path", value)
}

public func clipPath(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("clip-path", value.rawValue)
}

public func webkitClipPath(_ value: CSSClipPath) -> CSSDeclaration {
  CSSDeclaration("-webkit-clip-path", value.value)
}

public func webkitClipPath(_ shape: CSSBasicShape) -> CSSDeclaration {
  CSSDeclaration("-webkit-clip-path", shape.value)
}

public func webkitClipPath(_ shape: CSSBasicShape, _ box: CSSGeometryBox) -> CSSDeclaration {
  CSSDeclaration("-webkit-clip-path", "\(shape.value) \(box.rawValue)")
}

public func webkitClipPath(_ box: CSSGeometryBox) -> CSSDeclaration {
  CSSDeclaration("-webkit-clip-path", box.rawValue)
}

public func webkitClipPath(_ source: CSSClipSource) -> CSSDeclaration {
  CSSDeclaration("-webkit-clip-path", source.value)
}

public func webkitClipPath(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-clip-path", value)
}

public func webkitClipPath(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("-webkit-clip-path", value.rawValue)
}

// MARK: - Line Clamp
public func webkitLineClamp(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-line-clamp", value)
}

public func webkitLineClamp(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("-webkit-line-clamp", "\(value)")
}

// MARK: - Box Reflect
public func webkitBoxReflect(_ value: CSSBoxReflect) -> CSSDeclaration {
  CSSDeclaration("-webkit-box-reflect", value.rawValue)
}

public func webkitBoxReflect(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-webkit-box-reflect", value)
}

// MARK: - Flexbox (MS-specific)
public func msFlexDirection(_ value: CSSFlexDirection) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-direction", value.rawValue)
}

public func msFlexDirection(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-direction", value)
}

public func msFlexWrap(_ value: CSSFlexWrap) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-wrap", value.rawValue)
}

public func msFlexWrap(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-wrap", value)
}

public func msFlexFlow(_ value: CSSFlexFlow) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-flow", value.rawValue)
}

public func msFlexFlow(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-flow", value)
}

public func msFlex(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-flex", value)
}

public func msFlex(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("-ms-flex", "\(value)")
}

public func msFlexGrow(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-grow", value)
}

public func msFlexGrow(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-grow", "\(value)")
}

public func msFlexGrow(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-grow", "\(value)")
}

public func msFlexShrink(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-shrink", value)
}

public func msFlexShrink(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-shrink", "\(value)")
}

public func msFlexShrink(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-shrink", "\(value)")
}

public func msFlexBasis(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-basis", value)
}

public func msFlexBasis(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-basis", value.value)
}

public func msFlexBasis(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-basis", value.value)
}

public func msFlexBasis(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("-ms-flex-basis", value.value)
}

public func msJustifyContent(_ value: CSSJustifyContent) -> CSSDeclaration {
  CSSDeclaration("-ms-justify-content", value.rawValue)
}

public func msJustifyContent(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-justify-content", value)
}

public func msAlignItems(_ value: CSSAlignItems) -> CSSDeclaration {
  CSSDeclaration("-ms-align-items", value.rawValue)
}

public func msAlignItems(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-align-items", value)
}

public func msAlignSelf(_ value: CSSAlignSelf) -> CSSDeclaration {
  CSSDeclaration("-ms-align-self", value.rawValue)
}

public func msAlignSelf(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-align-self", value)
}

public func msAlignContent(_ value: CSSAlignContent) -> CSSDeclaration {
  CSSDeclaration("-ms-align-content", value.rawValue)
}

public func msAlignContent(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-align-content", value)
}

public func msOrder(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("-ms-order", "\(value)")
}

public func msOrder(_ value: String) -> CSSDeclaration {
  CSSDeclaration("-ms-order", value)
}

// MARK: - Writing Mode

public func writingMode(_ value: CSSWritingMode) -> CSSDeclaration {
  CSSDeclaration("writing-mode", value.rawValue)
}

// MARK: - Logical Margin Properties

public func marginBlockStart(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("margin-block-start", value.rawValue)
}

public func marginBlockStart(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("margin-block-start", intToString(value))
}

public func marginBlockStart(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("margin-block-start", doubleToString(value))
}

public func marginBlockStart(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("margin-block-start", value.value)
}

public func marginBlockStart(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("margin-block-start", value.value)
}

public func marginBlockStart(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("margin-block-start", value.value)
}

public func marginBlockEnd(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("margin-block-end", value.rawValue)
}

public func marginBlockEnd(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("margin-block-end", intToString(value))
}

public func marginBlockEnd(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("margin-block-end", doubleToString(value))
}

public func marginBlockEnd(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("margin-block-end", value.value)
}

public func marginBlockEnd(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("margin-block-end", value.value)
}

public func marginBlockEnd(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("margin-block-end", value.value)
}

public func marginInlineStart(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("margin-inline-start", value.rawValue)
}

public func marginInlineStart(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("margin-inline-start", intToString(value))
}

public func marginInlineStart(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("margin-inline-start", doubleToString(value))
}

public func marginInlineStart(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("margin-inline-start", value.value)
}

public func marginInlineStart(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("margin-inline-start", value.value)
}

public func marginInlineStart(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("margin-inline-start", value.value)
}

public func marginInlineEnd(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("margin-inline-end", value.rawValue)
}

public func marginInlineEnd(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("margin-inline-end", intToString(value))
}

public func marginInlineEnd(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("margin-inline-end", doubleToString(value))
}

public func marginInlineEnd(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("margin-inline-end", value.value)
}

public func marginInlineEnd(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("margin-inline-end", value.value)
}

public func marginInlineEnd(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("margin-inline-end", value.value)
}

public func marginBlock(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("margin-block", intToString(value))
}

public func marginBlock(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("margin-block", doubleToString(value))
}

public func marginBlock(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("margin-block", value.value)
}

public func marginBlock(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("margin-block", value.value)
}

public func marginBlock(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("margin-block", value.value)
}

public func marginBlock(_ start: Length, _ end: Length) -> CSSDeclaration {
  CSSDeclaration("margin-block", "\(start.value) \(end.value)")
}

public func marginBlock(_ start: Percentage, _ end: Percentage) -> CSSDeclaration {
  CSSDeclaration("margin-block", "\(start.value) \(end.value)")
}

public func marginBlock(_ start: LengthPercentage, _ end: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("margin-block", "\(start.value) \(end.value)")
}

public func marginInline(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("margin-inline", intToString(value))
}

public func marginInline(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("margin-inline", doubleToString(value))
}

public func marginInline(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("margin-inline", value.value)
}

public func marginInline(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("margin-inline", value.value)
}

public func marginInline(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("margin-inline", value.value)
}

public func marginInline(_ start: Length, _ end: Length) -> CSSDeclaration {
  CSSDeclaration("margin-inline", "\(start.value) \(end.value)")
}

public func marginInline(_ start: Percentage, _ end: Percentage) -> CSSDeclaration {
  CSSDeclaration("margin-inline", "\(start.value) \(end.value)")
}

public func marginInline(_ start: LengthPercentage, _ end: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("margin-inline", "\(start.value) \(end.value)")
}

public func marginInline(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("margin-inline", value.rawValue)
}

// MARK: - Logical Padding Properties
public func paddingBlockStart(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("padding-block-start", intToString(value))
}

public func paddingBlockStart(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("padding-block-start", doubleToString(value))
}

public func paddingBlockStart(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("padding-block-start", value.value)
}

public func paddingBlockStart(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("padding-block-start", value.value)
}

public func paddingBlockStart(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding-block-start", value.value)
}

public func paddingBlockEnd(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("padding-block-end", intToString(value))
}

public func paddingBlockEnd(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("padding-block-end", doubleToString(value))
}

public func paddingBlockEnd(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("padding-block-end", value.value)
}

public func paddingBlockEnd(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("padding-block-end", value.value)
}

public func paddingBlockEnd(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding-block-end", value.value)
}

public func paddingInlineStart(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("padding-inline-start", intToString(value))
}

public func paddingInlineStart(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("padding-inline-start", doubleToString(value))
}

public func paddingInlineStart(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("padding-inline-start", value.value)
}

public func paddingInlineStart(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("padding-inline-start", value.value)
}

public func paddingInlineStart(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding-inline-start", value.value)
}

public func paddingInlineEnd(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("padding-inline-end", intToString(value))
}

public func paddingInlineEnd(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("padding-inline-end", doubleToString(value))
}

public func paddingInlineEnd(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("padding-inline-end", value.value)
}

public func paddingInlineEnd(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("padding-inline-end", value.value)
}

public func paddingInlineEnd(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding-inline-end", value.value)
}

public func paddingBlock(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("padding-block", intToString(value))
}

public func paddingBlock(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("padding-block", doubleToString(value))
}

public func paddingBlock(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("padding-block", value.value)
}

public func paddingBlock(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("padding-block", value.value)
}

public func paddingBlock(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding-block", value.value)
}

public func paddingBlock(_ start: Length, _ end: Length) -> CSSDeclaration {
  CSSDeclaration("padding-block", "\(start.value) \(end.value)")
}

public func paddingBlock(_ s: LengthPercentage, _ e: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding-block", "\(s.value) \(e.value)")
}

public func paddingInline(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("padding-inline", intToString(value))
}

public func paddingInline(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("padding-inline", doubleToString(value))
}

public func paddingInline(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("padding-inline", value.value)
}

public func paddingInline(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("padding-inline", value.value)
}

public func paddingInline(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding-inline", value.value)
}

public func paddingInline(_ start: Length, _ end: Length) -> CSSDeclaration {
  CSSDeclaration("padding-inline", "\(start.value) \(end.value)")
}

public func paddingInline(_ s: LengthPercentage, _ e: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("padding-inline", "\(s.value) \(e.value)")
}

// MARK: - Logical Border Properties
public func borderBlockStart(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-block-start", "\(width.value) \(style.value) \(color.value)") }

public func borderBlockStart(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-block-start", "\(width.value) \(style.value) \(color.value)") }

public func borderBlockStart(
  _ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor
) -> CSSDeclaration {
  CSSDeclaration("border-block-start", "\(width.value) \(style.value) \(color.value)")
}

public func borderBlockStart(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("border-block-start", value.rawValue)
}

public func borderBlockEnd(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-block-end", "\(width.value) \(style.value) \(color.value)") }

public func borderBlockEnd(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-block-end", "\(width.value) \(style.value) \(color.value)") }

public func borderBlockEnd(
  _ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor
) -> CSSDeclaration {
  CSSDeclaration("border-block-end", "\(width.value) \(style.value) \(color.value)")
}

public func borderBlockEnd(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("border-block-end", value.rawValue)
}

public func borderInlineStart(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-inline-start", "\(width.value) \(style.value) \(color.value)") }

public func borderInlineStart(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-inline-start", "\(width.value) \(style.value) \(color.value)") }

public func borderInlineStart(
  _ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor
) -> CSSDeclaration {
  CSSDeclaration("border-inline-start", "\(width.value) \(style.value) \(color.value)")
}

public func borderInlineStart(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("border-inline-start", value.rawValue)
}

public func borderInlineEnd(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-inline-end", "\(width.value) \(style.value) \(color.value)") }

public func borderInlineEnd(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor)
  -> CSSDeclaration
{ CSSDeclaration("border-inline-end", "\(width.value) \(style.value) \(color.value)") }

public func borderInlineEnd(
  _ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor
) -> CSSDeclaration {
  CSSDeclaration("border-inline-end", "\(width.value) \(style.value) \(color.value)")
}

public func borderInlineEndWidth(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("border-inline-end-width", value.value)
}

public func borderInlineEndWidth(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("border-inline-end-width", value.value)
}

public func borderInlineEndWidth(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("border-inline-end-width", value.value)
}

public func borderInlineEnd(_ value: CSSKeyword.None) -> CSSDeclaration {
  CSSDeclaration("border-inline-end", value.rawValue)
}

// MARK: - Logical Inset Properties

public func insetBlockStart(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("inset-block-start", intToString(value))
}

public func insetBlockStart(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("inset-block-start", doubleToString(value))
}

public func insetBlockStart(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("inset-block-start", value.value)
}

public func insetBlockStart(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("inset-block-start", value.value)
}

public func insetBlockStart(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("inset-block-start", value.value)
}

public func insetBlockEnd(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("inset-block-end", intToString(value))
}

public func insetBlockEnd(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("inset-block-end", doubleToString(value))
}

public func insetBlockEnd(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("inset-block-end", value.value)
}

public func insetBlockEnd(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("inset-block-end", value.value)
}

public func insetBlockEnd(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("inset-block-end", value.value)
}

public func insetInlineStart(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("inset-inline-start", intToString(value))
}

public func insetInlineStart(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("inset-inline-start", doubleToString(value))
}

public func insetInlineStart(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("inset-inline-start", value.value)
}

public func insetInlineStart(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("inset-inline-start", value.value)
}

public func insetInlineStart(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("inset-inline-start", value.value)
}

public func insetInlineEnd(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("inset-inline-end", intToString(value))
}

public func insetInlineEnd(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("inset-inline-end", doubleToString(value))
}

public func insetInlineEnd(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("inset-inline-end", value.value)
}

public func insetInlineEnd(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("inset-inline-end", value.value)
}

public func insetInlineEnd(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("inset-inline-end", value.value)
}

// MARK: - Logical Size Properties
public func inlineSize(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("inline-size", intToString(value))
}

public func inlineSize(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("inline-size", doubleToString(value))
}

public func inlineSize(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("inline-size", value.value)
}

public func inlineSize(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("inline-size", value.value)
}

public func inlineSize(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("inline-size", value.value)
}

public func blockSize(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("block-size", intToString(value))
}

public func blockSize(_ value: Double) -> CSSDeclaration {
  CSSDeclaration("block-size", doubleToString(value))
}

public func blockSize(_ value: Length) -> CSSDeclaration {
  CSSDeclaration("block-size", value.value)
}

public func blockSize(_ value: Percentage) -> CSSDeclaration {
  CSSDeclaration("block-size", value.value)
}

public func blockSize(_ value: LengthPercentage) -> CSSDeclaration {
  CSSDeclaration("block-size", value.value)
}

public func blockSize(_ value: CSSKeyword.Auto) -> CSSDeclaration {
  CSSDeclaration("block-size", value.rawValue)
}

public func borderInlineStartWidth(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("border-inline-start-width", "\(value)")
}

public func borderInlineEndWidth(_ value: Int) -> CSSDeclaration {
  CSSDeclaration("border-inline-end-width", "\(value)")
}
