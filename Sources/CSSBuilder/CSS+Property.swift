import EmbeddedSwiftUtilities
import WebTypes

extension CSS {
  /// Builder accumulator for a single CSS property declaration (name + value pair).
  /// Used inside @CSSBuilder blocks; fed into CSSOM.CSSStyleDeclaration.set().
  public struct Property: Sendable {
    public let property: String
    public let value: String
    public let isImportant: Bool

    public init(_ property: String, _ value: String, isImportant: Bool = false) {
      self.property = property
      self.value = value
      self.isImportant = isImportant
    }

    public func important() -> CSS.Property {
      CSS.Property(property, value, isImportant: true)
    }
  }
}

public func display(_ value: CSS.Display.Outside) -> CSS.Property {
  CSS.Property("display", value.rawValue)
}

public func display(_ value: CSS.Display.Inside) -> CSS.Property {
  CSS.Property("display", value.rawValue)
}

public func display(_ value: CSS.Display.ListItem) -> CSS.Property {
  CSS.Property("display", value.rawValue)
}

public func display(_ value: CSS.Display.Internal) -> CSS.Property {
  CSS.Property("display", value.rawValue)
}

public func display(_ value: CSS.Display.Box) -> CSS.Property {
  CSS.Property("display", value.rawValue)
}

public func display(_ value: CSS.Display.Legacy) -> CSS.Property {
  CSS.Property("display", value.rawValue)
}

public func display(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("display", value.rawValue)
}

public func display(_ outside: CSS.Display.Outside, _ inside: CSS.Display.Inside) -> CSS.Property {
  CSS.Property("display", "\(outside.rawValue) \(inside.rawValue)")
}

public func position(_ value: CSS.Position) -> CSS.Property {
  CSS.Property("position", value.rawValue)
}

public func direction(_ value: CSS.Direction) -> CSS.Property {
  CSS.Property("direction", value.rawValue)
}
@available(*, deprecated)
public func display(_ value: String) -> CSS.Property {
  CSS.Property("display", value)
}
@available(*, deprecated)
public func position(_ value: String) -> CSS.Property {
  CSS.Property("position", value)
}

public func width(_ value: Int) -> CSS.Property { CSS.Property("width", intToString(value)) }

public func width(_ value: Double) -> CSS.Property {
  CSS.Property("width", doubleToString(value))
}

public func width(_ value: CSS.Length) -> CSS.Property { CSS.Property("width", value.value) }

public func width(_ value: CSS.Percentage) -> CSS.Property { CSS.Property("width", value.value) }

public func width(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("width", value.value)
}

public func width(_ value: CSS.Keyword.Length) -> CSS.Property {
  CSS.Property("width", value.rawValue)
}

public func width(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("width", value.rawValue)
}

public func height(_ value: Int) -> CSS.Property {
  CSS.Property("height", intToString(value))
}

public func height(_ value: Double) -> CSS.Property {
  CSS.Property("height", doubleToString(value))
}

public func height(_ value: CSS.Length) -> CSS.Property { CSS.Property("height", value.value) }

public func height(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("height", value.value)
}

public func height(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("height", value.value)
}

public func height(_ value: CSS.Keyword.Length) -> CSS.Property {
  CSS.Property("height", value.rawValue)
}

public func height(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("height", value.rawValue)
}

public func padding(_ value: Int) -> CSS.Property {
  CSS.Property("padding", intToString(value))
}

public func padding(_ value: Double) -> CSS.Property {
  CSS.Property("padding", doubleToString(value))
}

public func padding(_ value: CSS.Length) -> CSS.Property { CSS.Property("padding", value.value) }

public func padding(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("padding", value.value)
}

public func padding(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding", value.value)
}

public func padding(_ vertical: CSS.Length, _ horizontal: CSS.Length) -> CSS.Property {
  CSS.Property("padding", "\(vertical.value) \(horizontal.value)")
}

public func padding(_ vertical: CSS.Percentage, _ horizontal: CSS.Percentage) -> CSS.Property {
  CSS.Property("padding", "\(vertical.value) \(horizontal.value)")
}

public func padding(_ v: CSS.LengthPercentage, _ h: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding", "\(v.value) \(h.value)")
}

public func padding(_ v: Int, _ h: CSS.Length) -> CSS.Property {
  CSS.Property("padding", "\(intToString(v)) \(h.value)")
}

public func padding(_ v: Double, _ h: CSS.Length) -> CSS.Property {
  CSS.Property("padding", "\(doubleToString(v)) \(h.value)")
}

public func padding(_ v: CSS.Length, _ h: Int) -> CSS.Property {
  CSS.Property("padding", "\(v.value) \(intToString(h))")
}

public func padding(_ v: CSS.Length, _ h: Double) -> CSS.Property {
  CSS.Property("padding", "\(v.value) \(doubleToString(h))")
}

public func padding(_ v: CSS.Length, _ h: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding", "\(v.value) \(h.value)")
}

public func padding(_ v: CSS.LengthPercentage, _ h: CSS.Length) -> CSS.Property {
  CSS.Property("padding", "\(v.value) \(h.value)")
}

public func padding(_ top: CSS.Length, _ horizontal: CSS.Length, _ bottom: CSS.Length) -> CSS.Property {
  CSS.Property("padding", "\(top.value) \(horizontal.value) \(bottom.value)")
}

public func padding(_ top: CSS.LengthPercentage, _ horizontal: CSS.Length, _ bottom: CSS.Length)
  -> CSS.Property
{ CSS.Property("padding", "\(top.value) \(horizontal.value) \(bottom.value)") }

public func padding(_ t: CSS.LengthPercentage, _ h: CSS.LengthPercentage, _ b: CSS.LengthPercentage)
  -> CSS.Property
{ CSS.Property("padding", "\(t.value) \(h.value) \(b.value)") }

public func padding(_ top: CSS.Length, _ right: CSS.Length, _ bottom: CSS.Length, _ left: CSS.Length)
  -> CSS.Property
{ CSS.Property("padding", "\(top.value) \(right.value) \(bottom.value) \(left.value)") }

public func padding(_ top: CSS.Length, _ right: CSS.LengthPercentage, _ bottom: CSS.Length, _ left: CSS.Length)
  -> CSS.Property
{ CSS.Property("padding", "\(top.value) \(right.value) \(bottom.value) \(left.value)") }

public func padding(
  _ t: CSS.LengthPercentage, _ r: CSS.LengthPercentage, _ b: CSS.LengthPercentage, _ l: CSS.LengthPercentage
) -> CSS.Property { CSS.Property("padding", "\(t.value) \(r.value) \(b.value) \(l.value)") }

public func margin(_ value: Int) -> CSS.Property {
  CSS.Property("margin", intToString(value))
}

public func margin(_ value: Double) -> CSS.Property {
  CSS.Property("margin", doubleToString(value))
}

public func margin(_ value: CSS.Length) -> CSS.Property { CSS.Property("margin", value.value) }

public func margin(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("margin", value.value)
}

public func margin(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("margin", value.value)
}

public func margin(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("margin", value.rawValue)
}

public func margin(_ vertical: CSS.Length, _ horizontal: CSS.Length) -> CSS.Property {
  CSS.Property("margin", "\(vertical.value) \(horizontal.value)")
}

public func margin(_ vertical: CSS.Percentage, _ horizontal: CSS.Percentage) -> CSS.Property {
  CSS.Property("margin", "\(vertical.value) \(horizontal.value)")
}

public func margin(_ v: CSS.LengthPercentage, _ h: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("margin", "\(v.value) \(h.value)")
}

public func margin(_ v: CSS.Length, _ h: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("margin", "\(v.value) \(h.rawValue)")
}

public func margin(_ v: CSS.Keyword.Auto, _ h: CSS.Length) -> CSS.Property {
  CSS.Property("margin", "\(v.rawValue) \(h.value)")
}

public func margin(_ v: CSS.Keyword.Auto, _ h: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("margin", "\(v.rawValue) \(h.rawValue)")
}

public func margin(_ top: CSS.Length, _ horizontal: CSS.Length, _ bottom: CSS.Length) -> CSS.Property {
  CSS.Property("margin", "\(top.value) \(horizontal.value) \(bottom.value)")
}

public func margin(_ t: CSS.LengthPercentage, _ h: CSS.LengthPercentage, _ b: CSS.LengthPercentage)
  -> CSS.Property
{ CSS.Property("margin", "\(t.value) \(h.value) \(b.value)") }

public func margin(_ top: CSS.Length, _ right: CSS.Length, _ bottom: CSS.Length, _ left: CSS.Length)
  -> CSS.Property
{ CSS.Property("margin", "\(top.value) \(right.value) \(bottom.value) \(left.value)") }

public func margin(
  _ t: CSS.LengthPercentage, _ r: CSS.LengthPercentage, _ b: CSS.LengthPercentage, _ l: CSS.LengthPercentage
) -> CSS.Property { CSS.Property("margin", "\(t.value) \(r.value) \(b.value) \(l.value)") }

@_disfavoredOverload
public func margin(
  _ top: CSS.Length, _ right: CSS.Keyword.Auto, _ bottom: CSS.Length, _ left: CSS.Keyword.Auto
) -> CSS.Property {
  CSS.Property("margin", "\(top.value) \(right.rawValue) \(bottom.value) \(left.rawValue)")
}

public func margin(
  _ top: CSS.LengthPercentage, _ right: CSS.Keyword.Auto, _ bottom: CSS.LengthPercentage,
  _ left: CSS.Keyword.Auto
) -> CSS.Property {
  CSS.Property("margin", "\(top.value) \(right.rawValue) \(bottom.value) \(left.rawValue)")
}

public func fontSize(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("font-size", value.value)
}

public func fontSize(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("font-size", value.value)
}

public func fontSize(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("font-size", value.value)
}

public func fontSize(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("font-size", value.rawValue)
}

public func fontWeight(_ value: CSS.FontWeight) -> CSS.Property {
  CSS.Property("font-weight", value.value)
}

public func fontWeight(_ value: String) -> CSS.Property {
  CSS.Property("font-weight", value)
}

public func fontWeight(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("font-weight", value.rawValue)
}

public func fontFamily(_ value: String) -> CSS.Property {
  CSS.Property("font-family", value)
}

public func fontFamily(_ value: CSS.FontFamily) -> CSS.Property {
  CSS.Property("font-family", value.value)
}

public func fontFamily(_ value: CSS.FontFamily.GenericFamily.GenericComplete) -> CSS.Property {
  CSS.Property("font-family", value.rawValue)
}

public func fontFamily(_ value: CSS.FontFamily.GenericFamily.GenericIncomplete) -> CSS.Property {
  CSS.Property("font-family", value.rawValue)
}

public func fontFamily(_ value: CSS.FontFamily.GenericFamily.GenericScriptSpecific)
  -> CSS.Property
{
  CSS.Property("font-family", value.description)
}

public func fontFamily(_ value: CSS.FontFamily.GenericFamily) -> CSS.Property {
  CSS.Property("font-family", value.description)
}

public func fontFamily(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("font-family", value.rawValue)
}

public func fontStyle(_ value: String) -> CSS.Property {
  CSS.Property("font-style", value)
}

public func fontStyle(_ value: CSS.FontStyle) -> CSS.Property {
  CSS.Property("font-style", value.rawValue)
}

public func lineHeight(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("line-height", value.value)
}

public func lineHeight(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("line-height", value.value)
}

public func lineHeight(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("line-height", value.value)
}

public func lineHeight(_ value: Double) -> CSS.Property {
  CSS.Property("line-height", doubleToString(value))
}

public func lineHeight(_ value: Int) -> CSS.Property {
  #if SERVER
    CSS.Property("line-height", "\(value)")

  #endif

  #if CLIENT
    CSS.Property("line-height", intToString(value))

  #endif
}

public func leadingTrim(_ value: String) -> CSS.Property {
  CSS.Property("leading-trim", value)
}

public func textAlign(_ value: CSS.TextAlign) -> CSS.Property {
  CSS.Property("text-align", value.rawValue)
}

public func textAlign(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("text-align", value.rawValue)
}
@available(*, deprecated)
public func textAlign(_ value: String) -> CSS.Property {
  CSS.Property("text-align", value)
}

public func fontVariantNumeric(_ value: CSS.FontVariantNumeric) -> CSS.Property {
  CSS.Property("font-variant-numeric", value.rawValue)
}

public func textOverflow(_ value: CSS.TextOverflow) -> CSS.Property {
  CSS.Property("text-overflow", value.value)
}

public func textOverflow(_ value: String) -> CSS.Property {
  CSS.Property("text-overflow", value)
}

public func textOverflow(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("text-overflow", value.rawValue)
}

public func color(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("color", value.value)
}

public func color(_ value: String) -> CSS.Property {
  CSS.Property("color", value)
}

public func color(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("color", value.rawValue)
}

public func colorScheme(_ scheme: CSS.ColorScheme) -> CSS.Property {
  CSS.Property("color-scheme", scheme.rawValue)
}

public func colorScheme(_ s1: CSS.ColorScheme, _ s2: CSS.ColorScheme) -> CSS.Property {
  CSS.Property("color-scheme", "\(s1.rawValue) \(s2.rawValue)")
}
@available(*, deprecated)
public func colorScheme(_ value: String) -> CSS.Property {
  CSS.Property("color-scheme", value)
}

public func src(_ value: String) -> CSS.Property {
  CSS.Property("src", value)
}

public func backgroundColor(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("background-color", value.value)
}

public func backgroundColor(_ value: CSS.Keyword.Transparent) -> CSS.Property {
  CSS.Property("background-color", value.rawValue)
}

public func backgroundColor(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("background-color", value.rawValue)
}

public func backgroundColor(_ value: String) -> CSS.Property {
  CSS.Property("background-color", value)
}

public func borderRadius(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("border-radius", value.rawValue)
}

public func borderRadius(_ value: Int) -> CSS.Property {
  CSS.Property("border-radius", intToString(value))
}

public func borderRadius(_ value: Double) -> CSS.Property {
  CSS.Property("border-radius", doubleToString(value))
}

public func borderRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-radius", value.value)
}

public func borderRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("border-radius", value.value)
}

public func borderRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("border-radius", value.value)
}

public func borderRadius(
  _ topLeft: CSS.Length, _ topRight: CSS.Length, _ bottomRight: CSS.Length, _ bottomLeft: CSS.Length
) -> CSS.Property {
  CSS.Property(
    "border-radius", "\(topLeft.value) \(topRight.value) \(bottomRight.value) \(bottomLeft.value)")
}

public func borderRadius(
  _ tL: CSS.LengthPercentage, _ tR: CSS.LengthPercentage, _ bR: CSS.LengthPercentage, _ bL: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("border-radius", "\(tL.value) \(tR.value) \(bR.value) \(bL.value)")
}

// Directional border radius functions
public func borderTopLeftRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-top-left-radius", value.value)
}

public func borderTopLeftRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("border-top-left-radius", value.value)
}

public func borderTopLeftRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("border-top-left-radius", value.value)
}

public func borderTopRightRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-top-right-radius", value.value)
}

public func borderTopRightRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("border-top-right-radius", value.value)
}

public func borderTopRightRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("border-top-right-radius", value.value)
}

public func borderBottomLeftRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-bottom-left-radius", value.value)
}

public func borderBottomLeftRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("border-bottom-left-radius", value.value)
}

public func borderBottomLeftRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("border-bottom-left-radius", value.value)
}

public func borderBottomRightRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-bottom-right-radius", value.value)
}

public func borderBottomRightRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("border-bottom-right-radius", value.value)
}

public func borderBottomRightRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("border-bottom-right-radius", value.value)
}

public func borderStartStartRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-start-start-radius", value.value)
}

public func borderStartStartRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("border-start-start-radius", value.value)
}

public func borderStartStartRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("border-start-start-radius", value.value)
}

public func borderStartEndRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-start-end-radius", value.value)
}

public func borderStartEndRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("border-start-end-radius", value.value)
}

public func borderStartEndRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("border-start-end-radius", value.value)
}

public func borderEndStartRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-end-start-radius", value.value)
}

public func borderEndStartRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("border-end-start-radius", value.value)
}

public func borderEndStartRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("border-end-start-radius", value.value)
}

public func borderEndEndRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-end-end-radius", value.value)
}

public func borderEndEndRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("border-end-end-radius", value.value)
}

public func borderEndEndRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("border-end-end-radius", value.value)
}

public func border(_ value: String) -> CSS.Property {
  CSS.Property("border", value)
}

public func border(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("border", value.rawValue)
}

public func border(_ width: CSS.Length, _ style: CSS.Border.LineStyle) -> CSS.Property {
  CSS.Property("border", "\(width.value) \(style.value)")
}

public func border(_ width: CSS.Percentage, _ style: CSS.Border.LineStyle) -> CSS.Property {
  CSS.Property("border", "\(width.value) \(style.value)")
}

public func border(_ width: CSS.LengthPercentage, _ style: CSS.Border.LineStyle) -> CSS.Property {
  CSS.Property("border", "\(width.value) \(style.value)")
}

public func border(_ width: CSS.Length, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border", "\(width.value) \(style.value) \(color.value)") }

public func border(_ width: CSS.Percentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border", "\(width.value) \(style.value) \(color.value)") }

public func border(_ width: CSS.LengthPercentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border", "\(width.value) \(style.value) \(color.value)") }

public func borderWidth(_ value: Int) -> CSS.Property {
  CSS.Property("border-width", intToString(value))
}

public func borderWidth(_ value: Double) -> CSS.Property {
  CSS.Property("border-width", doubleToString(value))
}

public func borderWidth(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-width", value.value)
}

public func borderWidth(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("border-width", value.value)
}

public func borderWidth(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("border-width", value.value)
}

public func borderWidth(_ value: String) -> CSS.Property {
  CSS.Property("border-width", value)
}

public func borderStyle(_ value: CSS.Border.LineStyle) -> CSS.Property {
  CSS.Property("border-style", value.value)
}

public func borderStyle(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("border-style", value.rawValue)
}

public func borderStyle(_ value: String) -> CSS.Property {
  CSS.Property("border-style", value)
}

public func fill<T: CSSPaintConvertible>(_ value: T) -> CSS.Property {
  CSS.Property("fill", value.asCSSPaint.value)
}

public func fill(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("fill", value.rawValue)
}
@_disfavoredOverload
public func fill(_ value: String) -> CSS.Property {
  CSS.Property("fill", value)
}

public func stroke<T: CSSPaintConvertible>(_ value: T) -> CSS.Property {
  CSS.Property("stroke", value.asCSSPaint.value)
}

public func stroke(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("stroke", value.rawValue)
}
@_disfavoredOverload
public func stroke(_ value: String) -> CSS.Property {
  CSS.Property("stroke", value)
}

public func fillRule(_ value: String) -> CSS.Property {
  CSS.Property("fill-rule", value)
}

public func clipRule(_ value: String) -> CSS.Property {
  CSS.Property("clip-rule", value)
}

public func strokeLinejoin(_ value: CSS.StrokeLinejoin) -> CSS.Property {
  CSS.Property("stroke-linejoin", value.rawValue)
}

public func strokeLinejoin(_ value: String) -> CSS.Property {
  CSS.Property("stroke-linejoin", value)
}
@_disfavoredOverload
public func strokeMiterlimit(_ value: String) -> CSS.Property {
  CSS.Property("stroke-miterlimit", value)
}
@_disfavoredOverload
public func strokeMiterlimit(_ value: Double) -> CSS.Property {
  CSS.Property("stroke-miterlimit", doubleToString(value))
}

public func flexDirection(_ value: CSS.FlexDirection) -> CSS.Property {
  CSS.Property("flex-direction", value.rawValue)
}

public func alignItems(_ value: CSS.AlignItems) -> CSS.Property {
  CSS.Property("align-items", value.rawValue)
}

public func justifyContent(_ value: CSS.JustifyContent) -> CSS.Property {
  CSS.Property("justify-content", value.rawValue)
}
@_disfavoredOverload
public func flexDirection(_ value: String) -> CSS.Property {
  CSS.Property("flex-direction", value)
}

@_disfavoredOverload
public func alignItems(_ value: String) -> CSS.Property {
  CSS.Property("align-items", value)
}

public func alignSelf(_ value: String) -> CSS.Property {
  CSS.Property("align-self", value)
}

public func alignSelf(_ value: CSS.AlignSelf) -> CSS.Property {
  CSS.Property("align-self", value.rawValue)
}
@_disfavoredOverload
public func justifyContent(_ value: String) -> CSS.Property {
  CSS.Property("justify-content", value)
}

public func boxSizing(_ value: CSS.BoxSizing) -> CSS.Property {
  CSS.Property("box-sizing", value.value)
}

@available(*, deprecated)
public func boxSizing(_ value: String) -> CSS.Property {
  CSS.Property("box-sizing", value)
}

public func backgroundClip(_ value: CSS.BackgroundClip) -> CSS.Property {
  CSS.Property("background-clip", value.value)
}

public func backgroundClip(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("background-clip", value.rawValue)
}

public func fieldSizing(_ value: CSS.FieldSizing) -> CSS.Property {
  CSS.Property("field-sizing", value.rawValue)
}

public func maxWidth(_ value: Int) -> CSS.Property {
  CSS.Property("max-width", intToString(value))
}

public func maxWidth(_ value: Double) -> CSS.Property {
  CSS.Property("max-width", doubleToString(value))
}

public func maxWidth(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("max-width", value.value)
}

public func maxWidth(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("max-width", value.value)
}

public func maxWidth(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("max-width", value.value)
}

public func maxWidth(_ value: CSS.Keyword.Length) -> CSS.Property {
  CSS.Property("max-width", value.rawValue)
}

public func maxWidth(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("max-width", value.rawValue)
}

public func maxWidth(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("max-width", value.rawValue)
}

public func paddingRight(_ value: Int) -> CSS.Property {
  CSS.Property("padding-right", intToString(value))
}

public func paddingRight(_ value: Double) -> CSS.Property {
  CSS.Property("padding-right", doubleToString(value))
}

public func paddingRight(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("padding-right", value.value)
}

public func paddingRight(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("padding-right", value.value)
}

public func paddingRight(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding-right", value.value)
}

public func paddingLeft(_ value: Int) -> CSS.Property {
  CSS.Property("padding-left", intToString(value))
}

public func paddingLeft(_ value: Double) -> CSS.Property {
  CSS.Property("padding-left", doubleToString(value))
}

public func paddingLeft(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("padding-left", value.value)
}

public func paddingLeft(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("padding-left", value.value)
}

public func paddingLeft(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding-left", value.value)
}
// MARK: - Transition Property
public func transition(_ value: String) -> CSS.Property {
  CSS.Property("transition", value)
}

public func transition(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("transition", value.rawValue)
}

// transition-property = none | <single-transition-property>#
public func transitionProperty(_ properties: CSS.SingleTransitionProperty...) -> CSS.Property {
  var results = ""
  for (index, p) in properties.enumerated() {
    results = "\(results)\(p.value)"
    if index < properties.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("transition-property", results)
}

public func transitionProperty(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("transition-property", value.rawValue)
}

// MARK: - Will Change
public func willChange(_ properties: CSS.SingleTransitionProperty...) -> CSS.Property {
  var results = ""
  for (index, p) in properties.enumerated() {
    results = "\(results)\(p.value)"
    if index < properties.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("will-change", results)
}

// transition-duration = <time>#
public func transitionDuration(_ durations: CSS.Time...) -> CSS.Property {
  var results = ""
  for (index, d) in durations.enumerated() {
    results = "\(results)\(d.value)"
    if index < durations.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("transition-duration", results)
}

// transition-timing-function = <easing-function>#
public func transitionTimingFunction(_ functions: CSS.EasingFunction...) -> CSS.Property {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("transition-timing-function", results)
}

public func transitionTimingFunction(_ value: String) -> CSS.Property {
  CSS.Property("transition-timing-function", value)
}

// transition-delay = <time>#
public func transitionDelay(_ delays: CSS.Time...) -> CSS.Property {
  var results = ""
  for (index, d) in delays.enumerated() {
    results = "\(results)\(d.value)"
    if index < delays.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("transition-delay", results)
}

// transition-behavior = <transition-behavior-value>#
public func transitionBehavior(_ behaviors: CSS.TransitionBehaviorValue...) -> CSS.Property {
  var results = ""
  for (index, b) in behaviors.enumerated() {
    results = "\(results)\(b.rawValue)"
    if index < behaviors.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("transition-behavior", results)
}

public func letterSpacing(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("letter-spacing", value.value)
}

public func letterSpacing(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("letter-spacing", value.value)
}

public func letterSpacing(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("letter-spacing", value.value)
}

public func transform(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("transform", value.value)
}

public func transform(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("transform", value.value)
}

public func transform(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("transform", value.value)
}

public func transformStyle(_ value: CSS.TransformStyle) -> CSS.Property {
  CSS.Property("transform-style", value.rawValue)
}

public func transformStyle(_ value: String) -> CSS.Property {
  CSS.Property("transform-style", value)
}

// transition = <single-transition>#
// <single-transition> = [ none | <single-transition-property> ] || <time> || <easing-function> || <time> || <transition-behavior-value>
public func transition(_ transitions: CSS.SingleTransition...) -> CSS.Property {
  var results = ""
  for (index, t) in transitions.enumerated() {
    results = "\(results)\(t.value)"
    if index < transitions.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("transition", results)
}

// Convenience: unwrapped tuple syntax
public func transition(_ property: CSS.SingleTransitionProperty, _ duration: CSS.Time)
  -> CSS.Property
{
  transition(CSS.SingleTransition(property, duration, .ease))
}

public func transition(_ property: String, _ duration: CSS.Time) -> CSS.Property {
  CSS.Property("transition", "\(property) \(duration.value)")
}

public func transition(_ property: CSS.Keyword.All, _ duration: CSS.Time) -> CSS.Property {
  CSS.Property("transition", "all \(duration.value)")
}

public func transition(
  _ property: CSS.SingleTransitionProperty, _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction
) -> CSS.Property {
  transition(CSS.SingleTransition(property, duration, easingFunction))
}

public func transition(
  _ properties: (CSS.SingleTransitionProperty, CSS.SingleTransitionProperty),
  _ duration: CSS.Time,
  _ easingFunction: CSS.EasingFunction
) -> CSS.Property {
  transition(
    CSS.SingleTransition(properties.0, duration, easingFunction),
    CSS.SingleTransition(properties.1, duration, easingFunction)
  )
}

public func transition(
  _ properties: (
    CSS.SingleTransitionProperty, CSS.SingleTransitionProperty, CSS.SingleTransitionProperty
  ),
  _ duration: CSS.Time,
  _ easingFunction: CSS.EasingFunction
) -> CSS.Property {
  transition(
    CSS.SingleTransition(properties.0, duration, easingFunction),
    CSS.SingleTransition(properties.1, duration, easingFunction),
    CSS.SingleTransition(properties.2, duration, easingFunction)
  )
}

public func transition(
  _ property: CSS.Keyword.All, _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction
) -> CSS.Property {
  CSS.Property("transition", "all \(duration.value) \(easingFunction.value)")
}

public func transition(
  _ property: CSS.Keyword.All, _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction,
  _ delay: CSS.Time
) -> CSS.Property {
  CSS.Property("transition", "all \(duration.value) \(easingFunction.value) \(delay.value)")
}

public func transition(
  _ property: CSS.SingleTransitionProperty, _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction,
  _ delay: CSS.Time
) -> CSS.Property {
  transition(CSS.SingleTransition(property, duration, easingFunction, delay))
}

public func transition(
  _ property: CSS.SingleTransitionProperty, _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction,
  _ behavior: CSS.TransitionBehaviorValue
) -> CSS.Property {
  transition(CSS.SingleTransition(property, duration, easingFunction, nil, behavior))
}

public func transition(
  _ property: CSS.SingleTransitionProperty, _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction,
  _ delay: CSS.Time, _ behavior: CSS.TransitionBehaviorValue
) -> CSS.Property {
  transition(CSS.SingleTransition(property, duration, easingFunction, delay, behavior))
}

// Overload for multiple (property, duration) tuples
public func transition(
  _ transition1: (CSS.SingleTransitionProperty, CSS.Time),
  _ transition2: (CSS.SingleTransitionProperty, CSS.Time)
) -> CSS.Property {
  transition(
    CSS.SingleTransition(transition1.0, transition1.1, .ease),
    CSS.SingleTransition(transition2.0, transition2.1, .ease)
  )
}

public func transition(
  _ transition1: (CSS.SingleTransitionProperty, CSS.Time),
  _ transition2: (CSS.SingleTransitionProperty, CSS.Time),
  _ transition3: (CSS.SingleTransitionProperty, CSS.Time)
) -> CSS.Property {
  transition(
    CSS.SingleTransition(transition1.0, transition1.1, .ease),
    CSS.SingleTransition(transition2.0, transition2.1, .ease),
    CSS.SingleTransition(transition3.0, transition3.1, .ease)
  )
}

// Convenience: multiple transitions with unwrapped tuples
public func transition(
  _ t1: (CSS.SingleTransitionProperty, CSS.Time, CSS.EasingFunction),
  _ t2: (CSS.SingleTransitionProperty, CSS.Time, CSS.EasingFunction)
) -> CSS.Property {
  transition(
    CSS.SingleTransition(t1.0, t1.1, t1.2),
    CSS.SingleTransition(t2.0, t2.1, t2.2)
  )
}

public func transition(
  _ t1: (CSS.SingleTransitionProperty, CSS.Time, CSS.EasingFunction),
  _ t2: (CSS.SingleTransitionProperty, CSS.Time, CSS.EasingFunction),
  _ t3: (CSS.SingleTransitionProperty, CSS.Time, CSS.EasingFunction)
) -> CSS.Property {
  transition(
    CSS.SingleTransition(t1.0, t1.1, t1.2),
    CSS.SingleTransition(t2.0, t2.1, t2.2),
    CSS.SingleTransition(t3.0, t3.1, t3.2)
  )
}

public func transition(
  _ t1: (CSS.SingleTransitionProperty, CSS.Time, CSS.EasingFunction),
  _ t2: (CSS.SingleTransitionProperty, CSS.Time, CSS.EasingFunction),
  _ t3: (CSS.SingleTransitionProperty, CSS.Time, CSS.EasingFunction),
  _ t4: (CSS.SingleTransitionProperty, CSS.Time, CSS.EasingFunction)
) -> CSS.Property {
  transition(
    CSS.SingleTransition(t1.0, t1.1, t1.2),
    CSS.SingleTransition(t2.0, t2.1, t2.2),
    CSS.SingleTransition(t3.0, t3.1, t3.2),
    CSS.SingleTransition(t4.0, t4.1, t4.2)
  )
}

public func transition(
  _ t1: (CSS.SingleTransitionProperty, CSS.Time, CSS.EasingFunction),
  _ t2: (CSS.SingleTransitionProperty, CSS.Time, CSS.EasingFunction),
  _ t3: (CSS.SingleTransitionProperty, CSS.Time, CSS.EasingFunction),
  _ t4: (CSS.SingleTransitionProperty, CSS.Time, CSS.EasingFunction),
  _ t5: (CSS.SingleTransitionProperty, CSS.Time, CSS.EasingFunction)
) -> CSS.Property {
  transition(
    CSS.SingleTransition(t1.0, t1.1, t1.2),
    CSS.SingleTransition(t2.0, t2.1, t2.2),
    CSS.SingleTransition(t3.0, t3.1, t3.2),
    CSS.SingleTransition(t4.0, t4.1, t4.2),
    CSS.SingleTransition(t5.0, t5.1, t5.2)
  )
}

public func cursor(_ value: CSS.Cursor) -> CSS.Property {
  CSS.Property("cursor", value.value)
}

public func cursor(_ urlValue: String, _ fallback: CSS.Cursor) -> CSS.Property {
  CSS.Property("cursor", "\(urlValue), \(fallback.value)")
}

public func cursor(_ value: String) -> CSS.Property {
  CSS.Property("cursor", value)
}

public func outline(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("outline", value.rawValue)
}

public func outline(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("outline", value.rawValue)
}

public func outline(_ width: CSS.Length, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("outline", "\(width.value) \(style.value) \(color.value)") }

public func outline(_ width: CSS.Percentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("outline", "\(width.value) \(style.value) \(color.value)") }

public func outline(_ width: CSS.LengthPercentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("outline", "\(width.value) \(style.value) \(color.value)") }

public func outline(_ width: CSS.Length, _ style: CSS.Border.LineStyle, _ color: CSS.Keyword.Transparent)
  -> CSS.Property
{ CSS.Property("outline", "\(width.value) \(style.value) \(color.rawValue)") }

public func outline(_ value: String) -> CSS.Property {
  CSS.Property("outline", value)
}

public func outlineWidth(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("outline-width", value.value)
}

public func outlineWidth(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("outline-width", value.value)
}

public func outlineWidth(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("outline-width", value.value)
}

public func outlineWidth(_ value: String) -> CSS.Property {
  CSS.Property("outline-width", value)
}

public func outlineStyle(_ value: CSS.Border.LineStyle) -> CSS.Property {
  CSS.Property("outline-style", value.value)
}

public func outlineStyle(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("outline-style", value.rawValue)
}

public func outlineStyle(_ value: String) -> CSS.Property {
  CSS.Property("outline-style", value)
}

public func outlineColor(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("outline-color", value.value)
}

public func outlineColor(_ value: String) -> CSS.Property {
  CSS.Property("outline-color", value)
}

public func transform(_ value: String) -> CSS.Property {
  CSS.Property("transform", value)
}

public func transform(_ value: CSS.TransformFunction) -> CSS.Property {
  CSS.Property("transform", value.value)
}

public func transform(_ f1: CSS.TransformFunction, _ f2: CSS.TransformFunction) -> CSS.Property {
  CSS.Property("transform", "\(f1.value) \(f2.value)")
}

public func transform(
  _ f1: CSS.TransformFunction, _ f2: CSS.TransformFunction, _ f3: CSS.TransformFunction
) -> CSS.Property {
  CSS.Property("transform", "\(f1.value) \(f2.value) \(f3.value)")
}

public func transform(
  _ f1: CSS.TransformFunction, _ f2: CSS.TransformFunction, _ f3: CSS.TransformFunction,
  _ f4: CSS.TransformFunction
) -> CSS.Property {
  CSS.Property("transform", "\(f1.value) \(f2.value) \(f3.value) \(f4.value)")
}

public func zIndex(_ value: String) -> CSS.Property {
  CSS.Property("z-index", value)
}

public func zIndex(_ value: Int) -> CSS.Property {
  CSS.Property("z-index", "\(value)")
}

public func zIndex(_ value: CSS.Number) -> CSS.Property {
  CSS.Property("z-index", value.value)
}

public func top(_ value: Int) -> CSS.Property { CSS.Property("top", intToString(value)) }

public func top(_ value: Double) -> CSS.Property {
  CSS.Property("top", doubleToString(value))
}

public func top(_ value: CSS.Length) -> CSS.Property { CSS.Property("top", value.value) }

public func top(_ value: CSS.Percentage) -> CSS.Property { CSS.Property("top", value.value) }

public func top(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("top", value.value)
}

public func left(_ value: Int) -> CSS.Property { CSS.Property("left", intToString(value)) }

public func left(_ value: Double) -> CSS.Property {
  CSS.Property("left", doubleToString(value))
}

public func left(_ value: CSS.Length) -> CSS.Property { CSS.Property("left", value.value) }

public func left(_ value: CSS.Percentage) -> CSS.Property { CSS.Property("left", value.value) }

public func left(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("left", value.value)
}

public func right(_ value: Int) -> CSS.Property { CSS.Property("right", intToString(value)) }

public func right(_ value: Double) -> CSS.Property {
  CSS.Property("right", doubleToString(value))
}

public func right(_ value: CSS.Length) -> CSS.Property { CSS.Property("right", value.value) }

public func right(_ value: CSS.Percentage) -> CSS.Property { CSS.Property("right", value.value) }

public func right(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("right", value.value)
}

public func bottom(_ value: Int) -> CSS.Property {
  CSS.Property("bottom", intToString(value))
}

public func bottom(_ value: Double) -> CSS.Property {
  CSS.Property("bottom", doubleToString(value))
}

public func bottom(_ value: CSS.Length) -> CSS.Property { CSS.Property("bottom", value.value) }

public func bottom(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("bottom", value.value)
}

public func bottom(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("bottom", value.value)
}

public func overflowY(_ value: String) -> CSS.Property {
  CSS.Property("overflow-y", value)
}

public func overflowY(_ value: CSS.Overflow) -> CSS.Property {
  CSS.Property("overflow-y", value.rawValue)
}

public func overflowY(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("overflow-y", value.rawValue)
}

public func overflowX(_ value: String) -> CSS.Property {
  CSS.Property("overflow-x", value)
}

public func overflowX(_ value: CSS.Overflow) -> CSS.Property {
  CSS.Property("overflow-x", value.rawValue)
}

public func overflowX(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("overflow-x", value.rawValue)
}

public func overflow(_ value: String) -> CSS.Property {
  CSS.Property("overflow", value)
}

public func overflow(_ value: CSS.Overflow) -> CSS.Property {
  CSS.Property("overflow", value.rawValue)
}

public func overflow(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("overflow", value.rawValue)
}

public func overflow(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("overflow", value.rawValue)
}

public func overflowX(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("overflow-x", value.rawValue)
}

public func overflowY(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("overflow-y", value.rawValue)
}

public func objectFit(_ value: CSS.ObjectFit) -> CSS.Property {
  CSS.Property("object-fit", value.rawValue)
}

public func objectFit(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("object-fit", value.rawValue)
}

public func objectFit(_ value: String) -> CSS.Property {
  CSS.Property("object-fit", value)
}

public func objectPosition(_ value: CSS.ObjectPosition) -> CSS.Property {
  CSS.Property("object-position", value.rawValue)
}

public func objectPosition(_ value: String) -> CSS.Property {
  CSS.Property("object-position", value)
}

public func maxHeight(_ value: Int) -> CSS.Property {
  CSS.Property("max-height", intToString(value))
}

public func maxHeight(_ value: Double) -> CSS.Property {
  CSS.Property("max-height", doubleToString(value))
}

public func maxHeight(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("max-height", value.value)
}

public func maxHeight(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("max-height", value.value)
}

public func maxHeight(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("max-height", value.value)
}

public func minWidth(_ value: Int) -> CSS.Property {
  CSS.Property("min-width", intToString(value))
}

public func minWidth(_ value: Double) -> CSS.Property {
  CSS.Property("min-width", doubleToString(value))
}

public func minWidth(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("min-width", value.value)
}

public func minWidth(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("min-width", value.value)
}

public func minWidth(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("min-width", value.value)
}

public func minWidth(_ value: CSS.Keyword.Length) -> CSS.Property {
  CSS.Property("min-width", value.rawValue)
}

public func minWidth(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("min-width", value.rawValue)
}

public func minWidth(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("min-width", value.rawValue)
}

public func minHeight(_ value: Int) -> CSS.Property {
  CSS.Property("min-height", intToString(value))
}

public func minHeight(_ value: Double) -> CSS.Property {
  CSS.Property("min-height", doubleToString(value))
}

public func minHeight(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("min-height", value.value)
}

public func minHeight(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("min-height", value.value)
}

public func minHeight(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("min-height", value.value)
}

public func minHeight(_ value: CSS.Keyword.Length) -> CSS.Property {
  CSS.Property("min-height", value.rawValue)
}

public func minHeight(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("min-height", value.rawValue)
}

public func minHeight(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("min-height", value.rawValue)
}

public func marginTop(_ value: String) -> CSS.Property {
  CSS.Property("margin-top", value)
}

public func marginTop(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("margin-top", value.rawValue)
}

public func marginTop(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("margin-top", value.rawValue)
}

public func marginTop(_ value: Int) -> CSS.Property {
  CSS.Property("margin-top", intToString(value))
}

public func marginTop(_ value: Double) -> CSS.Property {
  CSS.Property("margin-top", doubleToString(value))
}

public func marginTop(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("margin-top", value.value)
}

public func marginTop(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("margin-top", value.value)
}

public func marginTop(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("margin-top", value.value)
}

public func marginLeft(_ value: Int) -> CSS.Property {
  CSS.Property("margin-left", intToString(value))
}

public func marginLeft(_ value: Double) -> CSS.Property {
  CSS.Property("margin-left", doubleToString(value))
}

public func marginLeft(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("margin-left", value.value)
}

public func marginLeft(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("margin-left", value.value)
}

public func marginLeft(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("margin-left", value.value)
}

public func marginLeft(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("margin-left", value.rawValue)
}

public func marginRight(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("margin-right", value.rawValue)
}

public func marginBottom(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("margin-bottom", value.rawValue)
}

public func marginBottom(_ value: Int) -> CSS.Property {
  CSS.Property("margin-bottom", intToString(value))
}

public func marginBottom(_ value: Double) -> CSS.Property {
  CSS.Property("margin-bottom", doubleToString(value))
}

public func marginBottom(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("margin-bottom", value.value)
}

public func marginBottom(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("margin-bottom", value.value)
}

public func marginBottom(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("margin-bottom", value.value)
}

public func marginRight(_ value: Int) -> CSS.Property {
  CSS.Property("margin-right", intToString(value))
}

public func marginRight(_ value: Double) -> CSS.Property {
  CSS.Property("margin-right", doubleToString(value))
}

public func marginRight(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("margin-right", value.value)
}

public func marginRight(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("margin-right", value.value)
}

public func marginRight(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("margin-right", value.value)
}

public func paddingTop(_ value: Int) -> CSS.Property {
  CSS.Property("padding-top", intToString(value))
}

public func paddingTop(_ value: Double) -> CSS.Property {
  CSS.Property("padding-top", doubleToString(value))
}

public func paddingTop(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("padding-top", value.value)
}

public func paddingTop(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("padding-top", value.value)
}

public func paddingTop(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding-top", value.value)
}

public func paddingBottom(_ value: Int) -> CSS.Property {
  CSS.Property("padding-bottom", intToString(value))
}

public func paddingBottom(_ value: Double) -> CSS.Property {
  CSS.Property("padding-bottom", doubleToString(value))
}

public func paddingBottom(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("padding-bottom", value.value)
}

public func paddingBottom(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("padding-bottom", value.value)
}

public func paddingBottom(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding-bottom", value.value)
}

public func textDecoration(_ value: String) -> CSS.Property {
  CSS.Property("text-decoration", value)
}

public func textDecoration(_ value: CSS.TextDecoration) -> CSS.Property {
  CSS.Property("text-decoration", value.value)
}

public func textDecoration(_ value: CSS.TextDecoration.Line) -> CSS.Property {
  CSS.Property("text-decoration", value.value)
}

public func textDecoration(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("text-decoration", value.rawValue)
}

public func textDecoration(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("text-decoration", value.rawValue)
}

public func letterSpacing(_ value: String) -> CSS.Property {
  CSS.Property("letter-spacing", value)
}

public func textTransform(_ value: String) -> CSS.Property {
  CSS.Property("text-transform", value)
}

public func textTransform(_ value: CSS.TextTransform) -> CSS.Property {
  CSS.Property("text-transform", value.rawValue)
}

public func textTransform(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("text-transform", value.rawValue)
}

public func textTransform(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("text-transform", value.rawValue)
}

public func whiteSpace(_ value: String) -> CSS.Property {
  CSS.Property("white-space", value)
}

public func wordWrap(_ value: String) -> CSS.Property {
  CSS.Property("word-wrap", value)
}

public func wordWrap(_ value: CSS.WordWrap) -> CSS.Property {
  CSS.Property("word-wrap", value.rawValue)
}

public func listStyle(_ value: String) -> CSS.Property {
  CSS.Property("list-style", value)
}

public func listStyle(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("list-style", value.rawValue)
}

public func listStyleType(_ value: String) -> CSS.Property {
  CSS.Property("list-style-type", value)
}

public func listStyleType(_ value: CSS.ListStyle.`Type`) -> CSS.Property {
  CSS.Property("list-style-type", value.rawValue)
}

public func listStyleType(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("list-style-type", value.rawValue)
}

public func borderBottom(_ value: String) -> CSS.Property {
  CSS.Property("border-bottom", value)
}

public func borderBottom(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("border-bottom", value.rawValue)
}

public func borderBottom(_ width: CSS.Length, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-bottom", "\(width.value) \(style.value) \(color.value)") }

public func borderBottom(_ width: CSS.Percentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-bottom", "\(width.value) \(style.value) \(color.value)") }

public func borderBottom(_ width: CSS.LengthPercentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-bottom", "\(width.value) \(style.value) \(color.value)") }

public func borderBottom(
  _ width: CSS.Length, _ style: CSS.Border.LineStyle, _ color: CSS.Keyword.Transparent
) -> CSS.Property {
  CSS.Property("border-bottom", "\(width.value) \(style.value) \(color.rawValue)")
}

public func borderTop(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("border-top", value.rawValue)
}

public func borderTop(_ width: CSS.Length, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-top", "\(width.value) \(style.value) \(color.value)") }

public func borderTop(_ width: CSS.Percentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-top", "\(width.value) \(style.value) \(color.value)") }

public func borderTop(_ width: CSS.LengthPercentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-top", "\(width.value) \(style.value) \(color.value)") }

public func borderRight(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("border-right", value.rawValue)
}

public func borderRight(_ width: CSS.Length, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-right", "\(width.value) \(style.value) \(color.value)") }

public func borderRight(_ width: CSS.Percentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-right", "\(width.value) \(style.value) \(color.value)") }

public func borderRight(_ width: CSS.LengthPercentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-right", "\(width.value) \(style.value) \(color.value)") }

public func borderLeft(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("border-left", value.rawValue)
}

public func borderLeft(_ width: CSS.Length, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-left", "\(width.value) \(style.value) \(color.value)") }

public func borderLeft(_ width: CSS.Percentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-left", "\(width.value) \(style.value) \(color.value)") }

public func borderLeft(_ width: CSS.LengthPercentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-left", "\(width.value) \(style.value) \(color.value)") }

public func borderColor(_ value: String) -> CSS.Property {
  CSS.Property("border-color", value)
}

public func borderColor(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("border-color", value.value)
}

public func borderColor(_ value: CSS.Keyword.Transparent) -> CSS.Property {
  CSS.Property("border-color", value.rawValue)
}

public func borderTopColor(_ value: String) -> CSS.Property {
  CSS.Property("border-top-color", value)
}

public func borderTopColor(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("border-top-color", value.value)
}

public func borderBottomColor(_ value: String) -> CSS.Property {
  CSS.Property("border-bottom-color", value)
}

public func borderBottomColor(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("border-bottom-color", value.value)
}

public func borderLeftColor(_ value: String) -> CSS.Property {
  CSS.Property("border-left-color", value)
}

public func borderLeftColor(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("border-left-color", value.value)
}

public func borderLeftStyle(_ value: CSS.Border.LineStyle) -> CSS.Property {
  CSS.Property("border-left-style", value.value)
}

public func borderLeftStyle(_ value: String) -> CSS.Property {
  CSS.Property("border-left-style", value)
}

public func borderLeftWidth(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-left-width", value.value)
}

public func borderLeftWidth(_ value: Int) -> CSS.Property {
  CSS.Property("border-left-width", intToString(value))
}

public func borderTopWidth(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-top-width", value.value)
}

public func borderTopWidth(_ value: Int) -> CSS.Property {
  CSS.Property("border-top-width", intToString(value))
}

public func borderBottomWidth(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-bottom-width", value.value)
}

public func borderBottomWidth(_ value: Int) -> CSS.Property {
  CSS.Property("border-bottom-width", intToString(value))
}

public func borderRightWidth(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-right-width", value.value)
}

public func borderRightWidth(_ value: Int) -> CSS.Property {
  CSS.Property("border-right-width", intToString(value))
}

public func borderRightColor(_ value: String) -> CSS.Property {
  CSS.Property("border-right-color", value)
}

public func borderRightColor(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("border-right-color", value.value)
}

public func borderCollapse(_ value: String) -> CSS.Property {
  CSS.Property("border-collapse", value)
}

public func borderCollapse(_ value: CSS.BorderCollapse) -> CSS.Property {
  CSS.Property("border-collapse", value.rawValue)
}

public func borderSpacing(_ value: Int) -> CSS.Property {
  CSS.Property("border-spacing", intToString(value))
}

public func borderSpacing(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-spacing", value.value)
}

public func borderSpacing(_ value: String) -> CSS.Property {
  CSS.Property("border-spacing", value)
}

public func tableLayout(_ value: String) -> CSS.Property {
  CSS.Property("table-layout", value)
}

public func tableLayout(_ value: CSS.TableLayout) -> CSS.Property {
  CSS.Property("table-layout", value.rawValue)
}

public func flex(_ value: String) -> CSS.Property {
  CSS.Property("flex", value)
}

public func flex(_ value: Int) -> CSS.Property {
  CSS.Property("flex", "\(value)")
}

public func flex(_ value: Double) -> CSS.Property {
  CSS.Property("flex", doubleToString(value))
}

public func flexGrow(_ value: String) -> CSS.Property {
  CSS.Property("flex-grow", value)
}

public func flexGrow(_ value: Int) -> CSS.Property {
  CSS.Property("flex-grow", "\(value)")
}

public func flexGrow(_ value: Double) -> CSS.Property {
  CSS.Property("flex-grow", doubleToString(value))
}

public func flexShrink(_ value: String) -> CSS.Property {
  CSS.Property("flex-shrink", value)
}

public func flexShrink(_ value: Int) -> CSS.Property {
  CSS.Property("flex-shrink", "\(value)")
}

public func flexShrink(_ value: Double) -> CSS.Property {
  CSS.Property("flex-shrink", doubleToString(value))
}

public func flexWrap(_ value: CSS.FlexWrap) -> CSS.Property {
  CSS.Property("flex-wrap", value.rawValue)
}

public func flexWrap(_ value: String) -> CSS.Property {
  CSS.Property("flex-wrap", value)
}
// flexBasis consolidated to String and Global, added protocol-based one if missing
public func flexBasis(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("flex-basis", value.value)
}

public func flexBasis(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("flex-basis", value.value)
}

public func flexBasis(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("flex-basis", value.value)
}

public func flexBasis(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("flex-basis", value.rawValue)
}

public func flexBasis(_ value: String) -> CSS.Property {
  CSS.Property("flex-basis", value)
}

public func order(_ value: Int) -> CSS.Property {
  CSS.Property("order", "\(value)")
}

public func order(_ value: String) -> CSS.Property {
  CSS.Property("order", value)
}

public func verticalAlign(_ value: String) -> CSS.Property {
  CSS.Property("vertical-align", value)
}

public func verticalAlign(_ value: CSS.VerticalAlign) -> CSS.Property {
  CSS.Property("vertical-align", value.rawValue)
}

public func scrollbarWidth(_ value: CSS.ScrollbarWidth) -> CSS.Property {
  CSS.Property("scrollbar-width", value.value)
}

public func scrollbarWidth(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("scrollbar-width", value.rawValue)
}

public func scrollbarWidth(_ value: String) -> CSS.Property {
  CSS.Property("scrollbar-width", value)
}

public func background(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("background", value.value)
}

public func background(_ value: CSS.Keyword.Transparent) -> CSS.Property {
  CSS.Property("background", value.rawValue)
}

public func background(_ value: CSS.Image.Gradient) -> CSS.Property {
  CSS.Property("background", value.value)
}

public func background(_ value: String) -> CSS.Property {
  CSS.Property("background", value)
}

public func backgroundImage(_ value: String) -> CSS.Property {
  CSS.Property("background-image", value)
}

public func backgroundSize(_ value: CSS.BackgroundSize) -> CSS.Property {
  CSS.Property("background-size", value.value)
}

public func backgroundSize(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("background-size", value.rawValue)
}

public func backgroundSize(_ value: String) -> CSS.Property {
  CSS.Property("background-size", value)
}

public func backgroundSize(_ width: CSS.Length, _ height: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("background-size", "\(width.value) \(height.rawValue)")
}

public func backgroundRepeat(_ value: CSS.BackgroundRepeat) -> CSS.Property {
  CSS.Property("background-repeat", value.rawValue)
}

public func backgroundRepeat(_ value: String) -> CSS.Property {
  CSS.Property("background-repeat", value)
}

public func backgroundPosition(_ value: String) -> CSS.Property {
  CSS.Property("background-position", value)
}

public func backgroundPosition(_ value: CSS.BackgroundPosition) -> CSS.Property {
  CSS.Property("background-position", value.value)
}

public func backgroundPosition(
  _ x: CSS.BackgroundPosition, _ xOffset: CSS.Length, _ y: CSS.BackgroundPosition
) -> CSS.Property {
  CSS.Property("background-position", "\(x.value) \(xOffset.value) \(y.value)")
}

public func backgroundPosition(
  _ x: CSS.BackgroundPosition, _ xOffset: CSS.Length, _ y: CSS.BackgroundPosition, _ yOffset: CSS.Length
) -> CSS.Property {
  CSS.Property("background-position", "\(x.value) \(xOffset.value) \(y.value) \(yOffset.value)")
}

public func appearance(_ value: String) -> CSS.Property {
  CSS.Property("appearance", value)
}

public func appearance(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("appearance", value.rawValue)
}

public func appearance(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("appearance", value.rawValue)
}

public func appearance(_ value: CSS.Appearance) -> CSS.Property {
  CSS.Property("appearance", value.rawValue)
}

public func appearance(_ value: CSS.Appearance.CompatAuto) -> CSS.Property {
  CSS.Property("appearance", value.rawValue)
}

public func appearance(_ value: CSS.Appearance.CompatSpecial) -> CSS.Property {
  CSS.Property("appearance", value.rawValue)
}

public func pointerEvents(_ value: String) -> CSS.Property {
  CSS.Property("pointer-events", value)
}

public func pointerEvents(_ value: CSS.PointerEvents) -> CSS.Property {
  CSS.Property("pointer-events", value.rawValue)
}

public func pointerEvents(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("pointer-events", value.rawValue)
}

public func pointerEvents(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("pointer-events", value.rawValue)
}

public func pointerEvents(_ value: CSS.Keyword.All) -> CSS.Property {
  CSS.Property("pointer-events", value.rawValue)
}

@_disfavoredOverload
public func strokeWidth(_ value: String) -> CSS.Property {
  CSS.Property("stroke-width", value)
}

public func strokeWidth(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("stroke-width", value.value)
}

public func strokeWidth(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("stroke-width", value.value)
}

public func strokeWidth(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("stroke-width", value.value)
}

public func strokeOpacity(_ value: Double) -> CSS.Property {
  CSS.Property("stroke-opacity", doubleToString(value))
}

public func strokeLinecap(_ value: SVG.StrokeLinecap) -> CSS.Property {
  CSS.Property("stroke-linecap", value.rawValue)
}
public func strokeLinejoin(_ value: SVG.StrokeLinejoin) -> CSS.Property {
  CSS.Property("stroke-linejoin", value.rawValue)
}

public func dominantBaseline(_ value: CSS.DominantBaseline) -> CSS.Property {
  CSS.Property("dominant-baseline", value.rawValue)
}

public func alignmentBaseline(_ value: CSS.AlignmentBaseline) -> CSS.Property {
  CSS.Property("alignment-baseline", value.rawValue)
}

public func textAnchor(_ value: CSS.TextAnchor) -> CSS.Property {
  CSS.Property("text-anchor", value.rawValue)
}

@_disfavoredOverload
public func opacity(_ value: Double) -> CSS.Property {
  CSS.Property("opacity", doubleToString(value))
}

@_disfavoredOverload
public func opacity(_ value: String) -> CSS.Property {
  CSS.Property("opacity", value)
}

public func opacity(_ value: CSS.Number) -> CSS.Property {
  CSS.Property("opacity", value.value)
}

public func gap(_ value: Int) -> CSS.Property { CSS.Property("gap", intToString(value)) }

public func gap(_ value: Double) -> CSS.Property {
  CSS.Property("gap", doubleToString(value))
}

public func gap(_ value: CSS.Length) -> CSS.Property { CSS.Property("gap", value.value) }

public func gap(_ value: CSS.Percentage) -> CSS.Property { CSS.Property("gap", value.value) }

public func gap(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("gap", value.value)
}

public func gap(_ rowGap: CSS.Length, _ columnGap: CSS.Length) -> CSS.Property {
  CSS.Property("gap", "\(rowGap.value) \(columnGap.value)")
}

public func gap(_ rowGap: CSS.Percentage, _ columnGap: CSS.Percentage) -> CSS.Property {
  CSS.Property("gap", "\(rowGap.value) \(columnGap.value)")
}

public func gap(_ rowGap: CSS.LengthPercentage, _ columnGap: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("gap", "\(rowGap.value) \(columnGap.value)")
}

public func gap(_ rowGap: CSS.Length, _ columnGap: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("gap", "\(rowGap.value) \(columnGap.value)")
}

public func gap(_ rowGap: CSS.LengthPercentage, _ columnGap: CSS.Length) -> CSS.Property {
  CSS.Property("gap", "\(rowGap.value) \(columnGap.value)")
}

public func content(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("content", value.rawValue)
}

public func content(_ value: String) -> CSS.Property {
  CSS.Property("content", value)
}

// CSSContent content with counter() function
public func content(_ counter: CSS.Counter, _ suffix: String = "") -> CSS.Property {
  let value =
    stringIsEmpty(suffix) ? "counter(\(counter.name))" : "counter(\(counter.name)) \"\(suffix)\""
  return CSS.Property("content", value)
}

public func content(_ c1: CSS.Counter, _ s1: String, _ c2: CSS.Counter, _ s2: String)
  -> CSS.Property
{
  let value = "counter(\(c1.name)) \"\(s1)\" counter(\(c2.name)) \"\(s2)\""
  return CSS.Property("content", value)
}

public func content(_ c: CSS.Counters, _ s: String) -> CSS.Property {
  let value = "counters(\(c.name), \"\(c.delimiter)\") \"\(s)\""
  return CSS.Property("content", value)
}

public func content(_ items: CSS.ContentList...) -> CSS.Property {
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
  return CSS.Property("content", results)
}

public func counter(_ name: String) -> CSS.Counter {
  CSS.Counter(name)
}

public func counters(_ name: String, _ delimiter: String) -> CSS.Counters {
  CSS.Counters(name, delimiter)
}

public func counterReset(_ name: String) -> CSS.Property {
  CSS.Property("counter-reset", name)
}

public func counterIncrement(_ name: String) -> CSS.Property {
  CSS.Property("counter-increment", name)
}

// box-shadow = <spread-shadow>#
public func boxShadow(_ shadows: CSS.SpreadShadow...) -> CSS.Property {
  var results = ""
  for (index, s) in shadows.enumerated() {
    results = "\(results)\(s.value)"
    if index < shadows.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("box-shadow", results)
}

// Convenience: Apply color to shadow (e.g., boxShadow(boxShadowOutsetSmall, boxShadowColorProgressiveFocus))
public func boxShadow(_ shadow: CSS.SpreadShadow, _ color: CSS.Color) -> CSS.Property {
  // Combine the shadow with the color by prepending color to shadow value
  let value = "\(color.value) \(shadow.value)"
  return CSS.Property("box-shadow", value)
}

// Convenience: Two shadows with colors (e.g., boxShadow((boxShadowOutsetMediumBelow, boxShadowColorAlphaBase), (boxShadowOutsetMediumAround, boxShadowColorAlphaBase)))
public func boxShadow(
  _ shadow1: (CSS.SpreadShadow, CSS.Color), _ shadow2: (CSS.SpreadShadow, CSS.Color)
) -> CSS.Property {
  let value1 = "\(shadow1.1.value) \(shadow1.0.value)"
  let value2 = "\(shadow2.1.value) \(shadow2.0.value)"
  return CSS.Property("box-shadow", "\(value1), \(value2)")
}

public func boxShadow(
  _ shadow1: (CSS.Length, CSS.Length, CSS.Length, CSS.Color), _ shadow2: (CSS.Length, CSS.Length, CSS.Length, CSS.Color)
) -> CSS.Property {
  CSS.Property(
    "box-shadow",
    "\(shadow1.0.value) \(shadow1.1.value) \(shadow1.2.value) \(shadow1.3.value), \(shadow2.0.value) \(shadow2.1.value) \(shadow2.2.value) \(shadow2.3.value)"
  )
}

public func boxShadow(
  _ shadow1: (CSS.LengthPercentage, CSS.LengthPercentage, CSS.LengthPercentage, CSS.Color),
  _ shadow2: (CSS.LengthPercentage, CSS.LengthPercentage, CSS.LengthPercentage, CSS.Color)
) -> CSS.Property {
  CSS.Property(
    "box-shadow",
    "\(shadow1.0.value) \(shadow1.1.value) \(shadow1.2.value) \(shadow1.3.value), \(shadow2.0.value) \(shadow2.1.value) \(shadow2.2.value) \(shadow2.3.value)"
  )
}

// Convenience: color, offsetX, offsetY, blur, spread, position (CSS.Color)
public func boxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length,
  _ spread: CSS.Length, _ position: CSS.SpreadShadow.BoxShadowPosition
) -> CSS.Property {
  boxShadow(
    CSS.SpreadShadow(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSS.SpreadShadow.BoxShadowBlur(blur),
      spread: CSS.SpreadShadow.BoxShadowSpread(spread),
      position: position
    ))
}

public func boxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length,
  _ spread: CSS.Length
) -> CSS.Property {
  boxShadow(
    CSS.SpreadShadow(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSS.SpreadShadow.BoxShadowBlur(blur),
      spread: CSS.SpreadShadow.BoxShadowSpread(spread)
    ))
}

// Convenience: offsetX, offsetY, blur, spread, color (color last)
public func boxShadow(
  _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length, _ spread: CSS.Length, _ color: CSS.Color
) -> CSS.Property {
  boxShadow(
    CSS.SpreadShadow(
      color: CSS.SpreadShadow.BoxShadowColor(color),
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSS.SpreadShadow.BoxShadowBlur(blur),
      spread: CSS.SpreadShadow.BoxShadowSpread(spread)
    ))
}

public func boxShadow(_ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length, _ color: CSS.Color)
  -> CSS.Property
{
  boxShadow(
    CSS.SpreadShadow(
      color: CSS.SpreadShadow.BoxShadowColor(color),
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSS.SpreadShadow.BoxShadowBlur(blur)
    ))
}

public func boxShadow(_ offsetX: CSS.Length, _ offsetY: CSS.Length, _ color: CSS.Color) -> CSS.Property {
  boxShadow(
    CSS.SpreadShadow(
      color: CSS.SpreadShadow.BoxShadowColor(color),
      offsetX: offsetX,
      offsetY: offsetY
    ))
}

public func boxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length
) -> CSS.Property {
  boxShadow(
    CSS.SpreadShadow(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSS.SpreadShadow.BoxShadowBlur(blur)
    ))
}

public func boxShadow(_ color: CSS.Color, _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length)
  -> CSS.Property
{
  boxShadow(
    CSS.SpreadShadow(
      color: CSS.SpreadShadow.BoxShadowColor(color),
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSS.SpreadShadow.BoxShadowBlur(blur)
    ))
}

public func boxShadow(
  _ offsetX: Int, _ offsetY: Int, _ blur: Int, _ spread: CSS.Length, _ color: CSS.Color
) -> CSS.Property {
  boxShadow(
    CSS.Length(integerLiteral: offsetX), CSS.Length(integerLiteral: offsetY), CSS.Length(integerLiteral: blur),
    spread, color)
}

public func boxShadow(_ offsetX: Int, _ offsetY: Int, _ blur: Int, _ color: CSS.Color)
  -> CSS.Property
{
  boxShadow(
    color, CSS.Length(integerLiteral: offsetX), CSS.Length(integerLiteral: offsetY),
    CSS.Length(integerLiteral: blur))
}

// Convenience: color, offsetX, offsetY (no blur, spread, position) (CSS.Color)
public func boxShadow(_ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length)
  -> CSS.Property
{
  boxShadow(
    CSS.SpreadShadow(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY
    ))
}

public func boxShadow(_ value: String) -> CSS.Property {
  CSS.Property("box-shadow", value)
}

public func boxShadow(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("box-shadow", value.rawValue)
}

public func listStylePosition(_ value: CSS.ListStyle.Position) -> CSS.Property {
  CSS.Property("list-style-position", value.rawValue)
}

public func listStylePosition(_ value: String) -> CSS.Property {
  CSS.Property("list-style-position", value)
}

// Convenience: position-first overload for inset shadows
// Usage: boxShadow(.inset, 0, 0, 0, px(1), color)
public func boxShadow(
  _ position: CSS.SpreadShadow.BoxShadowPosition, _ offsetX: CSS.Length, _ offsetY: CSS.Length,
  _ blur: CSS.Length, _ spread: CSS.Length, _ color: CSS.Color
) -> CSS.Property {
  boxShadow(
    CSS.SpreadShadow(
      color: CSS.SpreadShadow.BoxShadowColor(color),
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSS.SpreadShadow.BoxShadowBlur(blur),
      spread: CSS.SpreadShadow.BoxShadowSpread(spread),
      position: position
    ))
}

// Convenience: position-first without blur
// Usage: boxShadow(.inset, px(2), px(2), color)
public func boxShadow(
  _ position: CSS.SpreadShadow.BoxShadowPosition, _ offsetX: CSS.Length, _ offsetY: CSS.Length,
  _ color: CSS.Color
) -> CSS.Property {
  boxShadow(
    CSS.SpreadShadow(
      color: CSS.SpreadShadow.BoxShadowColor(color),
      offsetX: offsetX,
      offsetY: offsetY,
      position: position
    ))
}

public func boxShadow(
  _ position: CSS.SpreadShadow.BoxShadowPosition, _ offsetX: Int, _ offsetY: Int, _ blur: Int,
  _ spread: CSS.Length, _ color: CSS.Color
) -> CSS.Property {
  boxShadow(
    position, CSS.Length(integerLiteral: offsetX), CSS.Length(integerLiteral: offsetY),
    CSS.Length(integerLiteral: blur), spread, color)
}

public func outlineOffset(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("outline-offset", value.value)
}

public func outlineOffset(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("outline-offset", value.value)
}

public func outlineOffset(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("outline-offset", value.value)
}
// MARK: - Animation
// animation = <single-animation>#
public func animation(_ animations: CSS.SingleAnimation...) -> CSS.Property {
  var results = ""
  for (index, a) in animations.enumerated() {
    results = "\(results)\(a.value)"
    if index < animations.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("animation", results)
}

public func animation(_ value: String) -> CSS.Property {
  CSS.Property("animation", value)
}

// Convenience: unwrapped tuple syntax - minimal 3-param (name, duration, easing)
public func animation(_ name: String, _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction)
  -> CSS.Property
{
  animation(
    CSS.SingleAnimation(
      duration: .time(duration),
      easingFunction: easingFunction,
      name: .name(name)
    ))
}

// With iteration count (4 params)
public func animation(
  _ name: String, _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction,
  _ iterationCount: CSS.SingleAnimationIterationCount
) -> CSS.Property {
  animation(
    CSS.SingleAnimation(
      duration: .time(duration),
      easingFunction: easingFunction,
      iterationCount: iterationCount,
      name: .name(name)
    ))
}

// Convenience: accept CSS.Time directly (auto-wraps in duration type)
public func animation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String,
  _ iterationCount: CSS.SingleAnimationIterationCount
) -> CSS.Property {
  animation(
    CSS.SingleAnimation(
      duration: .time(duration),
      easingFunction: easingFunction,
      iterationCount: iterationCount,
      name: .name(name)
    ))
}

// With timeline as CSS.Scroll
public func animation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: CSS.Scroll
) -> CSS.Property {
  animation(
    CSS.SingleAnimation(
      duration: .time(duration),
      easingFunction: easingFunction,
      name: .name(name),
      timeline: .scroll(timeline)
    ))
}

// With timeline as CSS.View
public func animation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: CSS.View
) -> CSS.Property {
  animation(
    CSS.SingleAnimation(
      duration: .time(duration),
      easingFunction: easingFunction,
      name: .name(name),
      timeline: .view(timeline)
    ))
}

// With timeline as String (auto-converts to dashed-ident)
public func animation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: String
) -> CSS.Property {
  animation(
    CSS.SingleAnimation(
      duration: .time(duration),
      easingFunction: easingFunction,
      name: .name(name),
      timeline: .dashedIdent(CSS.DashedIdent(timeline))
    ))
}

// Full parameter convenience (5 params)
public func animation(
  duration: CSS.AnimationDuration? = nil,
  easingFunction: CSS.EasingFunction? = nil,
  delay: CSS.AnimationDelay? = nil,
  iterationCount: CSS.SingleAnimationIterationCount? = nil,
  direction: CSS.SingleAnimationDirection? = nil,
  fillMode: CSS.SingleAnimationFillMode? = nil,
  playState: CSS.SingleAnimationPlayState? = nil,
  name: CSS.KeyframesName? = nil,
  timeline: CSS.SingleAnimationTimeline? = nil
) -> CSS.Property {
  animation(
    CSS.SingleAnimation(
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
  duration: CSS.Time? = nil,
  easingFunction: CSS.EasingFunction? = nil,
  delay: CSS.Time? = nil,
  iterationCount: CSS.SingleAnimationIterationCount? = nil,
  direction: CSS.SingleAnimationDirection? = nil,
  fillMode: CSS.SingleAnimationFillMode? = nil,
  playState: CSS.SingleAnimationPlayState? = nil,
  name: CSS.KeyframesName? = nil,
  timeline: CSS.SingleAnimationTimeline? = nil
) -> CSS.Property {
  animation(
    CSS.SingleAnimation(
      duration: duration.map { .time($0) },
      easingFunction: easingFunction,
      delay: delay.map { CSS.AnimationDelay($0) },
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
  _ a1: (CSS.Time, CSS.EasingFunction, String, CSS.SingleAnimationIterationCount),
  _ a2: (CSS.Time, CSS.EasingFunction, String, CSS.SingleAnimationIterationCount)
) -> CSS.Property {
  animation(
    CSS.SingleAnimation(
      duration: .time(a1.0), easingFunction: a1.1, iterationCount: a1.3, name: .name(a1.2)),
    CSS.SingleAnimation(
      duration: .time(a2.0), easingFunction: a2.1, iterationCount: a2.3, name: .name(a2.2))
  )
}

public func animation(
  _ a1: (CSS.Time, CSS.EasingFunction, String, CSS.SingleAnimationIterationCount),
  _ a2: (CSS.Time, CSS.EasingFunction, String, CSS.SingleAnimationIterationCount),
  _ a3: (CSS.Time, CSS.EasingFunction, String, CSS.SingleAnimationIterationCount)
) -> CSS.Property {
  animation(
    CSS.SingleAnimation(
      duration: .time(a1.0), easingFunction: a1.1, iterationCount: a1.3, name: .name(a1.2)),
    CSS.SingleAnimation(
      duration: .time(a2.0), easingFunction: a2.1, iterationCount: a2.3, name: .name(a2.2)),
    CSS.SingleAnimation(
      duration: .time(a3.0), easingFunction: a3.1, iterationCount: a3.3, name: .name(a3.2))
  )
}

// animation-name = [ none | <keyframes-name> ]#
public func animationName(_ value: String) -> CSS.Property {
  CSS.Property("animation-name", value)
}

public func animationName(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("animation-name", value.rawValue)
}

// animation-duration = [ auto | <time [0s,∞]> ]#
public func animationDuration(_ durations: CSS.Time...) -> CSS.Property {
  var results = ""
  for (index, d) in durations.enumerated() {
    results = "\(results)\(d.value)"
    if index < durations.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("animation-duration", results)
}

public func animationDuration(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("animation-duration", value.rawValue)
}

public func animationDuration(_ value: String) -> CSS.Property {
  CSS.Property("animation-duration", value)
}

// animation-timing-function = <easing-function>#
public func animationTimingFunction(_ functions: CSS.EasingFunction...) -> CSS.Property {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("animation-timing-function", results)
}

public func animationTimingFunction(_ value: String) -> CSS.Property {
  CSS.Property("animation-timing-function", value)
}

// animation-delay = <time>#
public func animationDelay(_ delays: CSS.Time...) -> CSS.Property {
  var results = ""
  for (index, d) in delays.enumerated() {
    results = "\(results)\(d.value)"
    if index < delays.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("animation-delay", results)
}

public func animationDelay(_ value: String) -> CSS.Property {
  CSS.Property("animation-delay", value)
}

// animation-iteration-count = <single-animation-iteration-count>#
public func animationIterationCount(_ counts: CSS.SingleAnimationIterationCount...)
  -> CSS.Property
{
  var results = ""
  for (index, c) in counts.enumerated() {
    results = "\(results)\(c.value)"
    if index < counts.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("animation-iteration-count", results)
}

public func animationIterationCount(_ value: CSS.Keyword.Infinite) -> CSS.Property {
  CSS.Property("animation-iteration-count", value.rawValue)
}

public func animationIterationCount(_ value: String) -> CSS.Property {
  CSS.Property("animation-iteration-count", value)
}

// animation-direction = <single-animation-direction>#
public func animationDirection(_ directions: CSS.SingleAnimationDirection...) -> CSS.Property {
  var results = ""
  for (index, d) in directions.enumerated() {
    results = "\(results)\(d.rawValue)"
    if index < directions.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("animation-direction", results)
}

public func animationDirection(_ value: String) -> CSS.Property {
  CSS.Property("animation-direction", value)
}

// animation-fill-mode = <single-animation-fill-mode>#
public func animationFillMode(_ modes: CSS.SingleAnimationFillMode...) -> CSS.Property {
  var results = ""
  for (index, m) in modes.enumerated() {
    results = "\(results)\(m.rawValue)"
    if index < modes.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("animation-fill-mode", results)
}

public func animationFillMode(_ value: String) -> CSS.Property {
  CSS.Property("animation-fill-mode", value)
}

// animation-play-state = <single-animation-play-state>#
public func animationPlayState(_ states: CSS.SingleAnimationPlayState...) -> CSS.Property {
  var results = ""
  for (index, s) in states.enumerated() {
    results = "\(results)\(s.rawValue)"
    if index < states.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("animation-play-state", results)
}

public func animationPlayState(_ value: String) -> CSS.Property {
  CSS.Property("animation-play-state", value)
}

public func backfaceVisibility(_ value: CSS.BackfaceVisibility) -> CSS.Property {
  CSS.Property("backface-visibility", value.rawValue)
}

public func backfaceVisibility(_ value: String) -> CSS.Property {
  CSS.Property("backface-visibility", value)
}
// Single value
public func transformOrigin(_ value: CSS.TransformOrigin.Horizontal) -> CSS.Property {
  CSS.Property("transform-origin", value.rawValue)
}

public func transformOrigin(_ value: CSS.TransformOrigin.Vertical) -> CSS.Property {
  CSS.Property("transform-origin", value.rawValue)
}

public func transformOrigin(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("transform-origin", value.value)
}

public func transformOrigin(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("transform-origin", value.value)
}

public func transformOrigin(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("transform-origin", value.value)
}

// Two values
public func transformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical)
  -> CSS.Property
{
  CSS.Property("transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func transformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.Length) -> CSS.Property {
  CSS.Property("transform-origin", "\(x.rawValue) \(y.value)")
}

public func transformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.Percentage) -> CSS.Property
{
  CSS.Property("transform-origin", "\(x.rawValue) \(y.value)")
}

public func transformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.LengthPercentage)
  -> CSS.Property
{ CSS.Property("transform-origin", "\(x.rawValue) \(y.value)") }

public func transformOrigin(_ x: CSS.Length, _ y: CSS.TransformOrigin.Vertical) -> CSS.Property {
  CSS.Property("transform-origin", "\(x.value) \(y.rawValue)")
}

public func transformOrigin(_ x: CSS.Percentage, _ y: CSS.TransformOrigin.Vertical) -> CSS.Property {
  CSS.Property("transform-origin", "\(x.value) \(y.rawValue)")
}

public func transformOrigin(_ x: CSS.LengthPercentage, _ y: CSS.TransformOrigin.Vertical)
  -> CSS.Property
{ CSS.Property("transform-origin", "\(x.value) \(y.rawValue)") }

public func transformOrigin(_ x: CSS.Length, _ y: CSS.Length) -> CSS.Property {
  CSS.Property("transform-origin", "\(x.value) \(y.value)")
}

public func transformOrigin(_ x: CSS.Percentage, _ y: CSS.Percentage) -> CSS.Property {
  CSS.Property("transform-origin", "\(x.value) \(y.value)")
}

public func transformOrigin(_ x: CSS.LengthPercentage, _ y: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("transform-origin", "\(x.value) \(y.value)")
}

// Three values
public func transformOrigin(_ x: CSS.Length, _ y: CSS.Length, _ z: CSS.Length) -> CSS.Property {
  CSS.Property("transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func transformOrigin(_ x: CSS.LengthPercentage, _ y: CSS.LengthPercentage, _ z: CSS.LengthPercentage)
  -> CSS.Property
{ CSS.Property("transform-origin", "\(x.value) \(y.value) \(z.value)") }

// MARK: - Independent Transform Properties

@_disfavoredOverload
public func scale(_ value: Double) -> CSS.Property {
  CSS.Property("scale", doubleToString(value))
}

@_disfavoredOverload
public func scale(_ x: Double, _ y: Double) -> CSS.Property {
  CSS.Property("scale", "\(doubleToString(x)) \(doubleToString(y))")
}

@_disfavoredOverload
public func scale(_ x: Double, _ y: Double, _ z: Double) -> CSS.Property {
  CSS.Property("scale", "\(doubleToString(x)) \(doubleToString(y)) \(doubleToString(z))")
}

@_disfavoredOverload
public func rotate(_ angle: CSS.Angle) -> CSS.Property {
  CSS.Property("rotate", angle.value)
}

@_disfavoredOverload
public func translate(_ x: CSS.Length) -> CSS.Property { CSS.Property("translate", x.value) }

@_disfavoredOverload
public func translate(_ x: CSS.Percentage) -> CSS.Property { CSS.Property("translate", x.value) }

@_disfavoredOverload
public func translate(_ x: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("translate", x.value)
}

@_disfavoredOverload
public func translate(_ x: CSS.Length, _ y: CSS.Length) -> CSS.Property {
  CSS.Property("translate", "\(x.value) \(y.value)")
}

@_disfavoredOverload
public func translate(_ x: CSS.LengthPercentage, _ y: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("translate", "\(x.value) \(y.value)")
}

@_disfavoredOverload
public func translate(_ x: CSS.Length, _ y: CSS.Length, _ z: CSS.Length) -> CSS.Property {
  CSS.Property("translate", "\(x.value) \(y.value) \(z.value)")
}

@_disfavoredOverload
public func translate(_ x: CSS.LengthPercentage, _ y: CSS.LengthPercentage, _ z: CSS.LengthPercentage)
  -> CSS.Property
{ CSS.Property("translate", "\(x.value) \(y.value) \(z.value)") }

public func visibility(_ value: String) -> CSS.Property {
  CSS.Property("visibility", value)
}

public func visibility(_ value: CSS.Keyword.Visibility) -> CSS.Property {
  CSS.Property("visibility", value.rawValue)
}
@_disfavoredOverload
public func stopColor(_ value: String) -> CSS.Property {
  CSS.Property("stop-color", value)
}

public func stopColor(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("stop-color", value.value)
}
@_disfavoredOverload
public func stopOpacity(_ value: String) -> CSS.Property {
  CSS.Property("stop-opacity", value)
}
@_disfavoredOverload
public func stopOpacity(_ value: Double) -> CSS.Property {
  CSS.Property("stop-opacity", doubleToString(value))
}

public func gridTemplateRows(_ value: String) -> CSS.Property {
  CSS.Property("grid-template-rows", value)
}

public func gridTemplateRows(_ values: CSS.Length...) -> CSS.Property {
  CSS.Property("grid-template-rows", values.map { $0.value }.joinedString(separator: " "))
}

public func gridTemplateRows(_ values: CSS.Percentage...) -> CSS.Property {
  CSS.Property("grid-template-rows", values.map { $0.value }.joinedString(separator: " "))
}

public func gridTemplateRows(_ values: CSS.LengthPercentage...) -> CSS.Property {
  CSS.Property("grid-template-rows", values.map { $0.value }.joinedString(separator: " "))
}

public func gridTemplateColumns(_ value: String) -> CSS.Property {
  CSS.Property("grid-template-columns", value)
}

public func gridTemplateColumns(_ values: CSS.Length...) -> CSS.Property {
  CSS.Property("grid-template-columns", values.map { $0.value }.joinedString(separator: " "))
}

public func gridTemplateColumns(_ values: CSS.Percentage...) -> CSS.Property {
  CSS.Property("grid-template-columns", values.map { $0.value }.joinedString(separator: " "))
}

public func gridTemplateColumns(_ values: CSS.LengthPercentage...) -> CSS.Property {
  CSS.Property("grid-template-columns", values.map { $0.value }.joinedString(separator: " "))
}

public func gridColumn(_ value: String) -> CSS.Property {
  CSS.Property("grid-column", value)
}

public func gridTemplateColumns(_ a: CSS.Length, _ b: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("grid-template-columns", "\(a.value) auto")
}

public func gridTemplateColumns(_ a: CSS.Length, _ b: CSS.Length, _ c: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("grid-template-columns", "\(a.value) \(b.value) auto")
}

public func gridTemplateColumns(_ a: CSS.Length, _ b: CSS.Length, _ c: CSS.Length, _ d: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("grid-template-columns", "\(a.value) \(b.value) \(c.value) auto")
}

public func accentColor(_ value: String) -> CSS.Property {
  CSS.Property("accent-color", value)
}

public func accentColor(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("accent-color", value.value)
}

public func resize(_ value: String) -> CSS.Property {
  CSS.Property("resize", value)
}

public func resize(_ value: CSS.Resize) -> CSS.Property {
  CSS.Property("resize", value.rawValue)
}

public func resize(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("resize", value.rawValue)
}

public func clip(_ value: String) -> CSS.Property {
  CSS.Property("clip", value)
}

public func backgroundBlendMode(_ value: CSS.BlendMode) -> CSS.Property {
  CSS.Property("background-blend-mode", value.value)
}

public func backgroundBlendMode(_ value: String) -> CSS.Property {
  CSS.Property("background-blend-mode", value)
}

public func mixBlendMode(_ value: CSS.BlendMode) -> CSS.Property {
  CSS.Property("mix-blend-mode", value.value)
}

public func mixBlendMode(_ value: CSS.MixBlendMode) -> CSS.Property {
  CSS.Property("mix-blend-mode", value.rawValue)
}

public func textSizeAdjust(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("text-size-adjust", value.rawValue)
}

public func textSizeAdjust(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("text-size-adjust", value.rawValue)
}

public func userSelect(_ value: CSS.UserSelect) -> CSS.Property {
  CSS.Property("user-select", value.rawValue)
}

public func userSelect(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("user-select", value.rawValue)
}

@_disfavoredOverload
public func userSelect(_ value: String) -> CSS.Property {
  CSS.Property("user-select", value)
}

public func whiteSpace(_ value: CSS.WhiteSpace) -> CSS.Property {
  CSS.Property("white-space", value.rawValue)
}

public func whiteSpace(_ value: CSS.Keyword.Global) -> CSS.Property {
  CSS.Property("white-space", value.rawValue)
}

public func tabSize(_ value: Int) -> CSS.Property {
  CSS.Property("tab-size", "\(value)")
}

public func tabSize(_ value: CSS.Length) -> CSS.Property { CSS.Property("tab-size", value.value) }

public func tabSize(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("tab-size", value.value)
}

public func tabSize(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("tab-size", value.value)
}

public func wordBreak(_ value: CSS.WordBreak) -> CSS.Property {
  CSS.Property("word-break", value.rawValue)
}

public func overflowWrap(_ value: CSS.WordWrap) -> CSS.Property {
  CSS.Property("overflow-wrap", value.rawValue)
}

public func customProperty(_ name: String, _ value: String) -> CSS.Property {
  CSS.Property(name, value)
}

public func customProperty(_ name: String, _ value: Int) -> CSS.Property {
  CSS.Property(name, "\(value)")
}

public func customProperty(_ name: String, _ value: Double) -> CSS.Property {
  CSS.Property(name, doubleToString(value))
}

public func customProperty(_ name: String, _ value: CSS.Color) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.BlendMode) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.MixBlendMode) -> CSS.Property {
  CSS.Property(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSS.Cursor) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.EasingFunction) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.SingleAnimationIterationCount)
  -> CSS.Property
{
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.TextDecoration) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.TextDecoration.Line) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.TextDecoration.Style) -> CSS.Property {
  CSS.Property(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSS.TextDecoration.Thickness) -> CSS.Property
{
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.TextOverflow) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.Position) -> CSS.Property {
  CSS.Property(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSS.FlexDirection) -> CSS.Property {
  CSS.Property(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSS.AlignItems) -> CSS.Property {
  CSS.Property(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSS.JustifyContent) -> CSS.Property {
  CSS.Property(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSS.Display.Outside) -> CSS.Property {
  CSS.Property(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSS.Display.Inside) -> CSS.Property {
  CSS.Property(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSS.FontFamily) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.FontFamily.GenericFamily.GenericComplete)
  -> CSS.Property
{
  CSS.Property(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSS.FontFamily.GenericFamily.GenericIncomplete)
  -> CSS.Property
{
  CSS.Property(name, value.rawValue)
}

public func customProperty(
  _ name: String, _ value: CSS.FontFamily.GenericFamily.GenericScriptSpecific
) -> CSS.Property {
  CSS.Property(name, value.description)
}

public func customProperty(_ name: String, _ value: CSS.FontFamily.GenericFamily) -> CSS.Property
{
  CSS.Property(name, value.description)
}

public func customProperty(_ name: String, _ value: CSS.Border.LineStyle) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String,
  _ value: CSS.Length) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String,
  _ value: CSS.Percentage) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String,
  _ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.Keyword.Length) -> CSS.Property {
  CSS.Property(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSS.BoxSizing) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.BackgroundSize) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.BackgroundPosition) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.Time) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.TransformFunction) -> CSS.Property {
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.SingleTransitionProperty) -> CSS.Property
{
  CSS.Property(name, value.value)
}

public func customProperty(_ name: String, _ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSS.Keyword.Transparent) -> CSS.Property {
  CSS.Property(name, value.rawValue)
}

public func customProperty(
  _ name: String,
  _ properties: (
    CSS.SingleTransitionProperty, CSS.SingleTransitionProperty, CSS.SingleTransitionProperty
  )
) -> CSS.Property {
  CSS.Property(name, "\(properties.0.value), \(properties.1.value), \(properties.2.value)")
}

public func customProperty(
  _ name: String,
  _ properties: (
    CSS.SingleTransitionProperty, CSS.SingleTransitionProperty, CSS.SingleTransitionProperty,
    CSS.SingleTransitionProperty
  )
) -> CSS.Property {
  CSS.Property(
    name,
    "\(properties.0.value), \(properties.1.value), \(properties.2.value), \(properties.3.value)")
}

@_disfavoredOverload
public func customProperty(
  _ name: String, _ boxShadow: (CSS.SpreadShadow.BoxShadowPosition, CSS.Length, CSS.Length, CSS.Length, CSS.Length)
) -> CSS.Property {
  CSS.Property(
    name,
    "\(boxShadow.0.rawValue) \(boxShadow.1.value) \(boxShadow.2.value) \(boxShadow.3.value) \(boxShadow.4.value)"
  )
}

public func customProperty(
  _ name: String,
  _ boxShadow: (
    CSS.SpreadShadow.BoxShadowPosition, CSS.LengthPercentage, CSS.LengthPercentage, CSS.LengthPercentage,
    CSS.LengthPercentage
  )
) -> CSS.Property {
  CSS.Property(
    name,
    "\(boxShadow.0.rawValue) \(boxShadow.1.value) \(boxShadow.2.value) \(boxShadow.3.value) \(boxShadow.4.value)"
  )
}

public func customProperty(_ name: String, _ boxShadow: (CSS.Length, CSS.Length, CSS.Length, CSS.Length))
  -> CSS.Property
{
  CSS.Property(
    name, "\(boxShadow.0.value) \(boxShadow.1.value) \(boxShadow.2.value) \(boxShadow.3.value)")
}

public func customProperty(
  _ name: String,
  _ boxShadow: (CSS.LengthPercentage, CSS.LengthPercentage, CSS.LengthPercentage, CSS.LengthPercentage)
) -> CSS.Property {
  CSS.Property(
    name, "\(boxShadow.0.value) \(boxShadow.1.value) \(boxShadow.2.value) \(boxShadow.3.value)")
}

public func customProperty(_ name: String, _ value: (CSS.SpreadShadow, CSS.Color)) -> CSS.Property
{
  CSS.Property(name, "\(value.0.value) \(value.1.value)")
}

// Two box shadows with colors
public func customProperty(
  _ name: String, _ value: ((CSS.SpreadShadow, CSS.Color), (CSS.SpreadShadow, CSS.Color))
) -> CSS.Property {
  let shadow1 = "\(value.0.1.value) \(value.0.0.value)"
  let shadow2 = "\(value.1.1.value) \(value.1.0.value)"
  return CSS.Property(name, "\(shadow1), \(shadow2)")
}

// Border tuple (width, style, color)

public func customProperty(_ name: String, _ value: (CSS.Length, CSS.Border.LineStyle, CSS.Color))
  -> CSS.Property
{
  CSS.Property(name, "\(value.0.value) \(value.1.value) \(value.2.value)")
}

public func customProperty(
  _ name: String, _ value: (CSS.LengthPercentage, CSS.Border.LineStyle, CSS.Color)
) -> CSS.Property {
  CSS.Property(name, "\(value.0.value) \(value.1.value) \(value.2.value)")
}

public func customProperty(
  _ name: String, _ value: (CSS.Length, CSS.Border.LineStyle, CSS.Keyword.Transparent)
) -> CSS.Property {
  CSS.Property(name, "\(value.0.value) \(value.1.value) \(value.2.rawValue)")
}

public func customProperty(
  _ name: String, _ value: (CSS.LengthPercentage, CSS.Border.LineStyle, CSS.Keyword.Transparent)
) -> CSS.Property {
  CSS.Property(name, "\(value.0.value) \(value.1.value) \(value.2.rawValue)")
}

// Font stacks with GenericComplete
public func customProperty(
  _ name: String, _ fonts: (String, CSS.FontFamily.GenericFamily.GenericComplete)
) -> CSS.Property {
  CSS.Property(name, "\(fonts.0), \(fonts.1.rawValue)")
}

public func customProperty(
  _ name: String, _ fonts: (String, String, CSS.FontFamily.GenericFamily.GenericComplete)
) -> CSS.Property {
  CSS.Property(name, "\(fonts.0), \(fonts.1), \(fonts.2.rawValue)")
}

public func customProperty(
  _ name: String, _ fonts: (String, String, String, CSS.FontFamily.GenericFamily.GenericComplete)
) -> CSS.Property {
  CSS.Property(name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3.rawValue)")
}

public func customProperty(
  _ name: String,
  _ fonts: (String, String, String, String, CSS.FontFamily.GenericFamily.GenericComplete)
) -> CSS.Property {
  CSS.Property(name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4.rawValue)")
}

public func customProperty(
  _ name: String,
  _ fonts: (String, String, String, String, String, CSS.FontFamily.GenericFamily.GenericComplete)
) -> CSS.Property {
  CSS.Property(
    name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4), \(fonts.5.rawValue)")
}

public func customProperty(
  _ name: String,
  _ fonts: (
    String, String, String, String, String, String, CSS.FontFamily.GenericFamily.GenericComplete
  )
) -> CSS.Property {
  CSS.Property(
    name,
    "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4), \(fonts.5), \(fonts.6.rawValue)")
}

public func customProperty(
  _ name: String,
  _ fonts: (
    String, String, String, String, String, String, String,
    CSS.FontFamily.GenericFamily.GenericComplete
  )
) -> CSS.Property {
  CSS.Property(
    name,
    "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4), \(fonts.5), \(fonts.6), \(fonts.7.rawValue)"
  )
}

// Font stacks with GenericIncomplete + CSS.FontFamily
public func customProperty(
  _ name: String, _ fonts: (String, CSS.FontFamily.GenericFamily.GenericIncomplete, CSS.FontFamily)
) -> CSS.Property {
  CSS.Property(name, "\(fonts.0), \(fonts.1.rawValue), \(fonts.2.value)")
}

// Font stacks with just GenericIncomplete + CSS.FontFamily (no initial string)
public func customProperty(
  _ name: String, _ fonts: (CSS.FontFamily.GenericFamily.GenericIncomplete, CSS.FontFamily)
) -> CSS.Property {
  CSS.Property(name, "\(fonts.0.rawValue), \(fonts.1.value)")
}

// Font stacks with String + CSS.FontFamily
public func customProperty(_ name: String, _ fonts: (String, CSS.FontFamily)) -> CSS.Property {
  CSS.Property(name, "\(fonts.0), \(fonts.1.value)")
}

@available(*, deprecated)
public func property(_ name: String, _ value: String) -> CSS.Property {
  CSS.Property(name, value)
}

// Vendor-prefixed properties following CSSBuilder pattern

// MARK: - Appearance
public func webkitAppearance(_ value: CSS.Appearance) -> CSS.Property {
  CSS.Property("-webkit-appearance", value.rawValue)
}

public func webkitAppearance(_ value: CSS.Appearance.CompatAuto) -> CSS.Property {
  CSS.Property("-webkit-appearance", value.rawValue)
}

public func webkitAppearance(_ value: CSS.Appearance.CompatSpecial) -> CSS.Property {
  CSS.Property("-webkit-appearance", value.rawValue)
}

public func webkitAppearance(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-webkit-appearance", value.rawValue)
}

public func webkitAppearance(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("-webkit-appearance", value.rawValue)
}

public func mozAppearance(_ value: CSS.Appearance) -> CSS.Property {
  CSS.Property("-moz-appearance", value.rawValue)
}

public func mozAppearance(_ value: CSS.Appearance.CompatAuto) -> CSS.Property {
  CSS.Property("-moz-appearance", value.rawValue)
}

public func mozAppearance(_ value: CSS.Appearance.CompatSpecial) -> CSS.Property {
  CSS.Property("-moz-appearance", value.rawValue)
}

public func mozAppearance(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-moz-appearance", value.rawValue)
}

public func mozAppearance(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("-moz-appearance", value.rawValue)
}

// MARK: - User Select
public func webkitUserSelect(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-webkit-user-select", value.rawValue)
}

public func webkitUserSelect(_ value: CSS.UserSelect) -> CSS.Property {
  CSS.Property("-webkit-user-select", value.rawValue)
}

public func mozUserSelect(_ value: CSS.UserSelect) -> CSS.Property {
  CSS.Property("-moz-user-select", value.rawValue)
}

public func msUserSelect(_ value: CSS.UserSelect) -> CSS.Property {
  CSS.Property("-ms-user-select", value.rawValue)
}

// MARK: - Box Sizing
public func webkitBoxSizing(_ value: CSS.BoxSizing) -> CSS.Property {
  CSS.Property("-webkit-box-sizing", value.value)
}

public func mozBoxSizing(_ value: CSS.BoxSizing) -> CSS.Property {
  CSS.Property("-moz-box-sizing", value.value)
}

// MARK: - Transform
public func webkitTransform(_ value: CSS.TransformFunction) -> CSS.Property {
  CSS.Property("-webkit-transform", value.value)
}

public func mozTransform(_ value: CSS.TransformFunction) -> CSS.Property {
  CSS.Property("-moz-transform", value.value)
}

public func msTransform(_ value: CSS.TransformFunction) -> CSS.Property {
  CSS.Property("-ms-transform", value.value)
}

public func oTransform(_ value: CSS.TransformFunction) -> CSS.Property {
  CSS.Property("-o-transform", value.value)
}

// MARK: - Transform Origin
// Webkit - Single value
public func webkitTransformOrigin(_ value: CSS.TransformOrigin.Horizontal) -> CSS.Property {
  CSS.Property("-webkit-transform-origin", value.rawValue)
}

public func webkitTransformOrigin(_ value: CSS.TransformOrigin.Vertical) -> CSS.Property {
  CSS.Property("-webkit-transform-origin", value.rawValue)
}

public func webkitTransformOrigin(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-webkit-transform-origin", value.value)
}

public func webkitTransformOrigin(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-webkit-transform-origin", value.value)
}

public func webkitTransformOrigin(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-webkit-transform-origin", value.value)
}

public func webkitTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical
) -> CSS.Property {
  CSS.Property("-webkit-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func webkitTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.Length)
  -> CSS.Property
{ CSS.Property("-webkit-transform-origin", "\(x.rawValue) \(y.value)") }

public func webkitTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.Percentage)
  -> CSS.Property
{ CSS.Property("-webkit-transform-origin", "\(x.rawValue) \(y.value)") }

public func webkitTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.LengthPercentage)
  -> CSS.Property
{ CSS.Property("-webkit-transform-origin", "\(x.rawValue) \(y.value)") }

public func webkitTransformOrigin(_ x: CSS.Length, _ y: CSS.TransformOrigin.Vertical) -> CSS.Property
{
  CSS.Property("-webkit-transform-origin", "\(x.value) \(y.rawValue)")
}

public func webkitTransformOrigin(_ x: CSS.Percentage, _ y: CSS.TransformOrigin.Vertical)
  -> CSS.Property
{ CSS.Property("-webkit-transform-origin", "\(x.value) \(y.rawValue)") }

public func webkitTransformOrigin(_ x: CSS.LengthPercentage, _ y: CSS.TransformOrigin.Vertical)
  -> CSS.Property
{ CSS.Property("-webkit-transform-origin", "\(x.value) \(y.rawValue)") }

public func webkitTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.Length
) -> CSS.Property {
  CSS.Property("-webkit-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func webkitTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.Percentage
) -> CSS.Property {
  CSS.Property("-webkit-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func webkitTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-webkit-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func webkitTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.Length, _ z: CSS.Length)
  -> CSS.Property
{ CSS.Property("-webkit-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }

public func webkitTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.LengthPercentage, _ z: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-webkit-transform-origin", "\(x.rawValue) \(y.value) \(z.value)")
}

public func webkitTransformOrigin(_ x: CSS.Length, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.Length)
  -> CSS.Property
{ CSS.Property("-webkit-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }

public func webkitTransformOrigin(
  _ x: CSS.LengthPercentage, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-webkit-transform-origin", "\(x.value) \(y.rawValue) \(z.value)")
}

public func webkitTransformOrigin(_ x: CSS.Length, _ y: CSS.Length, _ z: CSS.Length) -> CSS.Property {
  CSS.Property("-webkit-transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func webkitTransformOrigin(
  _ x: CSS.LengthPercentage, _ y: CSS.LengthPercentage, _ z: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-webkit-transform-origin", "\(x.value) \(y.value) \(z.value)")
}

// Mozilla - Single value
public func mozTransformOrigin(_ value: CSS.TransformOrigin.Horizontal) -> CSS.Property {
  CSS.Property("-moz-transform-origin", value.rawValue)
}

public func mozTransformOrigin(_ value: CSS.TransformOrigin.Vertical) -> CSS.Property {
  CSS.Property("-moz-transform-origin", value.rawValue)
}

public func mozTransformOrigin(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-moz-transform-origin", value.value)
}

public func mozTransformOrigin(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-moz-transform-origin", value.value)
}

public func mozTransformOrigin(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-moz-transform-origin", value.value)
}

public func mozTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical)
  -> CSS.Property
{
  CSS.Property("-moz-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func mozTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.Length) -> CSS.Property {
  CSS.Property("-moz-transform-origin", "\(x.rawValue) \(y.value)")
}

public func mozTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.Percentage)
  -> CSS.Property
{ CSS.Property("-moz-transform-origin", "\(x.rawValue) \(y.value)") }

public func mozTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.LengthPercentage)
  -> CSS.Property
{ CSS.Property("-moz-transform-origin", "\(x.rawValue) \(y.value)") }

public func mozTransformOrigin(_ x: CSS.Length, _ y: CSS.TransformOrigin.Vertical) -> CSS.Property {
  CSS.Property("-moz-transform-origin", "\(x.value) \(y.rawValue)")
}

public func mozTransformOrigin(_ x: CSS.Percentage, _ y: CSS.TransformOrigin.Vertical) -> CSS.Property
{ CSS.Property("-moz-transform-origin", "\(x.value) \(y.rawValue)") }

public func mozTransformOrigin(_ x: CSS.LengthPercentage, _ y: CSS.TransformOrigin.Vertical)
  -> CSS.Property
{ CSS.Property("-moz-transform-origin", "\(x.value) \(y.rawValue)") }

public func mozTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.Length
) -> CSS.Property {
  CSS.Property("-moz-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func mozTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.Percentage
) -> CSS.Property {
  CSS.Property("-moz-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func mozTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-moz-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func mozTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.Length, _ z: CSS.Length)
  -> CSS.Property
{ CSS.Property("-moz-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }

public func mozTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.LengthPercentage, _ z: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-moz-transform-origin", "\(x.rawValue) \(y.value) \(z.value)")
}

public func mozTransformOrigin(_ x: CSS.Length, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.Length)
  -> CSS.Property
{ CSS.Property("-moz-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }

public func mozTransformOrigin(
  _ x: CSS.LengthPercentage, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-moz-transform-origin", "\(x.value) \(y.rawValue) \(z.value)")
}

public func mozTransformOrigin(_ x: CSS.Length, _ y: CSS.Length, _ z: CSS.Length) -> CSS.Property {
  CSS.Property("-moz-transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func mozTransformOrigin(_ x: CSS.LengthPercentage, _ y: CSS.LengthPercentage, _ z: CSS.LengthPercentage)
  -> CSS.Property
{ CSS.Property("-moz-transform-origin", "\(x.value) \(y.value) \(z.value)") }

// Microsoft - Single value
public func msTransformOrigin(_ value: CSS.TransformOrigin.Horizontal) -> CSS.Property {
  CSS.Property("-ms-transform-origin", value.rawValue)
}

public func msTransformOrigin(_ value: CSS.TransformOrigin.Vertical) -> CSS.Property {
  CSS.Property("-ms-transform-origin", value.rawValue)
}

public func msTransformOrigin(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-ms-transform-origin", value.value)
}

public func msTransformOrigin(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-ms-transform-origin", value.value)
}

public func msTransformOrigin(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-ms-transform-origin", value.value)
}

public func msTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical)
  -> CSS.Property
{
  CSS.Property("-ms-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func msTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.Length) -> CSS.Property {
  CSS.Property("-ms-transform-origin", "\(x.rawValue) \(y.value)")
}

public func msTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.Percentage)
  -> CSS.Property
{ CSS.Property("-ms-transform-origin", "\(x.rawValue) \(y.value)") }

public func msTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.LengthPercentage)
  -> CSS.Property
{ CSS.Property("-ms-transform-origin", "\(x.rawValue) \(y.value)") }

public func msTransformOrigin(_ x: CSS.Length, _ y: CSS.TransformOrigin.Vertical) -> CSS.Property {
  CSS.Property("-ms-transform-origin", "\(x.value) \(y.rawValue)")
}

public func msTransformOrigin(_ x: CSS.Percentage, _ y: CSS.TransformOrigin.Vertical) -> CSS.Property
{
  CSS.Property("-ms-transform-origin", "\(x.value) \(y.rawValue)")
}

public func msTransformOrigin(_ x: CSS.LengthPercentage, _ y: CSS.TransformOrigin.Vertical)
  -> CSS.Property
{ CSS.Property("-ms-transform-origin", "\(x.value) \(y.rawValue)") }

public func msTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.Length
) -> CSS.Property {
  CSS.Property("-ms-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func msTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.Percentage
) -> CSS.Property {
  CSS.Property("-ms-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func msTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-ms-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func msTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.Length, _ z: CSS.Length)
  -> CSS.Property
{ CSS.Property("-ms-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }

public func msTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.LengthPercentage, _ z: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-ms-transform-origin", "\(x.rawValue) \(y.value) \(z.value)")
}

public func msTransformOrigin(_ x: CSS.Length, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.Length)
  -> CSS.Property
{ CSS.Property("-ms-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }

public func msTransformOrigin(
  _ x: CSS.LengthPercentage, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-ms-transform-origin", "\(x.value) \(y.rawValue) \(z.value)")
}

public func msTransformOrigin(_ x: CSS.Length, _ y: CSS.Length, _ z: CSS.Length) -> CSS.Property {
  CSS.Property("-ms-transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func msTransformOrigin(_ x: CSS.LengthPercentage, _ y: CSS.LengthPercentage, _ z: CSS.LengthPercentage)
  -> CSS.Property
{ CSS.Property("-ms-transform-origin", "\(x.value) \(y.value) \(z.value)") }

// Opera - Single value
public func oTransformOrigin(_ value: CSS.TransformOrigin.Horizontal) -> CSS.Property {
  CSS.Property("-o-transform-origin", value.rawValue)
}

public func oTransformOrigin(_ value: CSS.TransformOrigin.Vertical) -> CSS.Property {
  CSS.Property("-o-transform-origin", value.rawValue)
}

public func oTransformOrigin(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-o-transform-origin", value.value)
}

public func oTransformOrigin(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-o-transform-origin", value.value)
}

public func oTransformOrigin(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-o-transform-origin", value.value)
}

public func oTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical)
  -> CSS.Property
{
  CSS.Property("-o-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func oTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.Length) -> CSS.Property {
  CSS.Property("-o-transform-origin", "\(x.rawValue) \(y.value)")
}

public func oTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.LengthPercentage)
  -> CSS.Property
{ CSS.Property("-o-transform-origin", "\(x.rawValue) \(y.value)") }

public func oTransformOrigin(_ x: CSS.Length, _ y: CSS.TransformOrigin.Vertical) -> CSS.Property {
  CSS.Property("-o-transform-origin", "\(x.value) \(y.rawValue)")
}

public func oTransformOrigin(_ x: CSS.LengthPercentage, _ y: CSS.TransformOrigin.Vertical)
  -> CSS.Property
{ CSS.Property("-o-transform-origin", "\(x.value) \(y.rawValue)") }

public func oTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.Length
) -> CSS.Property {
  CSS.Property("-o-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func oTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-o-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func oTransformOrigin(_ x: CSS.TransformOrigin.Horizontal, _ y: CSS.Length, _ z: CSS.Length)
  -> CSS.Property
{ CSS.Property("-o-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }

public func oTransformOrigin(
  _ x: CSS.TransformOrigin.Horizontal, _ y: CSS.LengthPercentage, _ z: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-o-transform-origin", "\(x.rawValue) \(y.value) \(z.value)")
}

public func oTransformOrigin(_ x: CSS.Length, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.Length)
  -> CSS.Property
{ CSS.Property("-o-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }

public func oTransformOrigin(
  _ x: CSS.LengthPercentage, _ y: CSS.TransformOrigin.Vertical, _ z: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-o-transform-origin", "\(x.value) \(y.rawValue) \(z.value)")
}

public func oTransformOrigin(_ x: CSS.Length, _ y: CSS.Length, _ z: CSS.Length) -> CSS.Property {
  CSS.Property("-o-transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func oTransformOrigin(_ x: CSS.LengthPercentage, _ y: CSS.LengthPercentage, _ z: CSS.LengthPercentage)
  -> CSS.Property
{ CSS.Property("-o-transform-origin", "\(x.value) \(y.value) \(z.value)") }

// MARK: - Transform Style
public func webkitTransformStyle(_ value: CSS.TransformStyle) -> CSS.Property {
  CSS.Property("-webkit-transform-style", value.rawValue)
}

public func mozTransformStyle(_ value: CSS.TransformStyle) -> CSS.Property {
  CSS.Property("-moz-transform-style", value.rawValue)
}

public func msTransformStyle(_ value: CSS.TransformStyle) -> CSS.Property {
  CSS.Property("-ms-transform-style", value.rawValue)
}

public func oTransformStyle(_ value: CSS.TransformStyle) -> CSS.Property {
  CSS.Property("-o-transform-style", value.rawValue)
}

// MARK: - Transition
public func webkitTransition(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-transition", value)
}

public func mozTransition(_ value: String) -> CSS.Property {
  CSS.Property("-moz-transition", value)
}

public func msTransition(_ value: String) -> CSS.Property {
  CSS.Property("-ms-transition", value)
}

public func oTransition(_ value: String) -> CSS.Property {
  CSS.Property("-o-transition", value)
}

// MARK: - Transition Delay
public func webkitTransitionDelay(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-webkit-transition-delay", value.value)
}

public func mozTransitionDelay(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-moz-transition-delay", value.value)
}

public func msTransitionDelay(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-ms-transition-delay", value.value)
}

public func oTransitionDelay(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-o-transition-delay", value.value)
}

// MARK: - Transition Duration
public func webkitTransitionDuration(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-webkit-transition-duration", value.value)
}

public func mozTransitionDuration(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-moz-transition-duration", value.value)
}

public func msTransitionDuration(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-ms-transition-duration", value.value)
}

public func oTransitionDuration(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-o-transition-duration", value.value)
}

// MARK: - Transition Property
public func webkitTransitionProperty(_ properties: CSS.SingleTransitionProperty...)
  -> CSS.Property
{
  var results = ""
  for (index, p) in properties.enumerated() {
    results = "\(results)\(p.value)"
    if index < properties.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("-webkit-transition-property", results)
}

public func mozTransitionProperty(_ properties: CSS.SingleTransitionProperty...) -> CSS.Property {
  var results = ""
  for (index, p) in properties.enumerated() {
    results = "\(results)\(p.value)"
    if index < properties.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("-moz-transition-property", results)
}

public func msTransitionProperty(_ properties: CSS.SingleTransitionProperty...) -> CSS.Property {
  var results = ""
  for (index, p) in properties.enumerated() {
    results = "\(results)\(p.value)"
    if index < properties.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("-ms-transition-property", results)
}

public func oTransitionProperty(_ properties: CSS.SingleTransitionProperty...) -> CSS.Property {
  var results = ""
  for (index, p) in properties.enumerated() {
    results = "\(results)\(p.value)"
    if index < properties.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("-o-transition-property", results)
}

// MARK: - Transition Timing Function
public func webkitTransitionTimingFunction(_ functions: CSS.EasingFunction...) -> CSS.Property {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("-webkit-transition-timing-function", results)
}

public func mozTransitionTimingFunction(_ functions: CSS.EasingFunction...) -> CSS.Property {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("-moz-transition-timing-function", results)
}

public func msTransitionTimingFunction(_ functions: CSS.EasingFunction...) -> CSS.Property {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("-ms-transition-timing-function", results)
}

public func oTransitionTimingFunction(_ functions: CSS.EasingFunction...) -> CSS.Property {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("-o-transition-timing-function", results)
}

// MARK: - Animation
public func webkitAnimation(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-animation", value)
}

// Convenience overloads for webkit
public func webkitAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String,
  _ iterationCount: CSS.SingleAnimationIterationCount
) -> CSS.Property {
  CSS.Property(
    "-webkit-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)"
  )
}

public func webkitAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: CSS.Scroll
) -> CSS.Property {
  CSS.Property(
    "-webkit-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func webkitAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: CSS.View
) -> CSS.Property {
  CSS.Property(
    "-webkit-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func webkitAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: String
) -> CSS.Property {
  CSS.Property(
    "-webkit-animation",
    "\(duration.value) \(easingFunction.value) \(name) \(CSS.DashedIdent(timeline).value)")
}

public func mozAnimation(_ value: String) -> CSS.Property {
  CSS.Property("-moz-animation", value)
}

// Convenience overloads for moz
public func mozAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String,
  _ iterationCount: CSS.SingleAnimationIterationCount
) -> CSS.Property {
  CSS.Property(
    "-moz-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)")
}

public func mozAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: CSS.Scroll
) -> CSS.Property {
  CSS.Property(
    "-moz-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func mozAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: CSS.View
) -> CSS.Property {
  CSS.Property(
    "-moz-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func mozAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: String
) -> CSS.Property {
  CSS.Property(
    "-moz-animation",
    "\(duration.value) \(easingFunction.value) \(name) \(CSS.DashedIdent(timeline).value)")
}

public func msAnimation(_ value: String) -> CSS.Property {
  CSS.Property("-ms-animation", value)
}

// Convenience overloads for ms
public func msAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String,
  _ iterationCount: CSS.SingleAnimationIterationCount
) -> CSS.Property {
  CSS.Property(
    "-ms-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)")
}

public func msAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: CSS.Scroll
) -> CSS.Property {
  CSS.Property(
    "-ms-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func msAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: CSS.View
) -> CSS.Property {
  CSS.Property(
    "-ms-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func msAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: String
) -> CSS.Property {
  CSS.Property(
    "-ms-animation",
    "\(duration.value) \(easingFunction.value) \(name) \(CSS.DashedIdent(timeline).value)")
}

public func oAnimation(_ value: String) -> CSS.Property {
  CSS.Property("-o-animation", value)
}

// Convenience overloads for o
public func oAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String,
  _ iterationCount: CSS.SingleAnimationIterationCount
) -> CSS.Property {
  CSS.Property(
    "-o-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)")
}

public func oAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: CSS.Scroll
) -> CSS.Property {
  CSS.Property(
    "-o-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func oAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: CSS.View
) -> CSS.Property {
  CSS.Property(
    "-o-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func oAnimation(
  _ duration: CSS.Time, _ easingFunction: CSS.EasingFunction, _ name: String, _ timeline: String
) -> CSS.Property {
  CSS.Property(
    "-o-animation",
    "\(duration.value) \(easingFunction.value) \(name) \(CSS.DashedIdent(timeline).value)")
}

// MARK: - Animation Delay
public func webkitAnimationDelay(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-webkit-animation-delay", value.value)
}

public func webkitAnimationDelay(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-animation-delay", value)
}

public func mozAnimationDelay(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-moz-animation-delay", value.value)
}

public func mozAnimationDelay(_ value: String) -> CSS.Property {
  CSS.Property("-moz-animation-delay", value)
}

public func msAnimationDelay(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-ms-animation-delay", value.value)
}

public func msAnimationDelay(_ value: String) -> CSS.Property {
  CSS.Property("-ms-animation-delay", value)
}

public func oAnimationDelay(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-o-animation-delay", value.value)
}

public func oAnimationDelay(_ value: String) -> CSS.Property {
  CSS.Property("-o-animation-delay", value)
}

// MARK: - Animation Direction
public func webkitAnimationDirection(_ value: CSS.SingleAnimationDirection) -> CSS.Property {
  CSS.Property("-webkit-animation-direction", value.rawValue)
}

public func webkitAnimationDirection(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-animation-direction", value)
}

public func mozAnimationDirection(_ value: CSS.SingleAnimationDirection) -> CSS.Property {
  CSS.Property("-moz-animation-direction", value.rawValue)
}

public func mozAnimationDirection(_ value: String) -> CSS.Property {
  CSS.Property("-moz-animation-direction", value)
}

public func msAnimationDirection(_ value: CSS.SingleAnimationDirection) -> CSS.Property {
  CSS.Property("-ms-animation-direction", value.rawValue)
}

public func msAnimationDirection(_ value: String) -> CSS.Property {
  CSS.Property("-ms-animation-direction", value)
}

public func oAnimationDirection(_ value: CSS.SingleAnimationDirection) -> CSS.Property {
  CSS.Property("-o-animation-direction", value.rawValue)
}

public func oAnimationDirection(_ value: String) -> CSS.Property {
  CSS.Property("-o-animation-direction", value)
}

// MARK: - Animation Duration
public func webkitAnimationDuration(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-webkit-animation-duration", value.value)
}

public func webkitAnimationDuration(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-animation-duration", value)
}

public func mozAnimationDuration(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-moz-animation-duration", value.value)
}

public func mozAnimationDuration(_ value: String) -> CSS.Property {
  CSS.Property("-moz-animation-duration", value)
}

public func msAnimationDuration(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-ms-animation-duration", value.value)
}

public func msAnimationDuration(_ value: String) -> CSS.Property {
  CSS.Property("-ms-animation-duration", value)
}

public func oAnimationDuration(_ value: CSS.Time) -> CSS.Property {
  CSS.Property("-o-animation-duration", value.value)
}

public func oAnimationDuration(_ value: String) -> CSS.Property {
  CSS.Property("-o-animation-duration", value)
}

// MARK: - Animation Fill Mode
public func webkitAnimationFillMode(_ value: CSS.SingleAnimationFillMode) -> CSS.Property {
  CSS.Property("-webkit-animation-fill-mode", value.rawValue)
}

public func mozAnimationFillMode(_ value: CSS.SingleAnimationFillMode) -> CSS.Property {
  CSS.Property("-moz-animation-fill-mode", value.rawValue)
}

public func msAnimationFillMode(_ value: CSS.SingleAnimationFillMode) -> CSS.Property {
  CSS.Property("-ms-animation-fill-mode", value.rawValue)
}

public func oAnimationFillMode(_ value: CSS.SingleAnimationFillMode) -> CSS.Property {
  CSS.Property("-o-animation-fill-mode", value.rawValue)
}

// MARK: - Animation Iteration Count
public func webkitAnimationIterationCount(_ value: CSS.SingleAnimationIterationCount)
  -> CSS.Property
{
  CSS.Property("-webkit-animation-iteration-count", value.value)
}

public func webkitAnimationIterationCount(_ value: CSS.Keyword.Infinite) -> CSS.Property {
  CSS.Property("-webkit-animation-iteration-count", value.rawValue)
}

public func mozAnimationIterationCount(_ value: CSS.SingleAnimationIterationCount) -> CSS.Property
{
  CSS.Property("-moz-animation-iteration-count", value.value)
}

public func mozAnimationIterationCount(_ value: CSS.Keyword.Infinite) -> CSS.Property {
  CSS.Property("-moz-animation-iteration-count", value.rawValue)
}

public func msAnimationIterationCount(_ value: CSS.SingleAnimationIterationCount) -> CSS.Property
{
  CSS.Property("-ms-animation-iteration-count", value.value)
}

public func msAnimationIterationCount(_ value: CSS.Keyword.Infinite) -> CSS.Property {
  CSS.Property("-ms-animation-iteration-count", value.rawValue)
}

public func oAnimationIterationCount(_ value: CSS.SingleAnimationIterationCount) -> CSS.Property {
  CSS.Property("-o-animation-iteration-count", value.value)
}

public func oAnimationIterationCount(_ value: CSS.Keyword.Infinite) -> CSS.Property {
  CSS.Property("-o-animation-iteration-count", value.rawValue)
}

// MARK: - Animation Name
public func webkitAnimationName(_ value: CSS.KeyframesName) -> CSS.Property {
  CSS.Property("-webkit-animation-name", value.value)
}

public func webkitAnimationName(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-webkit-animation-name", value.rawValue)
}

public func mozAnimationName(_ value: CSS.KeyframesName) -> CSS.Property {
  CSS.Property("-moz-animation-name", value.value)
}

public func mozAnimationName(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-moz-animation-name", value.rawValue)
}

public func msAnimationName(_ value: CSS.KeyframesName) -> CSS.Property {
  CSS.Property("-ms-animation-name", value.value)
}

public func msAnimationName(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-ms-animation-name", value.rawValue)
}

public func oAnimationName(_ value: CSS.KeyframesName) -> CSS.Property {
  CSS.Property("-o-animation-name", value.value)
}

public func oAnimationName(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-o-animation-name", value.rawValue)
}

// MARK: - Animation Play State
public func webkitAnimationPlayState(_ value: CSS.SingleAnimationPlayState) -> CSS.Property {
  CSS.Property("-webkit-animation-play-state", value.rawValue)
}

public func mozAnimationPlayState(_ value: CSS.SingleAnimationPlayState) -> CSS.Property {
  CSS.Property("-moz-animation-play-state", value.rawValue)
}

public func msAnimationPlayState(_ value: CSS.SingleAnimationPlayState) -> CSS.Property {
  CSS.Property("-ms-animation-play-state", value.rawValue)
}

public func oAnimationPlayState(_ value: CSS.SingleAnimationPlayState) -> CSS.Property {
  CSS.Property("-o-animation-play-state", value.rawValue)
}

// MARK: - Animation Timing Function
public func webkitAnimationTimingFunction(_ value: CSS.EasingFunction) -> CSS.Property {
  CSS.Property("-webkit-animation-timing-function", value.value)
}

public func mozAnimationTimingFunction(_ value: CSS.EasingFunction) -> CSS.Property {
  CSS.Property("-moz-animation-timing-function", value.value)
}

public func msAnimationTimingFunction(_ value: CSS.EasingFunction) -> CSS.Property {
  CSS.Property("-ms-animation-timing-function", value.value)
}

public func oAnimationTimingFunction(_ value: CSS.EasingFunction) -> CSS.Property {
  CSS.Property("-o-animation-timing-function", value.value)
}

// MARK: - Backface Visibility
public func webkitBackfaceVisibility(_ value: CSS.BackfaceVisibility) -> CSS.Property {
  CSS.Property("-webkit-backface-visibility", value.rawValue)
}

public func webkitBackfaceVisibility(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-backface-visibility", value)
}

public func mozBackfaceVisibility(_ value: CSS.BackfaceVisibility) -> CSS.Property {
  CSS.Property("-moz-backface-visibility", value.rawValue)
}

public func mozBackfaceVisibility(_ value: String) -> CSS.Property {
  CSS.Property("-moz-backface-visibility", value)
}

public func msBackfaceVisibility(_ value: CSS.BackfaceVisibility) -> CSS.Property {
  CSS.Property("-ms-backface-visibility", value.rawValue)
}

public func msBackfaceVisibility(_ value: String) -> CSS.Property {
  CSS.Property("-ms-backface-visibility", value)
}

public func oBackfaceVisibility(_ value: CSS.BackfaceVisibility) -> CSS.Property {
  CSS.Property("-o-backface-visibility", value.rawValue)
}

public func oBackfaceVisibility(_ value: String) -> CSS.Property {
  CSS.Property("-o-backface-visibility", value)
}

// MARK: - Perspective

@_disfavoredOverload
public func perspective(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("perspective", value.value)
}

@_disfavoredOverload
public func perspective(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("perspective", value.value)
}

public func webkitPerspective(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-webkit-perspective", value.value)
}

public func webkitPerspective(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-webkit-perspective", value.value)
}

public func webkitPerspective(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-webkit-perspective", value.value)
}

public func mozPerspective(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-moz-perspective", value.value)
}

public func mozPerspective(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-moz-perspective", value.value)
}

public func mozPerspective(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-moz-perspective", value.value)
}

public func msPerspective(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-ms-perspective", value.value)
}

public func msPerspective(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-ms-perspective", value.value)
}

public func msPerspective(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-ms-perspective", value.value)
}

public func oPerspective(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-o-perspective", value.value)
}

public func oPerspective(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-o-perspective", value.value)
}

public func oPerspective(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-o-perspective", value.value)
}

public func oPerspective(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-o-perspective", value.rawValue)
}

// MARK: - Perspective Origin
public func webkitPerspectiveOrigin(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-webkit-perspective-origin", value.value)
}

public func webkitPerspectiveOrigin(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-webkit-perspective-origin", value.value)
}

public func webkitPerspectiveOrigin(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-webkit-perspective-origin", value.value)
}

public func mozPerspectiveOrigin(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-moz-perspective-origin", value.value)
}

public func mozPerspectiveOrigin(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-moz-perspective-origin", value.value)
}

public func mozPerspectiveOrigin(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-moz-perspective-origin", value.value)
}

public func msPerspectiveOrigin(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-ms-perspective-origin", value.value)
}

public func msPerspectiveOrigin(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-ms-perspective-origin", value.value)
}

public func msPerspectiveOrigin(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-ms-perspective-origin", value.value)
}

public func oPerspectiveOrigin(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-o-perspective-origin", value.value)
}

public func oPerspectiveOrigin(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-o-perspective-origin", value.value)
}

public func oPerspectiveOrigin(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-o-perspective-origin", value.value)
}

// MARK: - Border Radius
public func webkitBorderRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-webkit-border-radius", value.value)
}

public func webkitBorderRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-webkit-border-radius", value.value)
}

public func webkitBorderRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-webkit-border-radius", value.value)
}

public func mozBorderRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-moz-border-radius", value.value)
}

public func mozBorderRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-moz-border-radius", value.value)
}

public func mozBorderRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-moz-border-radius", value.value)
}

public func webkitBorderTopLeftRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-webkit-border-top-left-radius", value.value)
}

public func webkitBorderTopLeftRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-webkit-border-top-left-radius", value.value)
}

public func webkitBorderTopLeftRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-webkit-border-top-left-radius", value.value)
}

public func mozBorderTopLeftRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-moz-border-top-left-radius", value.value)
}

public func mozBorderTopLeftRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-moz-border-top-left-radius", value.value)
}

public func mozBorderTopLeftRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-moz-border-top-left-radius", value.value)
}

public func webkitBorderTopRightRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-webkit-border-top-right-radius", value.value)
}

public func webkitBorderTopRightRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-webkit-border-top-right-radius", value.value)
}

public func webkitBorderTopRightRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-webkit-border-top-right-radius", value.value)
}

public func mozBorderTopRightRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-moz-border-top-right-radius", value.value)
}

public func mozBorderTopRightRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-moz-border-top-right-radius", value.value)
}

public func mozBorderTopRightRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-moz-border-top-right-radius", value.value)
}

public func webkitBorderBottomLeftRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-webkit-border-bottom-left-radius", value.value)
}

public func webkitBorderBottomLeftRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-webkit-border-bottom-left-radius", value.value)
}

public func webkitBorderBottomLeftRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-webkit-border-bottom-left-radius", value.value)
}

public func mozBorderBottomLeftRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-moz-border-bottom-left-radius", value.value)
}

public func mozBorderBottomLeftRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-moz-border-bottom-left-radius", value.value)
}

public func mozBorderBottomLeftRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-moz-border-bottom-left-radius", value.value)
}

public func webkitBorderBottomRightRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-webkit-border-bottom-right-radius", value.value)
}

public func webkitBorderBottomRightRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-webkit-border-bottom-right-radius", value.value)
}

public func webkitBorderBottomRightRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-webkit-border-bottom-right-radius", value.value)
}

public func mozBorderBottomRightRadius(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-moz-border-bottom-right-radius", value.value)
}

public func mozBorderBottomRightRadius(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-moz-border-bottom-right-radius", value.value)
}

public func mozBorderBottomRightRadius(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-moz-border-bottom-right-radius", value.value)
}

public func mozBorderBottomRightRadius(_ value: String) -> CSS.Property {
  CSS.Property("-moz-border-bottom-right-radius", value)
}

// MARK: - Box Shadow
public func webkitBoxShadow(_ shadows: CSS.SpreadShadow...) -> CSS.Property {
  var results = ""
  for (index, s) in shadows.enumerated() {
    results = "\(results)\(s.value)"
    if index < shadows.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("-webkit-box-shadow", results)
}

public func webkitBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length,
  _ spread: CSS.Length, _ position: CSS.SpreadShadow.BoxShadowPosition
) -> CSS.Property {
  webkitBoxShadow(
    CSS.SpreadShadow(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSS.SpreadShadow.BoxShadowBlur(blur),
      spread: CSS.SpreadShadow.BoxShadowSpread(spread),
      position: position
    ))
}

public func webkitBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length,
  _ spread: CSS.Length
) -> CSS.Property {
  CSS.Property(
    "-webkit-box-shadow",
    "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value) \(spread.value)")
}

public func webkitBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ oX: CSS.LengthPercentage, _ oY: CSS.LengthPercentage,
  _ b: CSS.LengthPercentage, _ s: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property(
    "-webkit-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value) \(s.value)")
}

public func webkitBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length
) -> CSS.Property {
  CSS.Property(
    "-webkit-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value)")
}

public func webkitBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ oX: CSS.LengthPercentage, _ oY: CSS.LengthPercentage,
  _ b: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-webkit-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value)")
}

public func webkitBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length
) -> CSS.Property {
  CSS.Property("-webkit-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value)")
}

public func webkitBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ oX: CSS.LengthPercentage, _ oY: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-webkit-box-shadow", "\(color.value) \(oX.value) \(oY.value)")
}

public func webkitBoxShadow(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-box-shadow", value)
}

public func webkitBoxShadow(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-webkit-box-shadow", value.rawValue)
}

public func mozBoxShadow(_ shadows: CSS.SpreadShadow...) -> CSS.Property {
  var results = ""
  for (index, s) in shadows.enumerated() {
    results = "\(results)\(s.value)"
    if index < shadows.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("-moz-box-shadow", results)
}

public func mozBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length,
  _ spread: CSS.Length, _ position: CSS.SpreadShadow.BoxShadowPosition
) -> CSS.Property {
  mozBoxShadow(
    CSS.SpreadShadow(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSS.SpreadShadow.BoxShadowBlur(blur),
      spread: CSS.SpreadShadow.BoxShadowSpread(spread),
      position: position
    ))
}

public func mozBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length,
  _ spread: CSS.Length
) -> CSS.Property {
  CSS.Property(
    "-moz-box-shadow",
    "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value) \(spread.value)")
}

public func mozBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ oX: CSS.LengthPercentage, _ oY: CSS.LengthPercentage,
  _ b: CSS.LengthPercentage, _ s: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-moz-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value) \(s.value)")
}

public func mozBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length
) -> CSS.Property {
  CSS.Property(
    "-moz-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value)")
}

public func mozBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ oX: CSS.LengthPercentage, _ oY: CSS.LengthPercentage,
  _ b: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-moz-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value)")
}

public func mozBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length
) -> CSS.Property {
  CSS.Property("-moz-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value)")
}

public func mozBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ oX: CSS.LengthPercentage, _ oY: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-moz-box-shadow", "\(color.value) \(oX.value) \(oY.value)")
}

public func mozBoxShadow(_ value: String) -> CSS.Property {
  CSS.Property("-moz-box-shadow", value)
}

public func mozBoxShadow(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-moz-box-shadow", value.rawValue)
}

public func msBoxShadow(_ shadows: CSS.SpreadShadow...) -> CSS.Property {
  var results = ""
  for (index, s) in shadows.enumerated() {
    results = "\(results)\(s.value)"
    if index < shadows.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("-ms-box-shadow", results)
}

public func msBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length,
  _ spread: CSS.Length, _ position: CSS.SpreadShadow.BoxShadowPosition
) -> CSS.Property {
  msBoxShadow(
    CSS.SpreadShadow(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY,
      blur: CSS.SpreadShadow.BoxShadowBlur(blur),
      spread: CSS.SpreadShadow.BoxShadowSpread(spread),
      position: position
    ))
}

public func msBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length,
  _ spread: CSS.Length
) -> CSS.Property {
  CSS.Property(
    "-ms-box-shadow",
    "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value) \(spread.value)")
}

public func msBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ oX: CSS.LengthPercentage, _ oY: CSS.LengthPercentage,
  _ b: CSS.LengthPercentage, _ s: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-ms-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value) \(s.value)")
}

public func msBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blur: CSS.Length
) -> CSS.Property {
  CSS.Property(
    "-ms-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value)")
}

public func msBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ oX: CSS.LengthPercentage, _ oY: CSS.LengthPercentage,
  _ b: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-ms-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value)")
}

public func msBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ offsetX: CSS.Length, _ offsetY: CSS.Length
) -> CSS.Property {
  CSS.Property("-ms-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value)")
}

public func msBoxShadow(
  _ color: CSS.SpreadShadow.BoxShadowColor, _ oX: CSS.LengthPercentage, _ oY: CSS.LengthPercentage
) -> CSS.Property {
  CSS.Property("-ms-box-shadow", "\(color.value) \(oX.value) \(oY.value)")
}

public func msBoxShadow(_ value: String) -> CSS.Property {
  CSS.Property("-ms-box-shadow", value)
}

public func msBoxShadow(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-ms-box-shadow", value.rawValue)
}

// MARK: - Filter
// filter = none | <filter-value-list>
public func filter(_ functions: CSS.FilterFunction...) -> CSS.Property {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results) "
    }
  }
  return CSS.Property("filter", results)
}

public func filter(_ value: String) -> CSS.Property {
  CSS.Property("filter", value)
}

public func filter(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("filter", value.rawValue)
}

public func webkitFilter(_ functions: CSS.FilterFunction...) -> CSS.Property {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results) "
    }
  }
  return CSS.Property("-webkit-filter", results)
}

public func webkitFilter(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-filter", value)
}

public func msFilter(_ functions: CSS.FilterFunction...) -> CSS.Property {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results) "
    }
  }
  return CSS.Property("-ms-filter", results)
}

public func msFilter(_ value: String) -> CSS.Property {
  CSS.Property("-ms-filter", value)
}

// MARK: - Backdrop Filter
public func backdropFilter(_ functions: CSS.FilterFunction...) -> CSS.Property {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results) "
    }
  }
  return CSS.Property("backdrop-filter", results)
}

public func backdropFilter(_ value: String) -> CSS.Property {
  CSS.Property("backdrop-filter", value)
}

public func backdropFilter(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("backdrop-filter", value.rawValue)
}

public func webkitBackdropFilter(_ functions: CSS.FilterFunction...) -> CSS.Property {
  var results = ""
  for (index, f) in functions.enumerated() {
    results = "\(results)\(f.value)"
    if index < functions.count - 1 {
      results = "\(results) "
    }
  }
  return CSS.Property("-webkit-backdrop-filter", results)
}

public func webkitBackdropFilter(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-backdrop-filter", value)
}

// MARK: - Mask
// mask = <mask-layer>#
public func mask(_ layers: CSS.MaskLayer...) -> CSS.Property {
  var results = ""
  for (index, l) in layers.enumerated() {
    results = "\(results)\(l.value)"
    if index < layers.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("mask", results)
}

public func mask(_ value: String) -> CSS.Property {
  CSS.Property("mask", value)
}

public func mask(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("mask", value.rawValue)
}

public func webkitMask(_ layers: CSS.MaskLayer...) -> CSS.Property {
  var results = ""
  for (index, l) in layers.enumerated() {
    results = "\(results)\(l.value)"
    if index < layers.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("-webkit-mask", results)
}

// Convenience: webkitMask(url, position, size, repeat) - all double
public func webkitMask(
  _ reference: CSS.MaskLayer.MaskReference,
  _ position: (
    CSS.MaskLayer.Position.PositionOne.PositionKeyword,
    CSS.MaskLayer.Position.PositionOne.PositionKeyword
  ),
  _ size: (CSS.Length, CSS.Length),
  _ repeatStyle: (CSS.MaskLayer.RepeatStyle.Repetition, CSS.MaskLayer.RepeatStyle.Repetition)
) -> CSS.Property {
  let pos1 = CSS.MaskLayer.Position.PositionOne.keyword(position.0)
  let pos2 = CSS.MaskLayer.Position.PositionOne.keyword(position.1)
  let posTwo = CSS.MaskLayer.Position.PositionTwo(pos1, pos2)
  return webkitMask(
    CSS.MaskLayer(
      reference: reference,
      position: .two(posTwo),
      size: .twoLengths(size.0, size.1),
      repeatStyle: .repetition(repeatStyle.0, repeatStyle.1)
    ))
}

// Convenience: webkitMask(url, position, size, repeat) - single repeat
public func webkitMask(
  _ reference: CSS.MaskLayer.MaskReference,
  _ position: (
    CSS.MaskLayer.Position.PositionOne.PositionKeyword,
    CSS.MaskLayer.Position.PositionOne.PositionKeyword
  ),
  _ size: (CSS.Length, CSS.Length),
  _ repeatStyle: CSS.MaskLayer.RepeatStyle.Repetition
) -> CSS.Property {
  let pos1 = CSS.MaskLayer.Position.PositionOne.keyword(position.0)
  let pos2 = CSS.MaskLayer.Position.PositionOne.keyword(position.1)
  let posTwo = CSS.MaskLayer.Position.PositionTwo(pos1, pos2)
  return webkitMask(
    CSS.MaskLayer(
      reference: reference,
      position: .two(posTwo),
      size: .twoLengths(size.0, size.1),
      repeatStyle: .repetition(repeatStyle, nil)
    ))
}

public func webkitMask(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-mask", value)
}

public func webkitMask(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-webkit-mask", value.rawValue)
}

// MARK: - Font Smoothing
public func webkitFontSmoothing(_ value: CSS.FontSmoothing) -> CSS.Property {
  CSS.Property("-webkit-font-smoothing", value.rawValue)
}

public func webkitFontSmoothing(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-webkit-font-smoothing", value.rawValue)
}

public func webkitFontSmoothing(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-font-smoothing", value)
}

public func mozOsxFontSmoothing(_ value: CSS.FontSmoothing) -> CSS.Property {
  CSS.Property("-moz-osx-font-smoothing", value.rawValue)
}

public func mozOsxFontSmoothing(_ value: String) -> CSS.Property {
  CSS.Property("-moz-osx-font-smoothing", value)
}

// MARK: - Text Size Adjust
public func webkitTextSizeAdjust(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-webkit-text-size-adjust", value.rawValue)
}

public func webkitTextSizeAdjust(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("-webkit-text-size-adjust", value.rawValue)
}

public func webkitTextSizeAdjust(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-text-size-adjust", value)
}

// MARK: - Tap Highlight Color
public func webkitTapHighlightColor(_ color: CSS.Color) -> CSS.Property {
  CSS.Property("-webkit-tap-highlight-color", color.value)
}

public func webkitTapHighlightColor(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-tap-highlight-color", value)
}

// MARK: - Touch Callout
public func webkitTouchCallout(_ value: CSS.TouchCallout) -> CSS.Property {
  CSS.Property("-webkit-touch-callout", value.rawValue)
}

public func webkitTouchCallout(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-webkit-touch-callout", value.rawValue)
}

public func webkitTouchCallout(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-touch-callout", value)
}

// MARK: - Mask Image
// mask-image = <mask-reference>#
public func maskImage(_ references: CSS.MaskLayer.MaskReference...) -> CSS.Property {
  var results = ""
  for (index, r) in references.enumerated() {
    results = "\(results)\(r.value)"
    if index < references.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("mask-image", results)
}

public func maskImage(_ value: String) -> CSS.Property {
  CSS.Property("mask-image", value)
}

public func webkitMaskImage(_ references: CSS.MaskLayer.MaskReference...) -> CSS.Property {
  var results = ""
  for (index, r) in references.enumerated() {
    results = "\(results)\(r.value)"
    if index < references.count - 1 {
      results = "\(results), "
    }
  }
  return CSS.Property("-webkit-mask-image", results)
}

public func webkitMaskImage(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-mask-image", value)
}

public func webkitMaskSize(_ value: CSS.MaskSize) -> CSS.Property {
  CSS.Property("-webkit-mask-size", value.rawValue)
}

public func webkitMaskSize(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-mask-size", value)
}

public func webkitMaskRepeat(_ value: CSS.MaskRepeat) -> CSS.Property {
  CSS.Property("-webkit-mask-repeat", value.rawValue)
}

public func webkitMaskRepeat(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-mask-repeat", value)
}

public func webkitMaskPosition(_ value: CSS.ObjectPosition) -> CSS.Property {
  CSS.Property("-webkit-mask-position", value.rawValue)
}

public func webkitMaskPosition(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-mask-position", value)
}

// MARK: - Clip Path
// clip-path = <clip-source> | [ <basic-shape> || <geometry-box> ] | none
public func clipPath(_ value: CSS.ClipPath) -> CSS.Property {
  CSS.Property("clip-path", value.value)
}

public func clipPath(_ shape: CSS.BasicShape) -> CSS.Property {
  CSS.Property("clip-path", shape.value)
}

public func clipPath(_ shape: CSS.BasicShape, _ box: CSS.GeometryBox) -> CSS.Property {
  CSS.Property("clip-path", "\(shape.value) \(box.rawValue)")
}

public func clipPath(_ box: CSS.GeometryBox) -> CSS.Property {
  CSS.Property("clip-path", box.rawValue)
}

public func clipPath(_ source: CSS.ClipSource) -> CSS.Property {
  CSS.Property("clip-path", source.value)
}

public func clipPath(_ value: String) -> CSS.Property {
  CSS.Property("clip-path", value)
}

public func clipPath(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("clip-path", value.rawValue)
}

public func webkitClipPath(_ value: CSS.ClipPath) -> CSS.Property {
  CSS.Property("-webkit-clip-path", value.value)
}

public func webkitClipPath(_ shape: CSS.BasicShape) -> CSS.Property {
  CSS.Property("-webkit-clip-path", shape.value)
}

public func webkitClipPath(_ shape: CSS.BasicShape, _ box: CSS.GeometryBox) -> CSS.Property {
  CSS.Property("-webkit-clip-path", "\(shape.value) \(box.rawValue)")
}

public func webkitClipPath(_ box: CSS.GeometryBox) -> CSS.Property {
  CSS.Property("-webkit-clip-path", box.rawValue)
}

public func webkitClipPath(_ source: CSS.ClipSource) -> CSS.Property {
  CSS.Property("-webkit-clip-path", source.value)
}

public func webkitClipPath(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-clip-path", value)
}

public func webkitClipPath(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("-webkit-clip-path", value.rawValue)
}

// MARK: - Line Clamp
public func webkitLineClamp(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-line-clamp", value)
}

public func webkitLineClamp(_ value: Int) -> CSS.Property {
  CSS.Property("-webkit-line-clamp", "\(value)")
}

// MARK: - Box Reflect
public func webkitBoxReflect(_ value: CSS.BoxReflect) -> CSS.Property {
  CSS.Property("-webkit-box-reflect", value.rawValue)
}

public func webkitBoxReflect(_ value: String) -> CSS.Property {
  CSS.Property("-webkit-box-reflect", value)
}

// MARK: - Flexbox (MS-specific)
public func msFlexDirection(_ value: CSS.FlexDirection) -> CSS.Property {
  CSS.Property("-ms-flex-direction", value.rawValue)
}

public func msFlexDirection(_ value: String) -> CSS.Property {
  CSS.Property("-ms-flex-direction", value)
}

public func msFlexWrap(_ value: CSS.FlexWrap) -> CSS.Property {
  CSS.Property("-ms-flex-wrap", value.rawValue)
}

public func msFlexWrap(_ value: String) -> CSS.Property {
  CSS.Property("-ms-flex-wrap", value)
}

public func msFlexFlow(_ value: CSS.FlexFlow) -> CSS.Property {
  CSS.Property("-ms-flex-flow", value.rawValue)
}

public func msFlexFlow(_ value: String) -> CSS.Property {
  CSS.Property("-ms-flex-flow", value)
}

public func msFlex(_ value: String) -> CSS.Property {
  CSS.Property("-ms-flex", value)
}

public func msFlex(_ value: Int) -> CSS.Property {
  CSS.Property("-ms-flex", "\(value)")
}

public func msFlexGrow(_ value: String) -> CSS.Property {
  CSS.Property("-ms-flex-grow", value)
}

public func msFlexGrow(_ value: Int) -> CSS.Property {
  CSS.Property("-ms-flex-grow", "\(value)")
}

public func msFlexGrow(_ value: Double) -> CSS.Property {
  CSS.Property("-ms-flex-grow", "\(value)")
}

public func msFlexShrink(_ value: String) -> CSS.Property {
  CSS.Property("-ms-flex-shrink", value)
}

public func msFlexShrink(_ value: Int) -> CSS.Property {
  CSS.Property("-ms-flex-shrink", "\(value)")
}

public func msFlexShrink(_ value: Double) -> CSS.Property {
  CSS.Property("-ms-flex-shrink", "\(value)")
}

public func msFlexBasis(_ value: String) -> CSS.Property {
  CSS.Property("-ms-flex-basis", value)
}

public func msFlexBasis(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("-ms-flex-basis", value.value)
}

public func msFlexBasis(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("-ms-flex-basis", value.value)
}

public func msFlexBasis(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("-ms-flex-basis", value.value)
}

public func msJustifyContent(_ value: CSS.JustifyContent) -> CSS.Property {
  CSS.Property("-ms-justify-content", value.rawValue)
}

public func msJustifyContent(_ value: String) -> CSS.Property {
  CSS.Property("-ms-justify-content", value)
}

public func msAlignItems(_ value: CSS.AlignItems) -> CSS.Property {
  CSS.Property("-ms-align-items", value.rawValue)
}

public func msAlignItems(_ value: String) -> CSS.Property {
  CSS.Property("-ms-align-items", value)
}

public func msAlignSelf(_ value: CSS.AlignSelf) -> CSS.Property {
  CSS.Property("-ms-align-self", value.rawValue)
}

public func msAlignSelf(_ value: String) -> CSS.Property {
  CSS.Property("-ms-align-self", value)
}

public func msAlignContent(_ value: CSS.AlignContent) -> CSS.Property {
  CSS.Property("-ms-align-content", value.rawValue)
}

public func msAlignContent(_ value: String) -> CSS.Property {
  CSS.Property("-ms-align-content", value)
}

public func msOrder(_ value: Int) -> CSS.Property {
  CSS.Property("-ms-order", "\(value)")
}

public func msOrder(_ value: String) -> CSS.Property {
  CSS.Property("-ms-order", value)
}

// MARK: - Writing Mode

public func writingMode(_ value: CSS.WritingMode) -> CSS.Property {
  CSS.Property("writing-mode", value.rawValue)
}

public func textOrientation(_ value: CSS.TextOrientation) -> CSS.Property {
  CSS.Property("text-orientation", value.rawValue)
}

// MARK: - Logical Margin Properties

public func marginBlockStart(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("margin-block-start", value.rawValue)
}

public func marginBlockStart(_ value: Int) -> CSS.Property {
  CSS.Property("margin-block-start", intToString(value))
}

public func marginBlockStart(_ value: Double) -> CSS.Property {
  CSS.Property("margin-block-start", doubleToString(value))
}

public func marginBlockStart(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("margin-block-start", value.value)
}

public func marginBlockStart(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("margin-block-start", value.value)
}

public func marginBlockStart(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("margin-block-start", value.value)
}

public func marginBlockEnd(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("margin-block-end", value.rawValue)
}

public func marginBlockEnd(_ value: Int) -> CSS.Property {
  CSS.Property("margin-block-end", intToString(value))
}

public func marginBlockEnd(_ value: Double) -> CSS.Property {
  CSS.Property("margin-block-end", doubleToString(value))
}

public func marginBlockEnd(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("margin-block-end", value.value)
}

public func marginBlockEnd(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("margin-block-end", value.value)
}

public func marginBlockEnd(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("margin-block-end", value.value)
}

public func marginInlineStart(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("margin-inline-start", value.rawValue)
}

public func marginInlineStart(_ value: Int) -> CSS.Property {
  CSS.Property("margin-inline-start", intToString(value))
}

public func marginInlineStart(_ value: Double) -> CSS.Property {
  CSS.Property("margin-inline-start", doubleToString(value))
}

public func marginInlineStart(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("margin-inline-start", value.value)
}

public func marginInlineStart(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("margin-inline-start", value.value)
}

public func marginInlineStart(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("margin-inline-start", value.value)
}

public func marginInlineEnd(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("margin-inline-end", value.rawValue)
}

public func marginInlineEnd(_ value: Int) -> CSS.Property {
  CSS.Property("margin-inline-end", intToString(value))
}

public func marginInlineEnd(_ value: Double) -> CSS.Property {
  CSS.Property("margin-inline-end", doubleToString(value))
}

public func marginInlineEnd(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("margin-inline-end", value.value)
}

public func marginInlineEnd(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("margin-inline-end", value.value)
}

public func marginInlineEnd(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("margin-inline-end", value.value)
}

public func marginBlock(_ value: Int) -> CSS.Property {
  CSS.Property("margin-block", intToString(value))
}

public func marginBlock(_ value: Double) -> CSS.Property {
  CSS.Property("margin-block", doubleToString(value))
}

public func marginBlock(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("margin-block", value.value)
}

public func marginBlock(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("margin-block", value.value)
}

public func marginBlock(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("margin-block", value.value)
}

public func marginBlock(_ start: CSS.Length, _ end: CSS.Length) -> CSS.Property {
  CSS.Property("margin-block", "\(start.value) \(end.value)")
}

public func marginBlock(_ start: CSS.Percentage, _ end: CSS.Percentage) -> CSS.Property {
  CSS.Property("margin-block", "\(start.value) \(end.value)")
}

public func marginBlock(_ start: CSS.LengthPercentage, _ end: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("margin-block", "\(start.value) \(end.value)")
}

public func marginInline(_ value: Int) -> CSS.Property {
  CSS.Property("margin-inline", intToString(value))
}

public func marginInline(_ value: Double) -> CSS.Property {
  CSS.Property("margin-inline", doubleToString(value))
}

public func marginInline(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("margin-inline", value.value)
}

public func marginInline(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("margin-inline", value.value)
}

public func marginInline(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("margin-inline", value.value)
}

public func marginInline(_ start: CSS.Length, _ end: CSS.Length) -> CSS.Property {
  CSS.Property("margin-inline", "\(start.value) \(end.value)")
}

public func marginInline(_ start: CSS.Percentage, _ end: CSS.Percentage) -> CSS.Property {
  CSS.Property("margin-inline", "\(start.value) \(end.value)")
}

public func marginInline(_ start: CSS.LengthPercentage, _ end: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("margin-inline", "\(start.value) \(end.value)")
}

public func marginInline(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("margin-inline", value.rawValue)
}

// MARK: - Logical Padding Properties
public func paddingBlockStart(_ value: Int) -> CSS.Property {
  CSS.Property("padding-block-start", intToString(value))
}

public func paddingBlockStart(_ value: Double) -> CSS.Property {
  CSS.Property("padding-block-start", doubleToString(value))
}

public func paddingBlockStart(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("padding-block-start", value.value)
}

public func paddingBlockStart(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("padding-block-start", value.value)
}

public func paddingBlockStart(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding-block-start", value.value)
}

public func paddingBlockEnd(_ value: Int) -> CSS.Property {
  CSS.Property("padding-block-end", intToString(value))
}

public func paddingBlockEnd(_ value: Double) -> CSS.Property {
  CSS.Property("padding-block-end", doubleToString(value))
}

public func paddingBlockEnd(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("padding-block-end", value.value)
}

public func paddingBlockEnd(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("padding-block-end", value.value)
}

public func paddingBlockEnd(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding-block-end", value.value)
}

public func paddingInlineStart(_ value: Int) -> CSS.Property {
  CSS.Property("padding-inline-start", intToString(value))
}

public func paddingInlineStart(_ value: Double) -> CSS.Property {
  CSS.Property("padding-inline-start", doubleToString(value))
}

public func paddingInlineStart(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("padding-inline-start", value.value)
}

public func paddingInlineStart(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("padding-inline-start", value.value)
}

public func paddingInlineStart(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding-inline-start", value.value)
}

public func paddingInlineEnd(_ value: Int) -> CSS.Property {
  CSS.Property("padding-inline-end", intToString(value))
}

public func paddingInlineEnd(_ value: Double) -> CSS.Property {
  CSS.Property("padding-inline-end", doubleToString(value))
}

public func paddingInlineEnd(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("padding-inline-end", value.value)
}

public func paddingInlineEnd(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("padding-inline-end", value.value)
}

public func paddingInlineEnd(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding-inline-end", value.value)
}

public func paddingBlock(_ value: Int) -> CSS.Property {
  CSS.Property("padding-block", intToString(value))
}

public func paddingBlock(_ value: Double) -> CSS.Property {
  CSS.Property("padding-block", doubleToString(value))
}

public func paddingBlock(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("padding-block", value.value)
}

public func paddingBlock(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("padding-block", value.value)
}

public func paddingBlock(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding-block", value.value)
}

public func paddingBlock(_ start: CSS.Length, _ end: CSS.Length) -> CSS.Property {
  CSS.Property("padding-block", "\(start.value) \(end.value)")
}

public func paddingBlock(_ s: CSS.LengthPercentage, _ e: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding-block", "\(s.value) \(e.value)")
}

public func paddingInline(_ value: Int) -> CSS.Property {
  CSS.Property("padding-inline", intToString(value))
}

public func paddingInline(_ value: Double) -> CSS.Property {
  CSS.Property("padding-inline", doubleToString(value))
}

public func paddingInline(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("padding-inline", value.value)
}

public func paddingInline(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("padding-inline", value.value)
}

public func paddingInline(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding-inline", value.value)
}

public func paddingInline(_ start: CSS.Length, _ end: CSS.Length) -> CSS.Property {
  CSS.Property("padding-inline", "\(start.value) \(end.value)")
}

public func paddingInline(_ s: CSS.LengthPercentage, _ e: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("padding-inline", "\(s.value) \(e.value)")
}

// MARK: - Logical Border Properties
public func borderBlockStart(_ width: CSS.Length, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-block-start", "\(width.value) \(style.value) \(color.value)") }

public func borderBlockStart(_ width: CSS.Percentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-block-start", "\(width.value) \(style.value) \(color.value)") }

public func borderBlockStart(
  _ width: CSS.LengthPercentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color
) -> CSS.Property {
  CSS.Property("border-block-start", "\(width.value) \(style.value) \(color.value)")
}

public func borderBlockStart(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("border-block-start", value.rawValue)
}

public func borderBlockEnd(_ width: CSS.Length, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-block-end", "\(width.value) \(style.value) \(color.value)") }

public func borderBlockEnd(_ width: CSS.Percentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-block-end", "\(width.value) \(style.value) \(color.value)") }

public func borderBlockEnd(
  _ width: CSS.LengthPercentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color
) -> CSS.Property {
  CSS.Property("border-block-end", "\(width.value) \(style.value) \(color.value)")
}

public func borderBlockEnd(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("border-block-end", value.rawValue)
}

public func borderInlineStart(_ width: CSS.Length, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-inline-start", "\(width.value) \(style.value) \(color.value)") }

public func borderInlineStart(_ width: CSS.Percentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-inline-start", "\(width.value) \(style.value) \(color.value)") }

public func borderInlineStart(
  _ width: CSS.LengthPercentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color
) -> CSS.Property {
  CSS.Property("border-inline-start", "\(width.value) \(style.value) \(color.value)")
}

public func borderInlineStart(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("border-inline-start", value.rawValue)
}

public func borderInlineEnd(_ width: CSS.Length, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-inline-end", "\(width.value) \(style.value) \(color.value)") }

public func borderInlineEnd(_ width: CSS.Percentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color)
  -> CSS.Property
{ CSS.Property("border-inline-end", "\(width.value) \(style.value) \(color.value)") }

public func borderInlineEnd(
  _ width: CSS.LengthPercentage, _ style: CSS.Border.LineStyle, _ color: CSS.Color
) -> CSS.Property {
  CSS.Property("border-inline-end", "\(width.value) \(style.value) \(color.value)")
}

public func borderInlineEndWidth(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("border-inline-end-width", value.value)
}

public func borderInlineEndWidth(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("border-inline-end-width", value.value)
}

public func borderInlineEndWidth(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("border-inline-end-width", value.value)
}

public func borderInlineEnd(_ value: CSS.Keyword.None) -> CSS.Property {
  CSS.Property("border-inline-end", value.rawValue)
}

public func borderBlockStartColor(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("border-block-start-color", value.value)
}

public func borderBlockStartColor(_ value: String) -> CSS.Property {
  CSS.Property("border-block-start-color", value)
}

public func borderBlockEndColor(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("border-block-end-color", value.value)
}

public func borderBlockEndColor(_ value: String) -> CSS.Property {
  CSS.Property("border-block-end-color", value)
}

public func borderInlineStartColor(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("border-inline-start-color", value.value)
}

public func borderInlineStartColor(_ value: String) -> CSS.Property {
  CSS.Property("border-inline-start-color", value)
}

public func borderInlineEndColor(_ value: CSS.Color) -> CSS.Property {
  CSS.Property("border-inline-end-color", value.value)
}

public func borderInlineEndColor(_ value: String) -> CSS.Property {
  CSS.Property("border-inline-end-color", value)
}

// MARK: - Logical Inset Properties

public func insetBlockStart(_ value: Int) -> CSS.Property {
  CSS.Property("inset-block-start", intToString(value))
}

public func insetBlockStart(_ value: Double) -> CSS.Property {
  CSS.Property("inset-block-start", doubleToString(value))
}

public func insetBlockStart(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("inset-block-start", value.value)
}

public func insetBlockStart(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("inset-block-start", value.value)
}

public func insetBlockStart(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("inset-block-start", value.value)
}

public func insetBlockEnd(_ value: Int) -> CSS.Property {
  CSS.Property("inset-block-end", intToString(value))
}

public func insetBlockEnd(_ value: Double) -> CSS.Property {
  CSS.Property("inset-block-end", doubleToString(value))
}

public func insetBlockEnd(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("inset-block-end", value.value)
}

public func insetBlockEnd(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("inset-block-end", value.value)
}

public func insetBlockEnd(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("inset-block-end", value.value)
}

public func insetInlineStart(_ value: Int) -> CSS.Property {
  CSS.Property("inset-inline-start", intToString(value))
}

public func insetInlineStart(_ value: Double) -> CSS.Property {
  CSS.Property("inset-inline-start", doubleToString(value))
}

public func insetInlineStart(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("inset-inline-start", value.value)
}

public func insetInlineStart(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("inset-inline-start", value.value)
}

public func insetInlineStart(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("inset-inline-start", value.value)
}

public func insetInlineEnd(_ value: Int) -> CSS.Property {
  CSS.Property("inset-inline-end", intToString(value))
}

public func insetInlineEnd(_ value: Double) -> CSS.Property {
  CSS.Property("inset-inline-end", doubleToString(value))
}

public func insetInlineEnd(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("inset-inline-end", value.value)
}

public func insetInlineEnd(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("inset-inline-end", value.value)
}

public func insetInlineEnd(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("inset-inline-end", value.value)
}

// MARK: - Logical Size Properties
public func inlineSize(_ value: Int) -> CSS.Property {
  CSS.Property("inline-size", intToString(value))
}

public func inlineSize(_ value: Double) -> CSS.Property {
  CSS.Property("inline-size", doubleToString(value))
}

public func inlineSize(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("inline-size", value.value)
}

public func inlineSize(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("inline-size", value.value)
}

public func inlineSize(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("inline-size", value.value)
}

public func blockSize(_ value: Int) -> CSS.Property {
  CSS.Property("block-size", intToString(value))
}

public func blockSize(_ value: Double) -> CSS.Property {
  CSS.Property("block-size", doubleToString(value))
}

public func blockSize(_ value: CSS.Length) -> CSS.Property {
  CSS.Property("block-size", value.value)
}

public func blockSize(_ value: CSS.Percentage) -> CSS.Property {
  CSS.Property("block-size", value.value)
}

public func blockSize(_ value: CSS.LengthPercentage) -> CSS.Property {
  CSS.Property("block-size", value.value)
}

public func blockSize(_ value: CSS.Keyword.Auto) -> CSS.Property {
  CSS.Property("block-size", value.rawValue)
}

public func borderInlineStartWidth(_ value: Int) -> CSS.Property {
  CSS.Property("border-inline-start-width", "\(value)")
}

public func borderInlineEndWidth(_ value: Int) -> CSS.Property {
  CSS.Property("border-inline-end-width", "\(value)")
}
