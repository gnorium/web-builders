import EmbeddedSwiftUtilities

import CSSOMBuilder
import WebTypes

public struct CSSStyleDeclaration: CSSContent {
	public let property: String
	public let value: String

	public init(_ property: String, _ value: String) {
		self.property = property
		self.value = value
	}

	public func render() -> CSSRule {
        .styleDeclaration(property: property, value: value)
	}

	public func important() -> CSSStyleDeclaration {
		CSSStyleDeclaration(property, "\(value) !important")
	}

    public var cssRuleType: CSSRuleType { .declaration }
}
public func display(_ value: CSSDisplay.Outside) -> CSSStyleDeclaration {
	CSSStyleDeclaration("display", value.rawValue)
}
public func display(_ value: CSSDisplay.Inside) -> CSSStyleDeclaration {
	CSSStyleDeclaration("display", value.rawValue)
}
public func display(_ value: CSSDisplay.ListItem) -> CSSStyleDeclaration {
	CSSStyleDeclaration("display", value.rawValue)
}
public func display(_ value: CSSDisplay.Internal) -> CSSStyleDeclaration {
	CSSStyleDeclaration("display", value.rawValue)
}
public func display(_ value: CSSDisplay.Box) -> CSSStyleDeclaration {
	CSSStyleDeclaration("display", value.rawValue)
}
public func display(_ value: CSSDisplay.Legacy) -> CSSStyleDeclaration {
	CSSStyleDeclaration("display", value.rawValue)
}
public func display(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("display", value.rawValue)
}
public func display(_ outside: CSSDisplay.Outside, _ inside: CSSDisplay.Inside) -> CSSStyleDeclaration {
	CSSStyleDeclaration("display", "\(outside.rawValue) \(inside.rawValue)")
}
public func position(_ value: CSSPosition) -> CSSStyleDeclaration {
	CSSStyleDeclaration("position", value.rawValue)
}
public func direction(_ value: CSSDirection) -> CSSStyleDeclaration {
	CSSStyleDeclaration("direction", value.rawValue)
}
@available(*, deprecated)
public func display(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("display", value)
}
@available(*, deprecated)
public func position(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("position", value)
}
public func width(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("width", px(value).value) }
public func width(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("width", px(value).value) }
public func width(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("width", value.value) }
public func width(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("width", value.value) }
public func width(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("width", value.value) }

public func width(_ value: CSSKeyword.Length) -> CSSStyleDeclaration {
	CSSStyleDeclaration("width", value.rawValue)
}
public func width(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("width", value.rawValue)
}
public func height(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("height", px(value).value) }
public func height(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("height", px(value).value) }
public func height(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("height", value.value) }
public func height(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("height", value.value) }
public func height(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("height", value.value) }

public func height(_ value: CSSKeyword.Length) -> CSSStyleDeclaration {
	CSSStyleDeclaration("height", value.rawValue)
}
public func height(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("height", value.rawValue)
}
public func padding(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", px(value).value) }
public func padding(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", px(value).value) }
public func padding(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", value.value) }
public func padding(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", value.value) }
public func padding(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", value.value) }

public func padding(_ vertical: Length, _ horizontal: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(vertical.value) \(horizontal.value)") }
public func padding(_ vertical: Percentage, _ horizontal: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(vertical.value) \(horizontal.value)") }
public func padding(_ v: LengthPercentage, _ h: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(v.value) \(h.value)") }
public func padding(_ v: Int, _ h: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(px(v).value) \(h.value)") }
public func padding(_ v: Double, _ h: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(px(v).value) \(h.value)") }
public func padding(_ v: Length, _ h: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(v.value) \(px(h).value)") }
public func padding(_ v: Length, _ h: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(v.value) \(px(h).value)") }
public func padding(_ v: Length, _ h: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(v.value) \(h.value)") }
public func padding(_ v: LengthPercentage, _ h: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(v.value) \(h.value)") }

public func padding(_ top: Length, _ horizontal: Length, _ bottom: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(top.value) \(horizontal.value) \(bottom.value)") }
public func padding(_ top: LengthPercentage, _ horizontal: Length, _ bottom: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(top.value) \(horizontal.value) \(bottom.value)") }
public func padding(_ t: LengthPercentage, _ h: LengthPercentage, _ b: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(t.value) \(h.value) \(b.value)") }

public func padding(_ top: Length, _ right: Length, _ bottom: Length, _ left: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(top.value) \(right.value) \(bottom.value) \(left.value)") }
public func padding(_ top: Length, _ right: LengthPercentage, _ bottom: Length, _ left: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(top.value) \(right.value) \(bottom.value) \(left.value)") }
public func padding(_ t: LengthPercentage, _ r: LengthPercentage, _ b: LengthPercentage, _ l: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding", "\(t.value) \(r.value) \(b.value) \(l.value)") }

public func margin(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", px(value).value) }
public func margin(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", px(value).value) }
public func margin(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", value.value) }
public func margin(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", value.value) }
public func margin(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", value.value) }
public func margin(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", value.rawValue) }

public func margin(_ vertical: Length, _ horizontal: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", "\(vertical.value) \(horizontal.value)") }
public func margin(_ vertical: Percentage, _ horizontal: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", "\(vertical.value) \(horizontal.value)") }
public func margin(_ v: LengthPercentage, _ h: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", "\(v.value) \(h.value)") }
public func margin(_ v: Length, _ h: CSSKeyword.Auto) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", "\(v.value) \(h.rawValue)") }
public func margin(_ v: CSSKeyword.Auto, _ h: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", "\(v.rawValue) \(h.value)") }
public func margin(_ v: CSSKeyword.Auto, _ h: CSSKeyword.Auto) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", "\(v.rawValue) \(h.rawValue)") }

public func margin(_ top: Length, _ horizontal: Length, _ bottom: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", "\(top.value) \(horizontal.value) \(bottom.value)") }
public func margin(_ t: LengthPercentage, _ h: LengthPercentage, _ b: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", "\(t.value) \(h.value) \(b.value)") }

public func margin(_ top: Length, _ right: Length, _ bottom: Length, _ left: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", "\(top.value) \(right.value) \(bottom.value) \(left.value)") }
public func margin(_ t: LengthPercentage, _ r: LengthPercentage, _ b: LengthPercentage, _ l: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin", "\(t.value) \(r.value) \(b.value) \(l.value)") }

@_disfavoredOverload
public func margin(_ top: Length, _ right: CSSKeyword.Auto, _ bottom: Length, _ left: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("margin", "\(top.value) \(right.rawValue) \(bottom.value) \(left.rawValue)")
}
public func margin(_ top: LengthPercentage, _ right: CSSKeyword.Auto, _ bottom: LengthPercentage, _ left: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("margin", "\(top.value) \(right.rawValue) \(bottom.value) \(left.rawValue)")
}

public func fontSize(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("font-size", value.value) }
public func fontSize(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("font-size", value.value) }
public func fontSize(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("font-size", value.value) }
public func fontSize(_ value: CSSKeyword.Global) -> CSSStyleDeclaration {
	CSSStyleDeclaration("font-size", value.rawValue)
}
public func fontWeight(_ value: CSSFontWeight) -> CSSStyleDeclaration {
	CSSStyleDeclaration("font-weight", value.value)
}
public func fontWeight(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("font-weight", value)
}
public func fontWeight(_ value: CSSKeyword.Global) -> CSSStyleDeclaration {
	CSSStyleDeclaration("font-weight", value.rawValue)
}
public func fontFamily(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("font-family", value)
}
public func fontFamily(_ value: CSSFontFamily) -> CSSStyleDeclaration {
	CSSStyleDeclaration("font-family", value.value)
}
public func fontFamily(_ value: CSSFontFamily.GenericFamily.GenericComplete) -> CSSStyleDeclaration {
	CSSStyleDeclaration("font-family", value.rawValue)
}
public func fontFamily(_ value: CSSFontFamily.GenericFamily.GenericIncomplete) -> CSSStyleDeclaration {
	CSSStyleDeclaration("font-family", value.rawValue)
}
public func fontFamily(_ value: CSSFontFamily.GenericFamily.GenericScriptSpecific) -> CSSStyleDeclaration {
	CSSStyleDeclaration("font-family", value.value)
}
public func fontFamily(_ value: CSSFontFamily.GenericFamily) -> CSSStyleDeclaration {
	CSSStyleDeclaration("font-family", value.value)
}
public func fontFamily(_ value: CSSKeyword.Global) -> CSSStyleDeclaration {
	CSSStyleDeclaration("font-family", value.rawValue)
}
public func fontStyle(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("font-style", value)
}
public func fontStyle(_ value: CSSFontStyle) -> CSSStyleDeclaration {
	CSSStyleDeclaration("font-style", value.rawValue)
}
public func lineHeight(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("line-height", value.value) }
public func lineHeight(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("line-height", value.value) }
public func lineHeight(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("line-height", value.value) }
public func lineHeight(_ value: Double) -> CSSStyleDeclaration {
	CSSStyleDeclaration("line-height", doubleToString(value))
}
public func lineHeight(_ value: Int) -> CSSStyleDeclaration {
	#if SERVER
    
    CSSStyleDeclaration("line-height", "\(value)")
    
    #endif
    
    #if CLIENT

	CSSStyleDeclaration("line-height", intToString(value))

    #endif
}
public func leadingTrim(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("leading-trim", value)
}
public func textAlign(_ value: CSSTextAlign) -> CSSStyleDeclaration {
	CSSStyleDeclaration("text-align", value.rawValue)
}
public func textAlign(_ value: CSSKeyword.Global) -> CSSStyleDeclaration {
	CSSStyleDeclaration("text-align", value.rawValue)
}
@available(*, deprecated)
public func textAlign(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("text-align", value)
}
public func textOverflow(_ value: CSSTextOverflow) -> CSSStyleDeclaration {
	CSSStyleDeclaration("text-overflow", value.value)
}
public func textOverflow(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("text-overflow", value)
}
public func color(_ value: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("color", value.value)
}
public func color(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("color", value)
}
public func color(_ value: CSSKeyword.Global) -> CSSStyleDeclaration {
	CSSStyleDeclaration("color", value.rawValue)
}
public func colorScheme(_ scheme: CSSColorScheme) -> CSSStyleDeclaration {
	CSSStyleDeclaration("color-scheme", scheme.rawValue)
}
public func colorScheme(_ s1: CSSColorScheme, _ s2: CSSColorScheme) -> CSSStyleDeclaration {
	CSSStyleDeclaration("color-scheme", "\(s1.rawValue) \(s2.rawValue)")
}
@available(*, deprecated)
public func colorScheme(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("color-scheme", value)
}
public func src(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("src", value)
}

public func backgroundColor(_ value: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-color", value.value)
}
public func backgroundColor(_ value: CSSKeyword.Transparent) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-color", value.rawValue)
}
public func backgroundColor(_ value: CSSKeyword.Global) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-color", value.rawValue)
}
public func backgroundColor(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-color", value)
}
public func borderRadius(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("border-radius", px(value).value) }
public func borderRadius(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("border-radius", px(value).value) }
public func borderRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("border-radius", value.value) }
public func borderRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-radius", value.value) }
public func borderRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-radius", value.value) }

public func borderRadius(_ topLeft: Length, _ topRight: Length, _ bottomRight: Length, _ bottomLeft: Length) -> CSSStyleDeclaration {
    CSSStyleDeclaration("border-radius", "\(topLeft.value) \(topRight.value) \(bottomRight.value) \(bottomLeft.value)")
}
public func borderRadius(_ tL: LengthPercentage, _ tR: LengthPercentage, _ bR: LengthPercentage, _ bL: LengthPercentage) -> CSSStyleDeclaration {
    CSSStyleDeclaration("border-radius", "\(tL.value) \(tR.value) \(bR.value) \(bL.value)")
}

// Directional border radius functions
public func borderTopLeftRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("border-top-left-radius", value.value) }
public func borderTopLeftRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-top-left-radius", value.value) }
public func borderTopLeftRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-top-left-radius", value.value) }

public func borderTopRightRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("border-top-right-radius", value.value) }
public func borderTopRightRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-top-right-radius", value.value) }
public func borderTopRightRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-top-right-radius", value.value) }

public func borderBottomLeftRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("border-bottom-left-radius", value.value) }
public func borderBottomLeftRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-bottom-left-radius", value.value) }
public func borderBottomLeftRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-bottom-left-radius", value.value) }

public func borderBottomRightRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("border-bottom-right-radius", value.value) }
public func borderBottomRightRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-bottom-right-radius", value.value) }
public func borderBottomRightRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-bottom-right-radius", value.value) }

public func borderStartStartRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("border-start-start-radius", value.value) }
public func borderStartStartRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-start-start-radius", value.value) }
public func borderStartStartRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-start-start-radius", value.value) }

public func borderStartEndRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("border-start-end-radius", value.value) }
public func borderStartEndRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-start-end-radius", value.value) }
public func borderStartEndRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-start-end-radius", value.value) }

public func borderEndStartRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("border-end-start-radius", value.value) }
public func borderEndStartRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-end-start-radius", value.value) }
public func borderEndStartRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-end-start-radius", value.value) }

public func borderEndEndRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("border-end-end-radius", value.value) }
public func borderEndEndRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-end-end-radius", value.value) }
public func borderEndEndRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-end-end-radius", value.value) }

public func border(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border", value)
}
public func border(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border", value.rawValue)
}
public func border(_ width: Length, _ style: CSSBorder.LineStyle) -> CSSStyleDeclaration { CSSStyleDeclaration("border", "\(width.value) \(style.value)") }
public func border(_ width: Percentage, _ style: CSSBorder.LineStyle) -> CSSStyleDeclaration { CSSStyleDeclaration("border", "\(width.value) \(style.value)") }
public func border(_ width: LengthPercentage, _ style: CSSBorder.LineStyle) -> CSSStyleDeclaration { CSSStyleDeclaration("border", "\(width.value) \(style.value)") }

public func border(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border", "\(width.value) \(style.value) \(color.value)") }
public func border(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border", "\(width.value) \(style.value) \(color.value)") }
public func border(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border", "\(width.value) \(style.value) \(color.value)") }
public func borderWidth(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("border-width", px(value).value) }
public func borderWidth(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("border-width", px(value).value) }
public func borderWidth(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("border-width", value.value) }
public func borderWidth(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-width", value.value) }
public func borderWidth(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-width", value.value) }
public func borderWidth(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-width", value)
}
public func borderStyle(_ value: CSSBorder.LineStyle) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-style", value.value)
}
public func borderStyle(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-style", value.rawValue)
}
public func borderStyle(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-style", value)
}

public func fill(_ value: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("fill", value.value)
}
public func fill(_ value: SVGPaint) -> CSSStyleDeclaration {
	CSSStyleDeclaration("fill", value.value)
}
public func fill(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("fill", value.rawValue)
}
@_disfavoredOverload
public func fill(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("fill", value)
}
public func stroke(_ value: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stroke", value.value)
}
public func stroke(_ value: SVGPaint) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stroke", value.value)
}
public func stroke(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stroke", value.rawValue)
}
@_disfavoredOverload
public func stroke(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stroke", value)
}
public func fillRule(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("fill-rule", value)
}
public func clipRule(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("clip-rule", value)
}
public func strokeLinejoin(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stroke-linejoin", value)
}
@_disfavoredOverload
public func strokeMiterlimit(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stroke-miterlimit", value)
}
@_disfavoredOverload
public func strokeMiterlimit(_ value: Double) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stroke-miterlimit", doubleToString(value))
}

public func flexDirection(_ value: CSSFlexDirection) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex-direction", value.rawValue)
}
public func alignItems(_ value: CSSAlignItems) -> CSSStyleDeclaration {
	CSSStyleDeclaration("align-items", value.rawValue)
}
public func justifyContent(_ value: CSSJustifyContent) -> CSSStyleDeclaration {
	CSSStyleDeclaration("justify-content", value.rawValue)
}
@available(*, deprecated)
public func flexDirection(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex-direction", value)
}
@available(*, deprecated)
public func alignItems(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("align-items", value)
}
public func alignSelf(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("align-self", value)
}
public func alignSelf(_ value: CSSAlignSelf) -> CSSStyleDeclaration {
	CSSStyleDeclaration("align-self", value.rawValue)
}
@available(*, deprecated)
public func justifyContent(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("justify-content", value)
}

public func boxSizing(_ value: CSSBoxSizing) -> CSSStyleDeclaration {
	CSSStyleDeclaration("box-sizing", value.value)
}
@available(*, deprecated)
public func boxSizing(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("box-sizing", value)
}
public func fieldSizing(_ value: CSSFieldSizing) -> CSSStyleDeclaration {
	CSSStyleDeclaration("field-sizing", value.rawValue)
}
public func maxWidth(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("max-width", px(value).value) }
public func maxWidth(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("max-width", px(value).value) }
public func maxWidth(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("max-width", value.value) }
public func maxWidth(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("max-width", value.value) }
public func maxWidth(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("max-width", value.value) }

public func maxWidth(_ value: CSSKeyword.Length) -> CSSStyleDeclaration {
	CSSStyleDeclaration("max-width", value.rawValue)
}
public func maxWidth(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("max-width", value.rawValue)
}
public func maxWidth(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("max-width", value.rawValue)
}
public func paddingRight(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-right", px(value).value) }
public func paddingRight(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-right", px(value).value) }
public func paddingRight(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-right", value.value) }
public func paddingRight(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-right", value.value) }
public func paddingRight(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-right", value.value) }

public func paddingLeft(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-left", px(value).value) }
public func paddingLeft(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-left", px(value).value) }
public func paddingLeft(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-left", value.value) }
public func paddingLeft(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-left", value.value) }
public func paddingLeft(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-left", value.value) }
// MARK: - Transition Property
public func transition(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transition", value)
}
public func transition(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transition", value.rawValue)
}

// transition-property = none | <single-transition-property>#
public func transitionProperty(_ properties: CSSSingleTransitionProperty...) -> CSSStyleDeclaration {
	var results = ""
    for (index, p) in properties.enumerated() {
        results += p.value
        if index < properties.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("transition-property", results)
}

public func transitionProperty(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transition-property", value.rawValue)
}

// transition-duration = <time>#
public func transitionDuration(_ durations: CSSTime...) -> CSSStyleDeclaration {
	var results = ""
    for (index, d) in durations.enumerated() {
        results += d.value
        if index < durations.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("transition-duration", results)
}

// transition-timing-function = <easing-function>#
public func transitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSStyleDeclaration {
	var results = ""
    for (index, f) in functions.enumerated() {
        results += f.value
        if index < functions.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("transition-timing-function", results)
}

public func transitionTimingFunction(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transition-timing-function", value)
}

// transition-delay = <time>#
public func transitionDelay(_ delays: CSSTime...) -> CSSStyleDeclaration {
	var results = ""
    for (index, d) in delays.enumerated() {
        results += d.value
        if index < delays.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("transition-delay", results)
}

// transition-behavior = <transition-behavior-value>#
public func transitionBehavior(_ behaviors: CSSTransitionBehaviorValue...) -> CSSStyleDeclaration {
	var results = ""
    for (index, b) in behaviors.enumerated() {
        results += b.rawValue
        if index < behaviors.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("transition-behavior", results)
}


public func letterSpacing(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("letter-spacing", value.value) }
public func letterSpacing(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("letter-spacing", value.value) }
public func letterSpacing(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("letter-spacing", value.value) }


public func transform(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("transform", value.value) }
public func transform(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("transform", value.value) }
public func transform(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("transform", value.value) }

public func transformStyle(_ value: CSSTransformStyle) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transform-style", value.rawValue)
}
public func transformStyle(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transform-style", value)
}

// transition = <single-transition>#
// <single-transition> = [ none | <single-transition-property> ] || <time> || <easing-function> || <time> || <transition-behavior-value>
public func transition(_ transitions: CSSSingleTransition...) -> CSSStyleDeclaration {
	var results = ""
    for (index, t) in transitions.enumerated() {
        results += t.value
        if index < transitions.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("transition", results)
}

// Convenience: unwrapped tuple syntax
public func transition(_ property: CSSSingleTransitionProperty, _ duration: CSSTime) -> CSSStyleDeclaration {
	transition(CSSSingleTransition(property, duration, .ease))
}

public func transition(_ property: String, _ duration: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transition", "\(property) \(duration.value)")
}

public func transition(_ property: CSSSingleTransitionProperty, _ duration: CSSTime, _ easingFunction: CSSEasingFunction) -> CSSStyleDeclaration {
	transition(CSSSingleTransition(property, duration, easingFunction))
}

public func transition(_ property: String, _ duration: CSSTime, _ easingFunction: CSSEasingFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transition", "\(property) \(duration.value) \(easingFunction.value)")
}

public func transition(_ property: CSSSingleTransitionProperty, _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ delay: CSSTime) -> CSSStyleDeclaration {
	transition(CSSSingleTransition(property, duration, easingFunction, delay))
}

public func transition(_ property: CSSSingleTransitionProperty, _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ behavior: CSSTransitionBehaviorValue) -> CSSStyleDeclaration {
	transition(CSSSingleTransition(property, duration, easingFunction, nil, behavior))
}

public func transition(_ property: CSSSingleTransitionProperty, _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ delay: CSSTime, _ behavior: CSSTransitionBehaviorValue) -> CSSStyleDeclaration {
	transition(CSSSingleTransition(property, duration, easingFunction, delay, behavior))
}

// Overload for multiple (property, duration) tuples
public func transition(_ transition1: (CSSSingleTransitionProperty, CSSTime), _ transition2: (CSSSingleTransitionProperty, CSSTime)) -> CSSStyleDeclaration {
	transition(
		CSSSingleTransition(transition1.0, transition1.1, .ease),
		CSSSingleTransition(transition2.0, transition2.1, .ease)
	)
}

public func transition(_ transition1: (CSSSingleTransitionProperty, CSSTime), _ transition2: (CSSSingleTransitionProperty, CSSTime), _ transition3: (CSSSingleTransitionProperty, CSSTime)) -> CSSStyleDeclaration {
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
) -> CSSStyleDeclaration {
	transition(
		CSSSingleTransition(t1.0, t1.1, t1.2),
		CSSSingleTransition(t2.0, t2.1, t2.2)
	)
}

public func transition(
	_ t1: (CSSSingleTransitionProperty, CSSTime, CSSEasingFunction),
	_ t2: (CSSSingleTransitionProperty, CSSTime, CSSEasingFunction),
	_ t3: (CSSSingleTransitionProperty, CSSTime, CSSEasingFunction)
) -> CSSStyleDeclaration {
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
) -> CSSStyleDeclaration {
	transition(
		CSSSingleTransition(t1.0, t1.1, t1.2),
		CSSSingleTransition(t2.0, t2.1, t2.2),
		CSSSingleTransition(t3.0, t3.1, t3.2),
		CSSSingleTransition(t4.0, t4.1, t4.2)
	)
}

public func cursor(_ value: CSSCursor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("cursor", value.value)
}
public func cursor(_ urlValue: String, _ fallback: CSSCursor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("cursor", "\(urlValue), \(fallback.value)")
}
public func cursor(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("cursor", value)
}

public func outline(_ value: CSSOutline) -> CSSStyleDeclaration {
	CSSStyleDeclaration("outline", value.rawValue)
}
public func outline(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("outline", "\(width.value) \(style.value) \(color.value)") }
public func outline(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("outline", "\(width.value) \(style.value) \(color.value)") }
public func outline(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("outline", "\(width.value) \(style.value) \(color.value)") }

public func outline(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSKeyword.Transparent) -> CSSStyleDeclaration { CSSStyleDeclaration("outline", "\(width.value) \(style.value) \(color.rawValue)") }
public func outline(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("outline", value)
}

public func outlineWidth(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("outline-width", value.value) }
public func outlineWidth(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("outline-width", value.value) }
public func outlineWidth(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("outline-width", value.value) }
public func outlineWidth(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("outline-width", value)
}

public func outlineStyle(_ value: CSSBorder.LineStyle) -> CSSStyleDeclaration {
	CSSStyleDeclaration("outline-style", value.value)
}
public func outlineStyle(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("outline-style", value.rawValue)
}
public func outlineStyle(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("outline-style", value)
}
public func outlineColor(_ value: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("outline-color", value.value)
}
public func outlineColor(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("outline-color", value)
}
public func transform(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transform", value)
}
public func transform(_ value: CSSTransformFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transform", value.value)
}
public func transform(_ f1: CSSTransformFunction, _ f2: CSSTransformFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transform", "\(f1.value) \(f2.value)")
}
public func transform(_ f1: CSSTransformFunction, _ f2: CSSTransformFunction, _ f3: CSSTransformFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transform", "\(f1.value) \(f2.value) \(f3.value)")
}
public func transform(_ f1: CSSTransformFunction, _ f2: CSSTransformFunction, _ f3: CSSTransformFunction, _ f4: CSSTransformFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transform", "\(f1.value) \(f2.value) \(f3.value) \(f4.value)")
}
public func zIndex(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("z-index", value)
}
public func zIndex(_ value: Int) -> CSSStyleDeclaration {
	CSSStyleDeclaration("z-index", "\(value)")
}
public func zIndex(_ value: CSSNumber) -> CSSStyleDeclaration {
	CSSStyleDeclaration("z-index", value.value)
}
public func top(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("top", px(value).value) }
public func top(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("top", px(value).value) }
public func top(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("top", value.value) }
public func top(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("top", value.value) }
public func top(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("top", value.value) }

public func left(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("left", px(value).value) }
public func left(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("left", px(value).value) }
public func left(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("left", value.value) }
public func left(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("left", value.value) }
public func left(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("left", value.value) }

public func right(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("right", px(value).value) }
public func right(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("right", px(value).value) }
public func right(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("right", value.value) }
public func right(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("right", value.value) }
public func right(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("right", value.value) }

public func bottom(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("bottom", px(value).value) }
public func bottom(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("bottom", px(value).value) }
public func bottom(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("bottom", value.value) }
public func bottom(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("bottom", value.value) }
public func bottom(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("bottom", value.value) }
public func overflowY(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("overflow-y", value)
}
public func overflowY(_ value: CSSOverflow) -> CSSStyleDeclaration {
	CSSStyleDeclaration("overflow-y", value.rawValue)
}
public func overflowX(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("overflow-x", value)
}
public func overflowX(_ value: CSSOverflow) -> CSSStyleDeclaration {
	CSSStyleDeclaration("overflow-x", value.rawValue)
}
public func overflow(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("overflow", value)
}
public func overflow(_ value: CSSOverflow) -> CSSStyleDeclaration {
	CSSStyleDeclaration("overflow", value.rawValue)
}
public func objectFit(_ value: CSSObjectFit) -> CSSStyleDeclaration {
	CSSStyleDeclaration("object-fit", value.rawValue)
}
public func objectFit(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("object-fit", value.rawValue)
}
public func objectFit(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("object-fit", value)
}
public func objectPosition(_ value: CSSObjectPosition) -> CSSStyleDeclaration {
	CSSStyleDeclaration("object-position", value.rawValue)
}
public func objectPosition(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("object-position", value)
}
public func maxHeight(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("max-height", px(value).value) }
public func maxHeight(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("max-height", px(value).value) }
public func maxHeight(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("max-height", value.value) }
public func maxHeight(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("max-height", value.value) }
public func maxHeight(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("max-height", value.value) }

public func minWidth(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("min-width", px(value).value) }
public func minWidth(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("min-width", px(value).value) }
public func minWidth(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("min-width", value.value) }
public func minWidth(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("min-width", value.value) }
public func minWidth(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("min-width", value.value) }

public func minHeight(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("min-height", px(value).value) }
public func minHeight(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("min-height", px(value).value) }
public func minHeight(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("min-height", value.value) }
public func minHeight(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("min-height", value.value) }
public func minHeight(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("min-height", value.value) }

public func marginTop(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("margin-top", value)
}
public func marginTop(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("margin-top", value.rawValue)
}
public func marginTop(_ value: CSSKeyword.Global) -> CSSStyleDeclaration {
	CSSStyleDeclaration("margin-top", value.rawValue)
}

public func marginTop(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-top", px(value).value) }
public func marginTop(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-top", px(value).value) }
public func marginTop(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-top", value.value) }
public func marginTop(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-top", value.value) }
public func marginTop(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-top", value.value) }

public func marginLeft(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-left", px(value).value) }
public func marginLeft(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-left", px(value).value) }
public func marginLeft(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-left", value.value) }
public func marginLeft(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-left", value.value) }
public func marginLeft(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-left", value.value) }

public func marginBottom(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-bottom", px(value).value) }
public func marginBottom(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-bottom", px(value).value) }
public func marginBottom(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-bottom", value.value) }
public func marginBottom(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-bottom", value.value) }
public func marginBottom(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-bottom", value.value) }

public func marginRight(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-right", px(value).value) }
public func marginRight(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-right", px(value).value) }
public func marginRight(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-right", value.value) }
public func marginRight(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-right", value.value) }
public func marginRight(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-right", value.value) }

public func paddingTop(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-top", px(value).value) }
public func paddingTop(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-top", px(value).value) }
public func paddingTop(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-top", value.value) }
public func paddingTop(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-top", value.value) }
public func paddingTop(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-top", value.value) }

public func paddingBottom(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-bottom", px(value).value) }
public func paddingBottom(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-bottom", px(value).value) }
public func paddingBottom(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-bottom", value.value) }
public func paddingBottom(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-bottom", value.value) }
public func paddingBottom(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-bottom", value.value) }

public func textDecoration(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("text-decoration", value)
}
public func textDecoration(_ value: CSSTextDecoration) -> CSSStyleDeclaration {
	CSSStyleDeclaration("text-decoration", value.value)
}
public func textDecoration(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("text-decoration", value.rawValue)
}
public func letterSpacing(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("letter-spacing", value)
}
public func textTransform(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("text-transform", value)
}
public func textTransform(_ value: CSSTextTransform) -> CSSStyleDeclaration {
	CSSStyleDeclaration("text-transform", value.rawValue)
}
public func textTransform(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("text-transform", value.rawValue)
}
public func textTransform(_ value: CSSKeyword.Global) -> CSSStyleDeclaration {
	CSSStyleDeclaration("text-transform", value.rawValue)
}
public func whiteSpace(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("white-space", value)
}
public func wordWrap(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("word-wrap", value)
}
public func wordWrap(_ value: CSSWordWrap) -> CSSStyleDeclaration {
	CSSStyleDeclaration("word-wrap", value.rawValue)
}

public func listStyle(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("list-style", value)
}
public func listStyle(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("list-style", value.rawValue)
}

public func listStyleType(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("list-style-type", value)
}

public func listStyleType(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("list-style-type", value.rawValue)
}

public func borderBottom(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-bottom", value)
}
public func borderBottom(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-bottom", value.rawValue)
}
public func borderBottom(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-bottom", "\(width.value) \(style.value) \(color.value)") }
public func borderBottom(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-bottom", "\(width.value) \(style.value) \(color.value)") }
public func borderBottom(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-bottom", "\(width.value) \(style.value) \(color.value)") }

public func borderBottom(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSKeyword.Transparent) -> CSSStyleDeclaration { CSSStyleDeclaration("border-bottom", "\(width.value) \(style.value) \(color.rawValue)") }

public func borderTop(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-top", value.rawValue)
}
public func borderTop(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-top", "\(width.value) \(style.value) \(color.value)") }
public func borderTop(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-top", "\(width.value) \(style.value) \(color.value)") }
public func borderTop(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-top", "\(width.value) \(style.value) \(color.value)") }

public func borderRight(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-right", value.rawValue)
}
public func borderRight(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-right", "\(width.value) \(style.value) \(color.value)") }
public func borderRight(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-right", "\(width.value) \(style.value) \(color.value)") }
public func borderRight(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-right", "\(width.value) \(style.value) \(color.value)") }

public func borderLeft(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-left", value.rawValue)
}
public func borderLeft(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-left", "\(width.value) \(style.value) \(color.value)") }
public func borderLeft(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-left", "\(width.value) \(style.value) \(color.value)") }
public func borderLeft(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-left", "\(width.value) \(style.value) \(color.value)") }
public func borderColor(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-color", value)
}
public func borderColor(_ value: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-color", value.value)
}
public func borderColor(_ value: CSSKeyword.Transparent) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-color", value.rawValue)
}
public func borderTopColor(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-top-color", value)
}
public func borderTopColor(_ value: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-top-color", value.value)
}
public func borderBottomColor(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-bottom-color", value)
}
public func borderBottomColor(_ value: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-bottom-color", value.value)
}
public func borderLeftColor(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-left-color", value)
}
public func borderLeftColor(_ value: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-left-color", value.value)
}
public func borderRightColor(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-right-color", value)
}
public func borderRightColor(_ value: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-right-color", value.value)
}
public func borderCollapse(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-collapse", value)
}
public func borderCollapse(_ value: CSSBorderCollapse) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-collapse", value.rawValue)
}
public func tableLayout(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("table-layout", value)
}
public func tableLayout(_ value: CSSTableLayout) -> CSSStyleDeclaration {
	CSSStyleDeclaration("table-layout", value.rawValue)
}

public func flex(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex", value)
}
public func flex(_ value: Int) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex", "\(value)")
}
public func flex(_ value: Double) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex", doubleToString(value))
}
public func flexGrow(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex-grow", value)
}
public func flexGrow(_ value: Int) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex-grow", "\(value)")
}
public func flexGrow(_ value: Double) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex-grow", doubleToString(value))
}
public func flexShrink(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex-shrink", value)
}
public func flexShrink(_ value: Int) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex-shrink", "\(value)")
}
public func flexShrink(_ value: Double) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex-shrink", doubleToString(value))
}
public func flexWrap(_ value: CSSFlexWrap) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex-wrap", value.rawValue)
}
public func flexWrap(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex-wrap", value)
}
// flexBasis consolidated to String and Global, added protocol-based one if missing
public func flexBasis(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("flex-basis", value.value) }
public func flexBasis(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("flex-basis", value.value) }
public func flexBasis(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("flex-basis", value.value) }
public func flexBasis(_ value: CSSKeyword.Global) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex-basis", value.rawValue)
}
public func flexBasis(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("flex-basis", value)
}
public func order(_ value: Int) -> CSSStyleDeclaration {
	CSSStyleDeclaration("order", "\(value)")
}
public func order(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("order", value)
}

public func verticalAlign(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("vertical-align", value)
}
public func verticalAlign(_ value: CSSVerticalAlign) -> CSSStyleDeclaration {
	CSSStyleDeclaration("vertical-align", value.rawValue)
}

public func scrollbarWidth(_ value: CSSScrollbarWidth) -> CSSStyleDeclaration {
	CSSStyleDeclaration("scrollbar-width", value.value)
}
public func scrollbarWidth(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("scrollbar-width", value.rawValue)
}
public func scrollbarWidth(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("scrollbar-width", value)
}

public func background(_ value: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background", value.value)
}
public func background(_ value: CSSKeyword.Transparent) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background", value.rawValue)
}
public func background(_ value: CSSImage.Gradient) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background", value.value)
}
public func background(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background", value)
}
public func backgroundImage(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-image", value)
}
public func backgroundSize(_ value: CSSBackgroundSize) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-size", value.value)
}
public func backgroundSize(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-size", value.rawValue)
}
public func backgroundSize(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-size", value)
}
public func backgroundSize(_ width: Length, _ height: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-size", "\(width.value) \(height.rawValue)")
}
public func backgroundRepeat(_ value: CSSBackgroundRepeat) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-repeat", value.rawValue)
}
public func backgroundRepeat(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-repeat", value)
}
public func backgroundPosition(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-position", value)
}
public func backgroundPosition(_ value: CSSBackgroundPosition) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-position", value.value)
}

public func appearance(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("appearance", value)
}
public func appearance(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("appearance", value.rawValue)
}
public func appearance(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("appearance", value.rawValue)
}
public func appearance(_ value: CSSAppearance) -> CSSStyleDeclaration {
	CSSStyleDeclaration("appearance", value.rawValue)
}
public func appearance(_ value: CSSAppearance.CompatAuto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("appearance", value.rawValue)
}
public func appearance(_ value: CSSAppearance.CompatSpecial) -> CSSStyleDeclaration {
	CSSStyleDeclaration("appearance", value.rawValue)
}

public func pointerEvents(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("pointer-events", value)
}
public func pointerEvents(_ value: CSSPointerEvents) -> CSSStyleDeclaration {
	CSSStyleDeclaration("pointer-events", value.rawValue)
}
public func pointerEvents(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("pointer-events", value.rawValue)
}
@_disfavoredOverload
public func strokeWidth(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stroke-width", value)
}
public func strokeWidth(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("stroke-width", value.value) }
public func strokeWidth(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("stroke-width", value.value) }
public func strokeWidth(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("stroke-width", value.value) }
public func strokeOpacity(_ value: Double) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stroke-opacity", doubleToString(value))
}
public func strokeOpacity(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stroke-opacity", value)
}
public func strokeLinecap(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stroke-linecap", value)
}
public func dominantBaseline(_ value: CSSDominantBaseline) -> CSSStyleDeclaration {
	CSSStyleDeclaration("dominant-baseline", value.rawValue)
}
public func dominantBaseline(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("dominant-baseline", value)
}
@_disfavoredOverload
public func opacity(_ value: Double) -> CSSStyleDeclaration {
	CSSStyleDeclaration("opacity", doubleToString(value))
}
@_disfavoredOverload
public func opacity(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("opacity", value)
}
public func opacity(_ value: CSSNumber) -> CSSStyleDeclaration {
	CSSStyleDeclaration("opacity", value.value)
}
public func gap(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("gap", px(value).value) }
public func gap(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("gap", px(value).value) }
public func gap(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("gap", value.value) }
public func gap(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("gap", value.value) }
public func gap(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("gap", value.value) }

public func gap(_ rowGap: Length, _ columnGap: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("gap", "\(rowGap.value) \(columnGap.value)") }
public func gap(_ rowGap: Percentage, _ columnGap: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("gap", "\(rowGap.value) \(columnGap.value)") }
public func gap(_ rowGap: LengthPercentage, _ columnGap: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("gap", "\(rowGap.value) \(columnGap.value)") }
public func gap(_ rowGap: Length, _ columnGap: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("gap", "\(rowGap.value) \(columnGap.value)") }
public func gap(_ rowGap: LengthPercentage, _ columnGap: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("gap", "\(rowGap.value) \(columnGap.value)") }

public func content(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("content", value)
}

// CSSContent content with counter() function
public func content(_ counter: CSSCounter, _ suffix: String = "") -> CSSStyleDeclaration {
	let value = suffix.isEmpty ? "counter(\(counter.name))" : "counter(\(counter.name)) \"\(suffix)\""
	return CSSStyleDeclaration("content", value)
}

public func content(_ c1: CSSCounter, _ s1: String, _ c2: CSSCounter, _ s2: String) -> CSSStyleDeclaration {
	let value = "counter(\(c1.name)) \"\(s1)\" counter(\(c2.name)) \"\(s2)\""
	return CSSStyleDeclaration("content", value)
}

public func content(_ items: CSSContentItem...) -> CSSStyleDeclaration {
    var results = ""
    for (index, item) in items.enumerated() {
        switch item {
        case .counter(let counter):
            results += "counter(\(counter.name))"
        case .string(let str):
            results += "\"\(str)\""
        }
        if index < items.count - 1 {
            results += " "
        }
    }
    return CSSStyleDeclaration("content", results)
}

public func counter(_ name: String) -> CSSCounter {
	CSSCounter(name)
}

public func counterReset(_ name: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("counter-reset", name)
}

public func counterIncrement(_ name: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("counter-increment", name)
}

// box-shadow = <spread-shadow>#
public func boxShadow(_ shadows: CSSSpreadShadow...) -> CSSStyleDeclaration {
	var results = ""
    for (index, s) in shadows.enumerated() {
        results += s.value
        if index < shadows.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("box-shadow", results)
}

// Convenience: Apply color to shadow (e.g., boxShadow(boxShadowOutsetSmall, boxShadowColorProgressiveFocus))
public func boxShadow(_ shadow: CSSSpreadShadow, _ color: CSSColor) -> CSSStyleDeclaration {
	// Combine the shadow with the color by prepending color to shadow value
	let value = "\(color.value) \(shadow.value)"
	return CSSStyleDeclaration("box-shadow", value)
}

// Convenience: Two shadows with colors (e.g., boxShadow((boxShadowOutsetMediumBelow, boxShadowColorAlphaBase), (boxShadowOutsetMediumAround, boxShadowColorAlphaBase)))
public func boxShadow(_ shadow1: (CSSSpreadShadow, CSSColor), _ shadow2: (CSSSpreadShadow, CSSColor)) -> CSSStyleDeclaration {
	let value1 = "\(shadow1.1.value) \(shadow1.0.value)"
	let value2 = "\(shadow2.1.value) \(shadow2.0.value)"
	return CSSStyleDeclaration("box-shadow", "\(value1), \(value2)")
}

public func boxShadow(_ shadow1: (Length, Length, Length, CSSColor), _ shadow2: (Length, Length, Length, CSSColor)) -> CSSStyleDeclaration {
    CSSStyleDeclaration("box-shadow", "\(shadow1.0.value) \(shadow1.1.value) \(shadow1.2.value) \(shadow1.3.value), \(shadow2.0.value) \(shadow2.1.value) \(shadow2.2.value) \(shadow2.3.value)")
}

public func boxShadow(_ shadow1: (LengthPercentage, LengthPercentage, LengthPercentage, CSSColor), _ shadow2: (LengthPercentage, LengthPercentage, LengthPercentage, CSSColor)) -> CSSStyleDeclaration {
    CSSStyleDeclaration("box-shadow", "\(shadow1.0.value) \(shadow1.1.value) \(shadow1.2.value) \(shadow1.3.value), \(shadow2.0.value) \(shadow2.1.value) \(shadow2.2.value) \(shadow2.3.value)")
}

// Convenience: color, offsetX, offsetY, blur, spread, position (CSSColor)
public func boxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length, _ position: CSSSpreadShadow.BoxShadowPosition) -> CSSStyleDeclaration {
	boxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread),
		position: position
	))
}

public func boxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length) -> CSSStyleDeclaration {
	boxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread)
	))
}

// Convenience: offsetX, offsetY, blur, spread, color (color last)
public func boxShadow(_ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length, _ color: CSSColor) -> CSSStyleDeclaration {
	boxShadow(CSSSpreadShadow(
		color: CSSSpreadShadow.BoxShadowColor(color),
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread)
	))
}

public func boxShadow(_ offsetX: Length, _ offsetY: Length, _ blur: Length, _ color: CSSColor) -> CSSStyleDeclaration {
	boxShadow(CSSSpreadShadow(
		color: CSSSpreadShadow.BoxShadowColor(color),
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur)
	))
}

public func boxShadow(_ offsetX: Length, _ offsetY: Length, _ color: CSSColor) -> CSSStyleDeclaration {
	boxShadow(CSSSpreadShadow(
		color: CSSSpreadShadow.BoxShadowColor(color),
		offsetX: offsetX,
		offsetY: offsetY
	))
}

public func boxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length) -> CSSStyleDeclaration {
	boxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur)
	))
}

public func boxShadow(_ color: CSSColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length) -> CSSStyleDeclaration {
	boxShadow(CSSSpreadShadow(
		color: CSSSpreadShadow.BoxShadowColor(color),
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur)
	))
}

public func boxShadow(_ offsetX: Int, _ offsetY: Int, _ blur: Int, _ spread: Length, _ color: CSSColor) -> CSSStyleDeclaration {
	boxShadow(Length(integerLiteral: offsetX), Length(integerLiteral: offsetY), Length(integerLiteral: blur), spread, color)
}

public func boxShadow(_ offsetX: Int, _ offsetY: Int, _ blur: Int, _ color: CSSColor) -> CSSStyleDeclaration {
	boxShadow(color, Length(integerLiteral: offsetX), Length(integerLiteral: offsetY), Length(integerLiteral: blur))
}

// Convenience: color, offsetX, offsetY (no blur, spread, position) (CSSColor)
public func boxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length) -> CSSStyleDeclaration {
	boxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY
	))
}

public func boxShadow(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("box-shadow", value)
}
public func boxShadow(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("box-shadow", value.rawValue)
}

public func listStylePosition(_ value: CSSListStylePosition) -> CSSStyleDeclaration {
	CSSStyleDeclaration("list-style-position", value.rawValue)
}

public func listStylePosition(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("list-style-position", value)
}

// Convenience: position-first overload for inset shadows
// Usage: boxShadow(.inset, 0, 0, 0, px(1), color)
public func boxShadow(_ position: CSSSpreadShadow.BoxShadowPosition, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length, _ color: CSSColor) -> CSSStyleDeclaration {
	boxShadow(CSSSpreadShadow(
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
public func boxShadow(_ position: CSSSpreadShadow.BoxShadowPosition, _ offsetX: Length, _ offsetY: Length, _ color: CSSColor) -> CSSStyleDeclaration {
	boxShadow(CSSSpreadShadow(
		color: CSSSpreadShadow.BoxShadowColor(color),
		offsetX: offsetX,
		offsetY: offsetY,
		position: position
	))
}

public func boxShadow(_ position: CSSSpreadShadow.BoxShadowPosition, _ offsetX: Int, _ offsetY: Int, _ blur: Int, _ spread: Length, _ color: CSSColor) -> CSSStyleDeclaration {
	boxShadow(position, Length(integerLiteral: offsetX), Length(integerLiteral: offsetY), Length(integerLiteral: blur), spread, color)
}

public func outlineOffset(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("outline-offset", value.value) }
public func outlineOffset(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("outline-offset", value.value) }
public func outlineOffset(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("outline-offset", value.value) }
// MARK: - Animation
// animation = <single-animation>#
public func animation(_ animations: CSSSingleAnimation...) -> CSSStyleDeclaration {
	var results = ""
    for (index, a) in animations.enumerated() {
        results += a.value
        if index < animations.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("animation", results)
}

public func animation(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("animation", value)
}

// Convenience: unwrapped tuple syntax - minimal 3-param (name, duration, easing)
public func animation(_ name: String, _ duration: CSSTime, _ easingFunction: CSSEasingFunction) -> CSSStyleDeclaration {
	animation(CSSSingleAnimation(
		duration: .time(duration),
		easingFunction: easingFunction,
		name: .name(name)
	))
}

// With iteration count (4 params)
public func animation(_ name: String, _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ iterationCount: CSSSingleAnimationIterationCount) -> CSSStyleDeclaration {
	animation(CSSSingleAnimation(
		duration: .time(duration),
		easingFunction: easingFunction,
		iterationCount: iterationCount,
		name: .name(name)
	))
}

// Convenience: accept CSSTime directly (auto-wraps in duration type)
public func animation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ iterationCount: CSSSingleAnimationIterationCount) -> CSSStyleDeclaration {
	animation(CSSSingleAnimation(
		duration: .time(duration),
		easingFunction: easingFunction,
		iterationCount: iterationCount,
		name: .name(name)
	))
}

// With timeline as CSSScroll
public func animation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll) -> CSSStyleDeclaration {
	animation(CSSSingleAnimation(
		duration: .time(duration),
		easingFunction: easingFunction,
		name: .name(name),
		timeline: .scroll(timeline)
	))
}

// With timeline as CSSView
public func animation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView) -> CSSStyleDeclaration {
	animation(CSSSingleAnimation(
		duration: .time(duration),
		easingFunction: easingFunction,
		name: .name(name),
		timeline: .view(timeline)
	))
}

// With timeline as String (auto-converts to dashed-ident)
public func animation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String) -> CSSStyleDeclaration {
	animation(CSSSingleAnimation(
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
) -> CSSStyleDeclaration {
	animation(CSSSingleAnimation(
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
) -> CSSStyleDeclaration {
	animation(CSSSingleAnimation(
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
) -> CSSStyleDeclaration {
	animation(
		CSSSingleAnimation(duration: .time(a1.0), easingFunction: a1.1, iterationCount: a1.3, name: .name(a1.2)),
		CSSSingleAnimation(duration: .time(a2.0), easingFunction: a2.1, iterationCount: a2.3, name: .name(a2.2))
	)
}

public func animation(
	_ a1: (CSSTime, CSSEasingFunction, String, CSSSingleAnimationIterationCount),
	_ a2: (CSSTime, CSSEasingFunction, String, CSSSingleAnimationIterationCount),
	_ a3: (CSSTime, CSSEasingFunction, String, CSSSingleAnimationIterationCount)
) -> CSSStyleDeclaration {
	animation(
		CSSSingleAnimation(duration: .time(a1.0), easingFunction: a1.1, iterationCount: a1.3, name: .name(a1.2)),
		CSSSingleAnimation(duration: .time(a2.0), easingFunction: a2.1, iterationCount: a2.3, name: .name(a2.2)),
		CSSSingleAnimation(duration: .time(a3.0), easingFunction: a3.1, iterationCount: a3.3, name: .name(a3.2))
	)
}

// animation-name = [ none | <keyframes-name> ]#
public func animationName(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("animation-name", value)
}

public func animationName(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("animation-name", value.rawValue)
}

// animation-duration = [ auto | <time [0s,∞]> ]#
public func animationDuration(_ durations: CSSTime...) -> CSSStyleDeclaration {
	var results = ""
    for (index, d) in durations.enumerated() {
        results += d.value
        if index < durations.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("animation-duration", results)
}

public func animationDuration(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("animation-duration", value.rawValue)
}

public func animationDuration(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("animation-duration", value)
}

// animation-timing-function = <easing-function>#
public func animationTimingFunction(_ functions: CSSEasingFunction...) -> CSSStyleDeclaration {
	var results = ""
    for (index, f) in functions.enumerated() {
        results += f.value
        if index < functions.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("animation-timing-function", results)
}

public func animationTimingFunction(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("animation-timing-function", value)
}

// animation-delay = <time>#
public func animationDelay(_ delays: CSSTime...) -> CSSStyleDeclaration {
	var results = ""
    for (index, d) in delays.enumerated() {
        results += d.value
        if index < delays.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("animation-delay", results)
}

public func animationDelay(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("animation-delay", value)
}

// animation-iteration-count = <single-animation-iteration-count>#
public func animationIterationCount(_ counts: CSSSingleAnimationIterationCount...) -> CSSStyleDeclaration {
	var results = ""
    for (index, c) in counts.enumerated() {
        results += c.value
        if index < counts.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("animation-iteration-count", results)
}

public func animationIterationCount(_ value: CSSKeyword.Infinite) -> CSSStyleDeclaration {
	CSSStyleDeclaration("animation-iteration-count", value.rawValue)
}

public func animationIterationCount(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("animation-iteration-count", value)
}

// animation-direction = <single-animation-direction>#
public func animationDirection(_ directions: CSSSingleAnimationDirection...) -> CSSStyleDeclaration {
	var results = ""
    for (index, d) in directions.enumerated() {
        results += d.rawValue
        if index < directions.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("animation-direction", results)
}

public func animationDirection(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("animation-direction", value)
}

// animation-fill-mode = <single-animation-fill-mode>#
public func animationFillMode(_ modes: CSSSingleAnimationFillMode...) -> CSSStyleDeclaration {
	var results = ""
    for (index, m) in modes.enumerated() {
        results += m.rawValue
        if index < modes.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("animation-fill-mode", results)
}

public func animationFillMode(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("animation-fill-mode", value)
}

// animation-play-state = <single-animation-play-state>#
public func animationPlayState(_ states: CSSSingleAnimationPlayState...) -> CSSStyleDeclaration {
	var results = ""
    for (index, s) in states.enumerated() {
        results += s.rawValue
        if index < states.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("animation-play-state", results)
}

public func animationPlayState(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("animation-play-state", value)
}
public func backfaceVisibility(_ value: CSSBackfaceVisibility) -> CSSStyleDeclaration {
	CSSStyleDeclaration("backface-visibility", value.rawValue)
}
public func backfaceVisibility(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("backface-visibility", value)
}
// Single value
public func transformOrigin(_ value: CSSTransformOrigin.Horizontal) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transform-origin", value.rawValue)
}

public func transformOrigin(_ value: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transform-origin", value.rawValue)
}


public func transformOrigin(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("transform-origin", value.value) }
public func transformOrigin(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("transform-origin", value.value) }
public func transformOrigin(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("transform-origin", value.value) }

// Two values
public func transformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration {
	CSSStyleDeclaration("transform-origin", "\(x.rawValue) \(y.rawValue)")
}
public func transformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("transform-origin", "\(x.rawValue) \(y.value)") }
public func transformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("transform-origin", "\(x.rawValue) \(y.value)") }
public func transformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("transform-origin", "\(x.rawValue) \(y.value)") }

public func transformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration { CSSStyleDeclaration("transform-origin", "\(x.value) \(y.rawValue)") }
public func transformOrigin(_ x: Percentage, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration { CSSStyleDeclaration("transform-origin", "\(x.value) \(y.rawValue)") }
public func transformOrigin(_ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration { CSSStyleDeclaration("transform-origin", "\(x.value) \(y.rawValue)") }

public func transformOrigin(_ x: Length, _ y: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("transform-origin", "\(x.value) \(y.value)") }
public func transformOrigin(_ x: Percentage, _ y: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("transform-origin", "\(x.value) \(y.value)") }
public func transformOrigin(_ x: LengthPercentage, _ y: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("transform-origin", "\(x.value) \(y.value)") }

// Three values
public func transformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("transform-origin", "\(x.value) \(y.value) \(z.value)") }
public func transformOrigin(_ x: LengthPercentage, _ y: LengthPercentage, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("transform-origin", "\(x.value) \(y.value) \(z.value)") }


// MARK: - Independent Transform Properties

public func scale(_ value: Double) -> CSSStyleDeclaration {
	CSSStyleDeclaration("scale", doubleToString(value))
}

public func scale(_ x: Double, _ y: Double) -> CSSStyleDeclaration {
	CSSStyleDeclaration("scale", "\(doubleToString(x)) \(doubleToString(y))")
}

public func scale(_ x: Double, _ y: Double, _ z: Double) -> CSSStyleDeclaration {
	CSSStyleDeclaration("scale", "\(doubleToString(x)) \(doubleToString(y)) \(doubleToString(z))")
}

public func rotate(_ angle: CSSAngle) -> CSSStyleDeclaration {
	CSSStyleDeclaration("rotate", angle.value)
}

public func translate(_ x: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("translate", x.value) }
public func translate(_ x: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("translate", x.value) }
public func translate(_ x: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("translate", x.value) }

public func translate(_ x: Length, _ y: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("translate", "\(x.value) \(y.value)") }
public func translate(_ x: LengthPercentage, _ y: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("translate", "\(x.value) \(y.value)") }

public func translate(_ x: Length, _ y: Length, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("translate", "\(x.value) \(y.value) \(z.value)") }
public func translate(_ x: LengthPercentage, _ y: LengthPercentage, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("translate", "\(x.value) \(y.value) \(z.value)") }

public func visibility(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("visibility", value)
}
public func visibility(_ value: CSSKeyword.Visibility) -> CSSStyleDeclaration {
	CSSStyleDeclaration("visibility", value.rawValue)
}
@_disfavoredOverload
public func stopColor(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stop-color", value)
}
public func stopColor(_ value: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stop-color", value.value)
}
@_disfavoredOverload
public func stopOpacity(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stop-opacity", value)
}
@_disfavoredOverload
public func stopOpacity(_ value: Double) -> CSSStyleDeclaration {
	CSSStyleDeclaration("stop-opacity", doubleToString(value))
}
public func gridTemplateRows(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("grid-template-rows", value)
}
public func gridTemplateRows(_ values: Length...) -> CSSStyleDeclaration {
    CSSStyleDeclaration("grid-template-rows", values.map { $0.value }.joinedString(separator: " "))
}
public func gridTemplateRows(_ values: Percentage...) -> CSSStyleDeclaration {
    CSSStyleDeclaration("grid-template-rows", values.map { $0.value }.joinedString(separator: " "))
}
public func gridTemplateRows(_ values: LengthPercentage...) -> CSSStyleDeclaration {
    CSSStyleDeclaration("grid-template-rows", values.map { $0.value }.joinedString(separator: " "))
}
public func gridTemplateColumns(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("grid-template-columns", value)
}
public func gridTemplateColumns(_ values: Length...) -> CSSStyleDeclaration {
    CSSStyleDeclaration("grid-template-columns", values.map { $0.value }.joinedString(separator: " "))
}
public func gridTemplateColumns(_ values: Percentage...) -> CSSStyleDeclaration {
    CSSStyleDeclaration("grid-template-columns", values.map { $0.value }.joinedString(separator: " "))
}
public func gridTemplateColumns(_ values: LengthPercentage...) -> CSSStyleDeclaration {
    CSSStyleDeclaration("grid-template-columns", values.map { $0.value }.joinedString(separator: " "))
}
public func accentColor(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("accent-color", value)
}
public func accentColor(_ value: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("accent-color", value.value)
}
public func resize(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("resize", value)
}
public func resize(_ value: CSSResize) -> CSSStyleDeclaration {
	CSSStyleDeclaration("resize", value.rawValue)
}
public func resize(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("resize", value.rawValue)
}
public func clip(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("clip", value)
}
public func backgroundBlendMode(_ value: CSSBlendMode) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-blend-mode", value.value)
}
public func backgroundBlendMode(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("background-blend-mode", value)
}
public func mixBlendMode(_ value: CSSBlendMode) -> CSSStyleDeclaration {
	CSSStyleDeclaration("mix-blend-mode", value.value)
}
public func mixBlendMode(_ value: CSSMixBlendMode) -> CSSStyleDeclaration {
	CSSStyleDeclaration("mix-blend-mode", value.rawValue)
}
public func textSizeAdjust(_ value: CSSTextSizeAdjust) -> CSSStyleDeclaration {
	CSSStyleDeclaration("text-size-adjust", value.rawValue)
}
public func textSizeAdjust(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("text-size-adjust", value.rawValue)
}
public func userSelect(_ value: CSSUserSelect) -> CSSStyleDeclaration {
	CSSStyleDeclaration("user-select", value.rawValue)
}
public func userSelect(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("user-select", value.rawValue)
}
public func whiteSpace(_ value: CSSWhiteSpace) -> CSSStyleDeclaration {
	CSSStyleDeclaration("white-space", value.rawValue)
}
public func tabSize(_ value: Int) -> CSSStyleDeclaration {
	CSSStyleDeclaration("tab-size", "\(value)")
}

public func tabSize(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("tab-size", value.value) }
public func tabSize(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("tab-size", value.value) }
public func tabSize(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("tab-size", value.value) }

public func wordBreak(_ value: CSSWordBreak) -> CSSStyleDeclaration {
    CSSStyleDeclaration("word-break", value.rawValue)
}


public func overflowWrap(_ value: CSSWordWrap) -> CSSStyleDeclaration {
    CSSStyleDeclaration("overflow-wrap", value.rawValue)
}

public func customProperty(_ name: String, _ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value)
}

public func customProperty(_ name: String, _ value: Int) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, "\(value)")
}

public func customProperty(_ name: String, _ value: Double) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, doubleToString(value))
}

public func customProperty(_ name: String, _ value: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSBlendMode) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSMixBlendMode) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSCursor) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSEasingFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSSingleAnimationIterationCount) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSTextDecoration) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSTextOverflow) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSFontFamily) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSFontFamily.GenericFamily.GenericComplete) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSFontFamily.GenericFamily.GenericIncomplete) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSFontFamily.GenericFamily.GenericScriptSpecific) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSFontFamily.GenericFamily) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSBorder.LineStyle) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration(name, value.value) }
public func customProperty(_ name: String, _ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration(name, value.value) }
public func customProperty(_ name: String, _ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration(name, value.value) }

public func customProperty(_ name: String, _ value: CSSKeyword.Length) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSBoxSizing) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSBackgroundSize) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSBackgroundPosition) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSTransformFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSSingleTransitionProperty) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSKeyword.Transparent) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ properties: (CSSSingleTransitionProperty, CSSSingleTransitionProperty, CSSSingleTransitionProperty)) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, "\(properties.0.value), \(properties.1.value), \(properties.2.value)")
}

public func customProperty(_ name: String, _ properties: (CSSSingleTransitionProperty, CSSSingleTransitionProperty, CSSSingleTransitionProperty, CSSSingleTransitionProperty)) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, "\(properties.0.value), \(properties.1.value), \(properties.2.value), \(properties.3.value)")
}


@_disfavoredOverload
public func customProperty(_ name: String, _ boxShadow: (CSSSpreadShadow.BoxShadowPosition, Length, Length, Length, Length)) -> CSSStyleDeclaration {
    CSSStyleDeclaration(name, "\(boxShadow.0.rawValue) \(boxShadow.1.value) \(boxShadow.2.value) \(boxShadow.3.value) \(boxShadow.4.value)")
}
public func customProperty(_ name: String, _ boxShadow: (CSSSpreadShadow.BoxShadowPosition, LengthPercentage, LengthPercentage, LengthPercentage, LengthPercentage)) -> CSSStyleDeclaration {
    CSSStyleDeclaration(name, "\(boxShadow.0.rawValue) \(boxShadow.1.value) \(boxShadow.2.value) \(boxShadow.3.value) \(boxShadow.4.value)")
}

public func customProperty(_ name: String, _ boxShadow: (Length, Length, Length, Length)) -> CSSStyleDeclaration {
    CSSStyleDeclaration(name, "\(boxShadow.0.value) \(boxShadow.1.value) \(boxShadow.2.value) \(boxShadow.3.value)")
}
public func customProperty(_ name: String, _ boxShadow: (LengthPercentage, LengthPercentage, LengthPercentage, LengthPercentage)) -> CSSStyleDeclaration {
    CSSStyleDeclaration(name, "\(boxShadow.0.value) \(boxShadow.1.value) \(boxShadow.2.value) \(boxShadow.3.value)")
}



public func customProperty(_ name: String, _ value: (CSSSpreadShadow, CSSColor)) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, "\(value.0.value) \(value.1.value)")
}

// Two box shadows with colors
public func customProperty(_ name: String, _ value: ((CSSSpreadShadow, CSSColor), (CSSSpreadShadow, CSSColor))) -> CSSStyleDeclaration {
	let shadow1 = "\(value.0.1.value) \(value.0.0.value)"
	let shadow2 = "\(value.1.1.value) \(value.1.0.value)"
	return CSSStyleDeclaration(name, "\(shadow1), \(shadow2)")
}

// Border tuple (width, style, color)

public func customProperty(_ name: String, _ value: (Length, CSSBorder.LineStyle, CSSColor)) -> CSSStyleDeclaration {
    CSSStyleDeclaration(name, "\(value.0.value) \(value.1.value) \(value.2.value)")
}
public func customProperty(_ name: String, _ value: (LengthPercentage, CSSBorder.LineStyle, CSSColor)) -> CSSStyleDeclaration {
    CSSStyleDeclaration(name, "\(value.0.value) \(value.1.value) \(value.2.value)")
}

public func customProperty(_ name: String, _ value: (Length, CSSBorder.LineStyle, CSSKeyword.Transparent)) -> CSSStyleDeclaration {
    CSSStyleDeclaration(name, "\(value.0.value) \(value.1.value) \(value.2.rawValue)")
}
public func customProperty(_ name: String, _ value: (LengthPercentage, CSSBorder.LineStyle, CSSKeyword.Transparent)) -> CSSStyleDeclaration {
    CSSStyleDeclaration(name, "\(value.0.value) \(value.1.value) \(value.2.rawValue)")
}

// Font stacks with GenericComplete
public func customProperty(_ name: String, _ fonts: (String, CSSFontFamily.GenericFamily.GenericComplete)) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, "\(fonts.0), \(fonts.1.rawValue)")
}

public func customProperty(_ name: String, _ fonts: (String, String, CSSFontFamily.GenericFamily.GenericComplete)) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2.rawValue)")
}

public func customProperty(_ name: String, _ fonts: (String, String, String, CSSFontFamily.GenericFamily.GenericComplete)) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3.rawValue)")
}

public func customProperty(_ name: String, _ fonts: (String, String, String, String, CSSFontFamily.GenericFamily.GenericComplete)) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4.rawValue)")
}

public func customProperty(_ name: String, _ fonts: (String, String, String, String, String, CSSFontFamily.GenericFamily.GenericComplete)) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4), \(fonts.5.rawValue)")
}

public func customProperty(_ name: String, _ fonts: (String, String, String, String, String, String, CSSFontFamily.GenericFamily.GenericComplete)) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4), \(fonts.5), \(fonts.6.rawValue)")
}

public func customProperty(_ name: String, _ fonts: (String, String, String, String, String, String, String, CSSFontFamily.GenericFamily.GenericComplete)) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4), \(fonts.5), \(fonts.6), \(fonts.7.rawValue)")
}

// Font stacks with GenericIncomplete + CSSFontFamily
public func customProperty(_ name: String, _ fonts: (String, CSSFontFamily.GenericFamily.GenericIncomplete, CSSFontFamily)) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, "\(fonts.0), \(fonts.1.rawValue), \(fonts.2.value)")
}

// Font stacks with just GenericIncomplete + CSSFontFamily (no initial string)
public func customProperty(_ name: String, _ fonts: (CSSFontFamily.GenericFamily.GenericIncomplete, CSSFontFamily)) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, "\(fonts.0.rawValue), \(fonts.1.value)")
}

// Font stacks with String + CSSFontFamily
public func customProperty(_ name: String, _ fonts: (String, CSSFontFamily)) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, "\(fonts.0), \(fonts.1.value)")
}

@available(*, deprecated)
public func property(_ name: String, _ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration(name, value)
}

// Vendor-prefixed properties following CSSBuilder pattern

// MARK: - Appearance
public func webkitAppearance(_ value: CSSAppearance) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-appearance", value.rawValue)
}

public func webkitAppearance(_ value: CSSAppearance.CompatAuto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-appearance", value.rawValue)
}

public func webkitAppearance(_ value: CSSAppearance.CompatSpecial) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-appearance", value.rawValue)
}

public func webkitAppearance(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-appearance", value.rawValue)
}

public func webkitAppearance(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-appearance", value.rawValue)
}


public func mozAppearance(_ value: CSSAppearance) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-appearance", value.rawValue)
}

public func mozAppearance(_ value: CSSAppearance.CompatAuto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-appearance", value.rawValue)
}

public func mozAppearance(_ value: CSSAppearance.CompatSpecial) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-appearance", value.rawValue)
}

public func mozAppearance(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-appearance", value.rawValue)
}

public func mozAppearance(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-appearance", value.rawValue)
}


// MARK: - User Select
public func webkitUserSelect(_ value: CSSUserSelect) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-user-select", value.rawValue)
}

public func mozUserSelect(_ value: CSSUserSelect) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-user-select", value.rawValue)
}

public func msUserSelect(_ value: CSSUserSelect) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-user-select", value.rawValue)
}

// MARK: - Box Sizing
public func webkitBoxSizing(_ value: CSSBoxSizing) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-box-sizing", value.value)
}

public func mozBoxSizing(_ value: CSSBoxSizing) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-box-sizing", value.value)
}

// MARK: - Transform
public func webkitTransform(_ value: CSSTransformFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-transform", value.value)
}


public func mozTransform(_ value: CSSTransformFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-transform", value.value)
}


public func msTransform(_ value: CSSTransformFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-transform", value.value)
}


public func oTransform(_ value: CSSTransformFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-transform", value.value)
}


// MARK: - Transform Origin
// Webkit - Single value
public func webkitTransformOrigin(_ value: CSSTransformOrigin.Horizontal) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-transform-origin", value.rawValue)
}

public func webkitTransformOrigin(_ value: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-transform-origin", value.rawValue)
}


public func webkitTransformOrigin(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", value.value) }
public func webkitTransformOrigin(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", value.value) }
public func webkitTransformOrigin(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", value.value) }

public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.value)") }
public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.value)") }
public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.value)") }

public func webkitTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.value) \(y.rawValue)") }
public func webkitTransformOrigin(_ x: Percentage, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.value) \(y.rawValue)") }
public func webkitTransformOrigin(_ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.value) \(y.rawValue)") }

public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)") }
public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)") }
public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)") }

public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }
public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }

public func webkitTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }
public func webkitTransformOrigin(_ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }

public func webkitTransformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.value) \(y.value) \(z.value)") }
public func webkitTransformOrigin(_ x: LengthPercentage, _ y: LengthPercentage, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-transform-origin", "\(x.value) \(y.value) \(z.value)") }


// Mozilla - Single value
public func mozTransformOrigin(_ value: CSSTransformOrigin.Horizontal) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-transform-origin", value.rawValue)
}

public func mozTransformOrigin(_ value: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-transform-origin", value.rawValue)
}


public func mozTransformOrigin(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", value.value) }
public func mozTransformOrigin(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", value.value) }
public func mozTransformOrigin(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", value.value) }

public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.value)") }
public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.value)") }
public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.value)") }

public func mozTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.value) \(y.rawValue)") }
public func mozTransformOrigin(_ x: Percentage, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.value) \(y.rawValue)") }
public func mozTransformOrigin(_ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.value) \(y.rawValue)") }

public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)") }
public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)") }
public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)") }

public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }
public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }

public func mozTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }
public func mozTransformOrigin(_ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }

public func mozTransformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.value) \(y.value) \(z.value)") }
public func mozTransformOrigin(_ x: LengthPercentage, _ y: LengthPercentage, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-transform-origin", "\(x.value) \(y.value) \(z.value)") }


// Microsoft - Single value
public func msTransformOrigin(_ value: CSSTransformOrigin.Horizontal) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-transform-origin", value.rawValue)
}

public func msTransformOrigin(_ value: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-transform-origin", value.rawValue)
}


public func msTransformOrigin(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", value.value) }
public func msTransformOrigin(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", value.value) }
public func msTransformOrigin(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", value.value) }

public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.value)") }
public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.value)") }
public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.value)") }

public func msTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.value) \(y.rawValue)") }
public func msTransformOrigin(_ x: Percentage, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.value) \(y.rawValue)") }
public func msTransformOrigin(_ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.value) \(y.rawValue)") }

public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)") }
public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)") }
public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)") }

public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }
public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }

public func msTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }
public func msTransformOrigin(_ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }

public func msTransformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.value) \(y.value) \(z.value)") }
public func msTransformOrigin(_ x: LengthPercentage, _ y: LengthPercentage, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-transform-origin", "\(x.value) \(y.value) \(z.value)") }


// Opera - Single value
public func oTransformOrigin(_ value: CSSTransformOrigin.Horizontal) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-transform-origin", value.rawValue)
}

public func oTransformOrigin(_ value: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-transform-origin", value.rawValue)
}


public func oTransformOrigin(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", value.value) }
public func oTransformOrigin(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", value.value) }
public func oTransformOrigin(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", value.value) }

public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", "\(x.rawValue) \(y.value)") }
public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", "\(x.rawValue) \(y.value)") }

public func oTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", "\(x.value) \(y.rawValue)") }
public func oTransformOrigin(_ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", "\(x.value) \(y.rawValue)") }

public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)") }
public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)") }

public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }
public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: LengthPercentage, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", "\(x.rawValue) \(y.value) \(z.value)") }

public func oTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }
public func oTransformOrigin(_ x: LengthPercentage, _ y: CSSTransformOrigin.Vertical, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", "\(x.value) \(y.rawValue) \(z.value)") }

public func oTransformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", "\(x.value) \(y.value) \(z.value)") }
public func oTransformOrigin(_ x: LengthPercentage, _ y: LengthPercentage, _ z: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-transform-origin", "\(x.value) \(y.value) \(z.value)") }


// MARK: - Transform Style
public func webkitTransformStyle(_ value: CSSTransformStyle) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-transform-style", value.rawValue)
}


public func mozTransformStyle(_ value: CSSTransformStyle) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-transform-style", value.rawValue)
}


public func msTransformStyle(_ value: CSSTransformStyle) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-transform-style", value.rawValue)
}


public func oTransformStyle(_ value: CSSTransformStyle) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-transform-style", value.rawValue)
}


// MARK: - Transition
public func webkitTransition(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-transition", value)
}

public func mozTransition(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-transition", value)
}

public func msTransition(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-transition", value)
}

public func oTransition(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-transition", value)
}

// MARK: - Transition Delay
public func webkitTransitionDelay(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-transition-delay", value.value)
}


public func mozTransitionDelay(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-transition-delay", value.value)
}


public func msTransitionDelay(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-transition-delay", value.value)
}


public func oTransitionDelay(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-transition-delay", value.value)
}


// MARK: - Transition Duration
public func webkitTransitionDuration(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-transition-duration", value.value)
}


public func mozTransitionDuration(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-transition-duration", value.value)
}


public func msTransitionDuration(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-transition-duration", value.value)
}


public func oTransitionDuration(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-transition-duration", value.value)
}


// MARK: - Transition Property
public func webkitTransitionProperty(_ properties: CSSSingleTransitionProperty...) -> CSSStyleDeclaration {
	var results = ""
    for (index, p) in properties.enumerated() {
        results += p.value
        if index < properties.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("-webkit-transition-property", results)
}


public func mozTransitionProperty(_ properties: CSSSingleTransitionProperty...) -> CSSStyleDeclaration {
	var results = ""
    for (index, p) in properties.enumerated() {
        results += p.value
        if index < properties.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("-moz-transition-property", results)
}


public func msTransitionProperty(_ properties: CSSSingleTransitionProperty...) -> CSSStyleDeclaration {
	var results = ""
    for (index, p) in properties.enumerated() {
        results += p.value
        if index < properties.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("-ms-transition-property", results)
}


public func oTransitionProperty(_ properties: CSSSingleTransitionProperty...) -> CSSStyleDeclaration {
	var results = ""
    for (index, p) in properties.enumerated() {
        results += p.value
        if index < properties.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("-o-transition-property", results)
}


// MARK: - Transition Timing Function
public func webkitTransitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSStyleDeclaration {
	var results = ""
    for (index, f) in functions.enumerated() {
        results += f.value
        if index < functions.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("-webkit-transition-timing-function", results)
}


public func mozTransitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSStyleDeclaration {
	var results = ""
    for (index, f) in functions.enumerated() {
        results += f.value
        if index < functions.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("-moz-transition-timing-function", results)
}


public func msTransitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSStyleDeclaration {
	var results = ""
    for (index, f) in functions.enumerated() {
        results += f.value
        if index < functions.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("-ms-transition-timing-function", results)
}


public func oTransitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSStyleDeclaration {
	var results = ""
    for (index, f) in functions.enumerated() {
        results += f.value
        if index < functions.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("-o-transition-timing-function", results)
}


// MARK: - Animation
public func webkitAnimation(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation", value)
}

// Convenience overloads for webkit
public func webkitAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ iterationCount: CSSSingleAnimationIterationCount) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)")
}

public func webkitAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func webkitAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func webkitAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation", "\(duration.value) \(easingFunction.value) \(name) \(CSSDashedIdent(timeline).value)")
}

public func mozAnimation(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation", value)
}

// Convenience overloads for moz
public func mozAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ iterationCount: CSSSingleAnimationIterationCount) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)")
}

public func mozAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func mozAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func mozAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation", "\(duration.value) \(easingFunction.value) \(name) \(CSSDashedIdent(timeline).value)")
}

public func msAnimation(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation", value)
}

// Convenience overloads for ms
public func msAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ iterationCount: CSSSingleAnimationIterationCount) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)")
}

public func msAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func msAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func msAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation", "\(duration.value) \(easingFunction.value) \(name) \(CSSDashedIdent(timeline).value)")
}

public func oAnimation(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation", value)
}

// Convenience overloads for o
public func oAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ iterationCount: CSSSingleAnimationIterationCount) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)")
}

public func oAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func oAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func oAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation", "\(duration.value) \(easingFunction.value) \(name) \(CSSDashedIdent(timeline).value)")
}

// MARK: - Animation Delay
public func webkitAnimationDelay(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation-delay", value.value)
}

public func webkitAnimationDelay(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation-delay", value)
}

public func mozAnimationDelay(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation-delay", value.value)
}

public func mozAnimationDelay(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation-delay", value)
}

public func msAnimationDelay(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation-delay", value.value)
}

public func msAnimationDelay(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation-delay", value)
}

public func oAnimationDelay(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation-delay", value.value)
}

public func oAnimationDelay(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation-delay", value)
}

// MARK: - Animation Direction
public func webkitAnimationDirection(_ value: CSSSingleAnimationDirection) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation-direction", value.rawValue)
}

public func webkitAnimationDirection(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation-direction", value)
}

public func mozAnimationDirection(_ value: CSSSingleAnimationDirection) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation-direction", value.rawValue)
}

public func mozAnimationDirection(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation-direction", value)
}

public func msAnimationDirection(_ value: CSSSingleAnimationDirection) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation-direction", value.rawValue)
}

public func msAnimationDirection(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation-direction", value)
}

public func oAnimationDirection(_ value: CSSSingleAnimationDirection) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation-direction", value.rawValue)
}

public func oAnimationDirection(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation-direction", value)
}

// MARK: - Animation Duration
public func webkitAnimationDuration(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation-duration", value.value)
}

public func webkitAnimationDuration(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation-duration", value)
}

public func mozAnimationDuration(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation-duration", value.value)
}

public func mozAnimationDuration(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation-duration", value)
}

public func msAnimationDuration(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation-duration", value.value)
}

public func msAnimationDuration(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation-duration", value)
}

public func oAnimationDuration(_ value: CSSTime) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation-duration", value.value)
}

public func oAnimationDuration(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation-duration", value)
}

// MARK: - Animation Fill Mode
public func webkitAnimationFillMode(_ value: CSSSingleAnimationFillMode) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation-fill-mode", value.rawValue)
}


public func mozAnimationFillMode(_ value: CSSSingleAnimationFillMode) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation-fill-mode", value.rawValue)
}


public func msAnimationFillMode(_ value: CSSSingleAnimationFillMode) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation-fill-mode", value.rawValue)
}


public func oAnimationFillMode(_ value: CSSSingleAnimationFillMode) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation-fill-mode", value.rawValue)
}


// MARK: - Animation Iteration Count
public func webkitAnimationIterationCount(_ value: CSSSingleAnimationIterationCount) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation-iteration-count", value.value)
}

public func webkitAnimationIterationCount(_ value: CSSKeyword.Infinite) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation-iteration-count", value.rawValue)
}


public func mozAnimationIterationCount(_ value: CSSSingleAnimationIterationCount) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation-iteration-count", value.value)
}

public func mozAnimationIterationCount(_ value: CSSKeyword.Infinite) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation-iteration-count", value.rawValue)
}


public func msAnimationIterationCount(_ value: CSSSingleAnimationIterationCount) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation-iteration-count", value.value)
}

public func msAnimationIterationCount(_ value: CSSKeyword.Infinite) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation-iteration-count", value.rawValue)
}


public func oAnimationIterationCount(_ value: CSSSingleAnimationIterationCount) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation-iteration-count", value.value)
}

public func oAnimationIterationCount(_ value: CSSKeyword.Infinite) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation-iteration-count", value.rawValue)
}


// MARK: - Animation Name
public func webkitAnimationName(_ value: CSSKeyframesName) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation-name", value.value)
}


public func webkitAnimationName(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation-name", value.rawValue)
}

public func mozAnimationName(_ value: CSSKeyframesName) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation-name", value.value)
}


public func mozAnimationName(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation-name", value.rawValue)
}

public func msAnimationName(_ value: CSSKeyframesName) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation-name", value.value)
}


public func msAnimationName(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation-name", value.rawValue)
}

public func oAnimationName(_ value: CSSKeyframesName) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation-name", value.value)
}


public func oAnimationName(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation-name", value.rawValue)
}

// MARK: - Animation Play State
public func webkitAnimationPlayState(_ value: CSSSingleAnimationPlayState) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation-play-state", value.rawValue)
}


public func mozAnimationPlayState(_ value: CSSSingleAnimationPlayState) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation-play-state", value.rawValue)
}


public func msAnimationPlayState(_ value: CSSSingleAnimationPlayState) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation-play-state", value.rawValue)
}


public func oAnimationPlayState(_ value: CSSSingleAnimationPlayState) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation-play-state", value.rawValue)
}


// MARK: - Animation Timing Function
public func webkitAnimationTimingFunction(_ value: CSSEasingFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-animation-timing-function", value.value)
}


public func mozAnimationTimingFunction(_ value: CSSEasingFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-animation-timing-function", value.value)
}


public func msAnimationTimingFunction(_ value: CSSEasingFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-animation-timing-function", value.value)
}


public func oAnimationTimingFunction(_ value: CSSEasingFunction) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-animation-timing-function", value.value)
}


// MARK: - Backface Visibility
public func webkitBackfaceVisibility(_ value: CSSBackfaceVisibility) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-backface-visibility", value.rawValue)
}

public func webkitBackfaceVisibility(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-backface-visibility", value)
}

public func mozBackfaceVisibility(_ value: CSSBackfaceVisibility) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-backface-visibility", value.rawValue)
}

public func mozBackfaceVisibility(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-backface-visibility", value)
}

public func msBackfaceVisibility(_ value: CSSBackfaceVisibility) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-backface-visibility", value.rawValue)
}

public func msBackfaceVisibility(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-backface-visibility", value)
}

public func oBackfaceVisibility(_ value: CSSBackfaceVisibility) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-backface-visibility", value.rawValue)
}

public func oBackfaceVisibility(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-backface-visibility", value)
}

// MARK: - Perspective
public func webkitPerspective(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-perspective", value.value) }
public func webkitPerspective(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-perspective", value.value) }
public func webkitPerspective(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-perspective", value.value) }

public func mozPerspective(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-perspective", value.value) }
public func mozPerspective(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-perspective", value.value) }
public func mozPerspective(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-perspective", value.value) }

public func msPerspective(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-perspective", value.value) }
public func msPerspective(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-perspective", value.value) }
public func msPerspective(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-perspective", value.value) }

public func oPerspective(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-perspective", value.value) }
public func oPerspective(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-perspective", value.value) }
public func oPerspective(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-perspective", value.value) }

public func oPerspective(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-o-perspective", value.rawValue)
}


// MARK: - Perspective Origin
public func webkitPerspectiveOrigin(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-perspective-origin", value.value) }
public func webkitPerspectiveOrigin(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-perspective-origin", value.value) }
public func webkitPerspectiveOrigin(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-perspective-origin", value.value) }

public func mozPerspectiveOrigin(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-perspective-origin", value.value) }
public func mozPerspectiveOrigin(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-perspective-origin", value.value) }
public func mozPerspectiveOrigin(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-perspective-origin", value.value) }

public func msPerspectiveOrigin(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-perspective-origin", value.value) }
public func msPerspectiveOrigin(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-perspective-origin", value.value) }
public func msPerspectiveOrigin(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-perspective-origin", value.value) }

public func oPerspectiveOrigin(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-perspective-origin", value.value) }
public func oPerspectiveOrigin(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-perspective-origin", value.value) }
public func oPerspectiveOrigin(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-o-perspective-origin", value.value) }



// MARK: - Border Radius
public func webkitBorderRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-radius", value.value) }
public func webkitBorderRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-radius", value.value) }
public func webkitBorderRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-radius", value.value) }

public func mozBorderRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-radius", value.value) }
public func mozBorderRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-radius", value.value) }
public func mozBorderRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-radius", value.value) }

public func webkitBorderTopLeftRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-top-left-radius", value.value) }
public func webkitBorderTopLeftRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-top-left-radius", value.value) }
public func webkitBorderTopLeftRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-top-left-radius", value.value) }

public func mozBorderTopLeftRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-top-left-radius", value.value) }
public func mozBorderTopLeftRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-top-left-radius", value.value) }
public func mozBorderTopLeftRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-top-left-radius", value.value) }

public func webkitBorderTopRightRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-top-right-radius", value.value) }
public func webkitBorderTopRightRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-top-right-radius", value.value) }
public func webkitBorderTopRightRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-top-right-radius", value.value) }

public func mozBorderTopRightRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-top-right-radius", value.value) }
public func mozBorderTopRightRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-top-right-radius", value.value) }
public func mozBorderTopRightRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-top-right-radius", value.value) }

public func webkitBorderBottomLeftRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-bottom-left-radius", value.value) }
public func webkitBorderBottomLeftRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-bottom-left-radius", value.value) }
public func webkitBorderBottomLeftRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-bottom-left-radius", value.value) }

public func mozBorderBottomLeftRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-bottom-left-radius", value.value) }
public func mozBorderBottomLeftRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-bottom-left-radius", value.value) }
public func mozBorderBottomLeftRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-bottom-left-radius", value.value) }

public func webkitBorderBottomRightRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-bottom-right-radius", value.value) }
public func webkitBorderBottomRightRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-bottom-right-radius", value.value) }
public func webkitBorderBottomRightRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-webkit-border-bottom-right-radius", value.value) }

public func mozBorderBottomRightRadius(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-bottom-right-radius", value.value) }
public func mozBorderBottomRightRadius(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-bottom-right-radius", value.value) }
public func mozBorderBottomRightRadius(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-moz-border-bottom-right-radius", value.value) }

public func mozBorderBottomRightRadius(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-border-bottom-right-radius", value)
}

// MARK: - Box Shadow
public func webkitBoxShadow(_ shadows: CSSSpreadShadow...) -> CSSStyleDeclaration {
	var results = ""
    for (index, s) in shadows.enumerated() {
        results += s.value
        if index < shadows.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("-webkit-box-shadow", results)
}

public func webkitBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length, _ position: CSSSpreadShadow.BoxShadowPosition) -> CSSStyleDeclaration {
	webkitBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread),
		position: position
	))
}
public func webkitBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-webkit-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value) \(spread.value)")
}
public func webkitBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage, _ b: LengthPercentage, _ s: LengthPercentage) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-webkit-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value) \(s.value)")
}

public func webkitBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-webkit-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value)")
}
public func webkitBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage, _ b: LengthPercentage) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-webkit-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value)")
}

public func webkitBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-webkit-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value)")
}
public func webkitBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-webkit-box-shadow", "\(color.value) \(oX.value) \(oY.value)")
}

public func webkitBoxShadow(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-box-shadow", value)
}

public func webkitBoxShadow(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-box-shadow", value.rawValue)
}

public func mozBoxShadow(_ shadows: CSSSpreadShadow...) -> CSSStyleDeclaration {
	var results = ""
    for (index, s) in shadows.enumerated() {
        results += s.value
        if index < shadows.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("-moz-box-shadow", results)
}

public func mozBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length, _ position: CSSSpreadShadow.BoxShadowPosition) -> CSSStyleDeclaration {
	mozBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread),
		position: position
	))
}
public func mozBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-moz-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value) \(spread.value)")
}
public func mozBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage, _ b: LengthPercentage, _ s: LengthPercentage) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-moz-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value) \(s.value)")
}

public func mozBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-moz-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value)")
}
public func mozBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage, _ b: LengthPercentage) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-moz-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value)")
}

public func mozBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-moz-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value)")
}
public func mozBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-moz-box-shadow", "\(color.value) \(oX.value) \(oY.value)")
}

public func mozBoxShadow(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-box-shadow", value)
}

public func mozBoxShadow(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-box-shadow", value.rawValue)
}

public func msBoxShadow(_ shadows: CSSSpreadShadow...) -> CSSStyleDeclaration {
	var results = ""
    for (index, s) in shadows.enumerated() {
        results += s.value
        if index < shadows.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("-ms-box-shadow", results)
}

public func msBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length, _ position: CSSSpreadShadow.BoxShadowPosition) -> CSSStyleDeclaration {
	msBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread),
		position: position
	))
}
public func msBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-ms-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value) \(spread.value)")
}
public func msBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage, _ b: LengthPercentage, _ s: LengthPercentage) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-ms-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value) \(s.value)")
}

public func msBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-ms-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value) \(blur.value)")
}
public func msBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage, _ b: LengthPercentage) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-ms-box-shadow", "\(color.value) \(oX.value) \(oY.value) \(b.value)")
}

public func msBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-ms-box-shadow", "\(color.value) \(offsetX.value) \(offsetY.value)")
}
public func msBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ oX: LengthPercentage, _ oY: LengthPercentage) -> CSSStyleDeclaration {
    CSSStyleDeclaration("-ms-box-shadow", "\(color.value) \(oX.value) \(oY.value)")
}

public func msBoxShadow(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-box-shadow", value)
}

public func msBoxShadow(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-box-shadow", value.rawValue)
}

// MARK: - Filter
// filter = none | <filter-value-list>
public func filter(_ functions: CSSFilterFunction...) -> CSSStyleDeclaration {
	var results = ""
    for (index, f) in functions.enumerated() {
        results += f.value
        if index < functions.count - 1 {
            results += " "
        }
    }
	return CSSStyleDeclaration("filter", results)
}

public func filter(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("filter", value)
}

public func filter(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("filter", value.rawValue)
}

public func webkitFilter(_ functions: CSSFilterFunction...) -> CSSStyleDeclaration {
	var results = ""
    for (index, f) in functions.enumerated() {
        results += f.value
        if index < functions.count - 1 {
            results += " "
        }
    }
	return CSSStyleDeclaration("-webkit-filter", results)
}

public func webkitFilter(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-filter", value)
}

public func msFilter(_ functions: CSSFilterFunction...) -> CSSStyleDeclaration {
	var results = ""
    for (index, f) in functions.enumerated() {
        results += f.value
        if index < functions.count - 1 {
            results += " "
        }
    }
	return CSSStyleDeclaration("-ms-filter", results)
}

public func msFilter(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-filter", value)
}

// MARK: - Backdrop Filter
public func backdropFilter(_ functions: CSSFilterFunction...) -> CSSStyleDeclaration {
	var results = ""
    for (index, f) in functions.enumerated() {
        results += f.value
        if index < functions.count - 1 {
            results += " "
        }
    }
	return CSSStyleDeclaration("backdrop-filter", results)
}

public func backdropFilter(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("backdrop-filter", value)
}

public func backdropFilter(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("backdrop-filter", value.rawValue)
}

public func webkitBackdropFilter(_ functions: CSSFilterFunction...) -> CSSStyleDeclaration {
	var results = ""
    for (index, f) in functions.enumerated() {
        results += f.value
        if index < functions.count - 1 {
            results += " "
        }
    }
	return CSSStyleDeclaration("-webkit-backdrop-filter", results)
}

public func webkitBackdropFilter(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-backdrop-filter", value)
}

// MARK: - Mask
// mask = <mask-layer>#
public func mask(_ layers: CSSMaskLayer...) -> CSSStyleDeclaration {
	var results = ""
    for (index, l) in layers.enumerated() {
        results += l.value
        if index < layers.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("mask", results)
}

public func mask(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("mask", value)
}

public func mask(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("mask", value.rawValue)
}

public func webkitMask(_ layers: CSSMaskLayer...) -> CSSStyleDeclaration {
	var results = ""
    for (index, l) in layers.enumerated() {
        results += l.value
        if index < layers.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("-webkit-mask", results)
}

// Convenience: webkitMask(url, position, size, repeat) - all double
public func webkitMask(
	_ reference: CSSMaskLayer.MaskReference,
	_ position: (CSSMaskLayer.Position.PositionOne.PositionKeyword, CSSMaskLayer.Position.PositionOne.PositionKeyword),
	_ size: (Length, Length),
	_ repeatStyle: (CSSMaskLayer.RepeatStyle.Repetition, CSSMaskLayer.RepeatStyle.Repetition)
) -> CSSStyleDeclaration {
	let pos1 = CSSMaskLayer.Position.PositionOne.keyword(position.0)
	let pos2 = CSSMaskLayer.Position.PositionOne.keyword(position.1)
	let posTwo = CSSMaskLayer.Position.PositionTwo(pos1, pos2)
	return webkitMask(CSSMaskLayer(
		reference: reference,
		position: .two(posTwo),
		size: .twoLengths(size.0, size.1),
		repeatStyle: .repetition(repeatStyle.0, repeatStyle.1)
	))
}

// Convenience: webkitMask(url, position, size, repeat) - single repeat
public func webkitMask(
	_ reference: CSSMaskLayer.MaskReference,
	_ position: (CSSMaskLayer.Position.PositionOne.PositionKeyword, CSSMaskLayer.Position.PositionOne.PositionKeyword),
	_ size: (Length, Length),
	_ repeatStyle: CSSMaskLayer.RepeatStyle.Repetition
) -> CSSStyleDeclaration {
	let pos1 = CSSMaskLayer.Position.PositionOne.keyword(position.0)
	let pos2 = CSSMaskLayer.Position.PositionOne.keyword(position.1)
	let posTwo = CSSMaskLayer.Position.PositionTwo(pos1, pos2)
	return webkitMask(CSSMaskLayer(
		reference: reference,
		position: .two(posTwo),
		size: .twoLengths(size.0, size.1),
		repeatStyle: .repetition(repeatStyle, nil)
	))
}

public func webkitMask(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-mask", value)
}

public func webkitMask(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-mask", value.rawValue)
}

// MARK: - Font Smoothing
public func webkitFontSmoothing(_ value: CSSFontSmoothing) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-font-smoothing", value.rawValue)
}
public func webkitFontSmoothing(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-font-smoothing", value.rawValue)
}

public func webkitFontSmoothing(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-font-smoothing", value)
}

public func mozOsxFontSmoothing(_ value: CSSFontSmoothing) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-osx-font-smoothing", value.rawValue)
}

public func mozOsxFontSmoothing(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-moz-osx-font-smoothing", value)
}

// MARK: - Text Size Adjust
public func webkitTextSizeAdjust(_ value: CSSTextSizeAdjust) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-text-size-adjust", value.rawValue)
}

public func webkitTextSizeAdjust(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-text-size-adjust", value)
}

// MARK: - Tap Highlight Color
public func webkitTapHighlightColor(_ color: CSSColor) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-tap-highlight-color", color.value)
}

public func webkitTapHighlightColor(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-tap-highlight-color", value)
}

// MARK: - Touch Callout
public func webkitTouchCallout(_ value: CSSTouchCallout) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-touch-callout", value.rawValue)
}
public func webkitTouchCallout(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-touch-callout", value.rawValue)
}

public func webkitTouchCallout(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-touch-callout", value)
}

// MARK: - Mask Image
// mask-image = <mask-reference>#
public func maskImage(_ references: CSSMaskLayer.MaskReference...) -> CSSStyleDeclaration {
	var results = ""
    for (index, r) in references.enumerated() {
        results += r.value
        if index < references.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("mask-image", results)
}

public func maskImage(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("mask-image", value)
}

public func webkitMaskImage(_ references: CSSMaskLayer.MaskReference...) -> CSSStyleDeclaration {
	var results = ""
    for (index, r) in references.enumerated() {
        results += r.value
        if index < references.count - 1 {
            results += ", "
        }
    }
	return CSSStyleDeclaration("-webkit-mask-image", results)
}

public func webkitMaskImage(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-mask-image", value)
}

public func webkitMaskSize(_ value: CSSMaskSize) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-mask-size", value.rawValue)
}

public func webkitMaskSize(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-mask-size", value)
}

public func webkitMaskRepeat(_ value: CSSMaskRepeat) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-mask-repeat", value.rawValue)
}

public func webkitMaskRepeat(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-mask-repeat", value)
}

public func webkitMaskPosition(_ value: CSSObjectPosition) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-mask-position", value.rawValue)
}

public func webkitMaskPosition(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-mask-position", value)
}

// MARK: - Clip Path
// clip-path = <clip-source> | [ <basic-shape> || <geometry-box> ] | none
public func clipPath(_ value: CSSClipPath) -> CSSStyleDeclaration {
	CSSStyleDeclaration("clip-path", value.value)
}

public func clipPath(_ shape: CSSBasicShape) -> CSSStyleDeclaration {
	CSSStyleDeclaration("clip-path", shape.value)
}

public func clipPath(_ shape: CSSBasicShape, _ box: CSSGeometryBox) -> CSSStyleDeclaration {
	CSSStyleDeclaration("clip-path", "\(shape.value) \(box.rawValue)")
}

public func clipPath(_ box: CSSGeometryBox) -> CSSStyleDeclaration {
	CSSStyleDeclaration("clip-path", box.rawValue)
}

public func clipPath(_ source: CSSClipSource) -> CSSStyleDeclaration {
	CSSStyleDeclaration("clip-path", source.value)
}

public func clipPath(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("clip-path", value)
}

public func clipPath(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("clip-path", value.rawValue)
}

public func webkitClipPath(_ value: CSSClipPath) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-clip-path", value.value)
}

public func webkitClipPath(_ shape: CSSBasicShape) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-clip-path", shape.value)
}

public func webkitClipPath(_ shape: CSSBasicShape, _ box: CSSGeometryBox) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-clip-path", "\(shape.value) \(box.rawValue)")
}

public func webkitClipPath(_ box: CSSGeometryBox) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-clip-path", box.rawValue)
}

public func webkitClipPath(_ source: CSSClipSource) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-clip-path", source.value)
}

public func webkitClipPath(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-clip-path", value)
}

public func webkitClipPath(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-clip-path", value.rawValue)
}

// MARK: - Line Clamp
public func webkitLineClamp(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-line-clamp", value)
}

public func webkitLineClamp(_ value: Int) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-line-clamp", "\(value)")
}

// MARK: - Box Reflect
public func webkitBoxReflect(_ value: CSSBoxReflect) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-box-reflect", value.rawValue)
}

public func webkitBoxReflect(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-webkit-box-reflect", value)
}

// MARK: - Flexbox (MS-specific)
public func msFlexDirection(_ value: CSSFlexDirection) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex-direction", value.rawValue)
}

public func msFlexDirection(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex-direction", value)
}

public func msFlexWrap(_ value: CSSFlexWrap) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex-wrap", value.rawValue)
}

public func msFlexWrap(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex-wrap", value)
}

public func msFlexFlow(_ value: CSSFlexFlow) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex-flow", value.rawValue)
}

public func msFlexFlow(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex-flow", value)
}

public func msFlex(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex", value)
}

public func msFlex(_ value: Int) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex", "\(value)")
}

public func msFlexGrow(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex-grow", value)
}

public func msFlexGrow(_ value: Int) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex-grow", "\(value)")
}

public func msFlexGrow(_ value: Double) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex-grow", "\(value)")
}

public func msFlexShrink(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex-shrink", value)
}

public func msFlexShrink(_ value: Int) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex-shrink", "\(value)")
}

public func msFlexShrink(_ value: Double) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex-shrink", "\(value)")
}

public func msFlexBasis(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-flex-basis", value)
}

public func msFlexBasis(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-flex-basis", value.value) }
public func msFlexBasis(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-flex-basis", value.value) }
public func msFlexBasis(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("-ms-flex-basis", value.value) }

public func msJustifyContent(_ value: CSSJustifyContent) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-justify-content", value.rawValue)
}

public func msJustifyContent(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-justify-content", value)
}

public func msAlignItems(_ value: CSSAlignItems) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-align-items", value.rawValue)
}

public func msAlignItems(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-align-items", value)
}

public func msAlignSelf(_ value: CSSAlignSelf) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-align-self", value.rawValue)
}

public func msAlignSelf(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-align-self", value)
}

public func msAlignContent(_ value: CSSAlignContent) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-align-content", value.rawValue)
}

public func msAlignContent(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-align-content", value)
}

public func msOrder(_ value: Int) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-order", "\(value)")
}

public func msOrder(_ value: String) -> CSSStyleDeclaration {
	CSSStyleDeclaration("-ms-order", value)
}

// MARK: - Writing Mode

public func writingMode(_ value: CSSWritingMode) -> CSSStyleDeclaration {
	CSSStyleDeclaration("writing-mode", value.rawValue)
}

// MARK: - Logical Margin Properties

public func marginBlockStart(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("margin-block-start", value.rawValue)
}
public func marginBlockStart(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block-start", px(value).value) }
public func marginBlockStart(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block-start", px(value).value) }
public func marginBlockStart(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block-start", value.value) }
public func marginBlockStart(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block-start", value.value) }
public func marginBlockStart(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block-start", value.value) }

public func marginBlockEnd(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("margin-block-end", value.rawValue)
}
public func marginBlockEnd(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block-end", px(value).value) }
public func marginBlockEnd(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block-end", px(value).value) }
public func marginBlockEnd(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block-end", value.value) }
public func marginBlockEnd(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block-end", value.value) }
public func marginBlockEnd(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block-end", value.value) }

public func marginInlineStart(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("margin-inline-start", value.rawValue)
}
public func marginInlineStart(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline-start", px(value).value) }
public func marginInlineStart(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline-start", px(value).value) }
public func marginInlineStart(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline-start", value.value) }
public func marginInlineStart(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline-start", value.value) }
public func marginInlineStart(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline-start", value.value) }

public func marginInlineEnd(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("margin-inline-end", value.rawValue)
}
public func marginInlineEnd(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline-end", px(value).value) }
public func marginInlineEnd(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline-end", px(value).value) }
public func marginInlineEnd(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline-end", value.value) }
public func marginInlineEnd(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline-end", value.value) }
public func marginInlineEnd(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline-end", value.value) }

public func marginBlock(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block", px(value).value) }
public func marginBlock(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block", px(value).value) }
public func marginBlock(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block", value.value) }
public func marginBlock(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block", value.value) }
public func marginBlock(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block", value.value) }
public func marginBlock(_ start: Length, _ end: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block", "\(start.value) \(end.value)") }
public func marginBlock(_ start: Percentage, _ end: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block", "\(start.value) \(end.value)") }
public func marginBlock(_ start: LengthPercentage, _ end: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-block", "\(start.value) \(end.value)") }

public func marginInline(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline", px(value).value) }
public func marginInline(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline", px(value).value) }
public func marginInline(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline", value.value) }
public func marginInline(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline", value.value) }
public func marginInline(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline", value.value) }
public func marginInline(_ start: Length, _ end: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline", "\(start.value) \(end.value)") }
public func marginInline(_ start: Percentage, _ end: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline", "\(start.value) \(end.value)") }
public func marginInline(_ start: LengthPercentage, _ end: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("margin-inline", "\(start.value) \(end.value)") }
public func marginInline(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("margin-inline", value.rawValue)
}

// MARK: - Logical Padding Properties
public func paddingBlockStart(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block-start", px(value).value) }
public func paddingBlockStart(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block-start", px(value).value) }
public func paddingBlockStart(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block-start", value.value) }
public func paddingBlockStart(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block-start", value.value) }
public func paddingBlockStart(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block-start", value.value) }

public func paddingBlockEnd(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block-end", px(value).value) }
public func paddingBlockEnd(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block-end", px(value).value) }
public func paddingBlockEnd(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block-end", value.value) }
public func paddingBlockEnd(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block-end", value.value) }
public func paddingBlockEnd(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block-end", value.value) }

public func paddingInlineStart(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline-start", px(value).value) }
public func paddingInlineStart(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline-start", px(value).value) }
public func paddingInlineStart(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline-start", value.value) }
public func paddingInlineStart(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline-start", value.value) }
public func paddingInlineStart(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline-start", value.value) }

public func paddingInlineEnd(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline-end", px(value).value) }
public func paddingInlineEnd(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline-end", px(value).value) }
public func paddingInlineEnd(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline-end", value.value) }
public func paddingInlineEnd(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline-end", value.value) }
public func paddingInlineEnd(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline-end", value.value) }

public func paddingBlock(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block", px(value).value) }
public func paddingBlock(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block", px(value).value) }
public func paddingBlock(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block", value.value) }
public func paddingBlock(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block", value.value) }
public func paddingBlock(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block", value.value) }

public func paddingBlock(_ start: Length, _ end: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block", "\(start.value) \(end.value)") }
public func paddingBlock(_ s: LengthPercentage, _ e: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-block", "\(s.value) \(e.value)") }

public func paddingInline(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline", px(value).value) }
public func paddingInline(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline", px(value).value) }
public func paddingInline(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline", value.value) }
public func paddingInline(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline", value.value) }
public func paddingInline(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline", value.value) }

public func paddingInline(_ start: Length, _ end: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline", "\(start.value) \(end.value)") }
public func paddingInline(_ s: LengthPercentage, _ e: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("padding-inline", "\(s.value) \(e.value)") }

// MARK: - Logical Border Properties
public func borderBlockStart(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-block-start", "\(width.value) \(style.value) \(color.value)") }
public func borderBlockStart(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-block-start", "\(width.value) \(style.value) \(color.value)") }
public func borderBlockStart(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-block-start", "\(width.value) \(style.value) \(color.value)") }
public func borderBlockStart(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-block-start", value.rawValue)
}

public func borderBlockEnd(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-block-end", "\(width.value) \(style.value) \(color.value)") }
public func borderBlockEnd(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-block-end", "\(width.value) \(style.value) \(color.value)") }
public func borderBlockEnd(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-block-end", "\(width.value) \(style.value) \(color.value)") }
public func borderBlockEnd(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-block-end", value.rawValue)
}

public func borderInlineStart(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-inline-start", "\(width.value) \(style.value) \(color.value)") }
public func borderInlineStart(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-inline-start", "\(width.value) \(style.value) \(color.value)") }
public func borderInlineStart(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-inline-start", "\(width.value) \(style.value) \(color.value)") }
public func borderInlineStart(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-inline-start", value.rawValue)
}

public func borderInlineEnd(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-inline-end", "\(width.value) \(style.value) \(color.value)") }
public func borderInlineEnd(_ width: Percentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-inline-end", "\(width.value) \(style.value) \(color.value)") }
public func borderInlineEnd(_ width: LengthPercentage, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSStyleDeclaration { CSSStyleDeclaration("border-inline-end", "\(width.value) \(style.value) \(color.value)") }

public func borderInlineEndWidth(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("border-inline-end-width", value.value) }
public func borderInlineEndWidth(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-inline-end-width", value.value) }
public func borderInlineEndWidth(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("border-inline-end-width", value.value) }

public func borderInlineEnd(_ value: CSSKeyword.None) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-inline-end", value.rawValue)
}

// MARK: - Logical Inset Properties

public func insetBlockStart(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-block-start", px(value).value) }
public func insetBlockStart(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-block-start", px(value).value) }
public func insetBlockStart(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-block-start", value.value) }
public func insetBlockStart(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-block-start", value.value) }
public func insetBlockStart(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-block-start", value.value) }

public func insetBlockEnd(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-block-end", px(value).value) }
public func insetBlockEnd(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-block-end", px(value).value) }
public func insetBlockEnd(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-block-end", value.value) }
public func insetBlockEnd(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-block-end", value.value) }
public func insetBlockEnd(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-block-end", value.value) }

public func insetInlineStart(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-inline-start", px(value).value) }
public func insetInlineStart(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-inline-start", px(value).value) }
public func insetInlineStart(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-inline-start", value.value) }
public func insetInlineStart(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-inline-start", value.value) }
public func insetInlineStart(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-inline-start", value.value) }

public func insetInlineEnd(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-inline-end", px(value).value) }
public func insetInlineEnd(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-inline-end", px(value).value) }
public func insetInlineEnd(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-inline-end", value.value) }
public func insetInlineEnd(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-inline-end", value.value) }
public func insetInlineEnd(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("inset-inline-end", value.value) }

// MARK: - Logical Size Properties
public func inlineSize(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("inline-size", px(value).value) }
public func inlineSize(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("inline-size", px(value).value) }
public func inlineSize(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("inline-size", value.value) }
public func inlineSize(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("inline-size", value.value) }
public func inlineSize(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("inline-size", value.value) }

public func blockSize(_ value: Int) -> CSSStyleDeclaration { CSSStyleDeclaration("block-size", px(value).value) }
public func blockSize(_ value: Double) -> CSSStyleDeclaration { CSSStyleDeclaration("block-size", px(value).value) }
public func blockSize(_ value: Length) -> CSSStyleDeclaration { CSSStyleDeclaration("block-size", value.value) }
public func blockSize(_ value: Percentage) -> CSSStyleDeclaration { CSSStyleDeclaration("block-size", value.value) }
public func blockSize(_ value: LengthPercentage) -> CSSStyleDeclaration { CSSStyleDeclaration("block-size", value.value) }
public func blockSize(_ value: CSSKeyword.Auto) -> CSSStyleDeclaration {
	CSSStyleDeclaration("block-size", value.rawValue)
}

public func borderInlineStartWidth(_ value: Int) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-inline-start-width", "\(value)")
}

public func borderInlineEndWidth(_ value: Int) -> CSSStyleDeclaration {
	CSSStyleDeclaration("border-inline-end-width", "\(value)")
}
