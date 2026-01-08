#if !os(WASI)

import WebTypes

public struct CSSDeclaration: CSS {
	public let property: String
	public let value: String

	public init(_ property: String, _ value: String) {
		self.property = property
		self.value = value
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		return "\(ind)\(property): \(value);"
	}

	public func important() -> CSSDeclaration {
		CSSDeclaration(property, "\(value) !important")
	}
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
	CSSDeclaration("position", String(describing: value.rawValue))
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
public func width(_ value: String) -> CSSDeclaration {
	CSSDeclaration("width", value)
}

public func width(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("width", value.value)
}

public func width(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("width", value.value)
}

public func width(_ value: CSSKeyword.Length) -> CSSDeclaration {
	CSSDeclaration("width", value.rawValue)
}
public func width(_ value: CSSKeyword.Auto) -> CSSDeclaration {
	CSSDeclaration("width", value.rawValue)
}
public func height(_ value: String) -> CSSDeclaration {
	CSSDeclaration("height", value)
}

public func height(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("height", value.value)
}

public func height(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("height", value.value)
}

public func height(_ value: CSSKeyword.Length) -> CSSDeclaration {
	CSSDeclaration("height", value.rawValue)
}
public func height(_ value: CSSKeyword.Auto) -> CSSDeclaration {
	CSSDeclaration("height", value.rawValue)
}
public func padding(_ value: String) -> CSSDeclaration {
	CSSDeclaration("padding", value)
}

public func padding(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("padding", value.value)
}

public func padding(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("padding", value.value)
}

public func padding(_ vertical: Length, _ horizontal: Length) -> CSSDeclaration {
	CSSDeclaration("padding", "\(vertical.value) \(horizontal.value)")
}

public func padding(_ vertical: Length, _ horizontal: Percentage) -> CSSDeclaration {
	CSSDeclaration("padding", "\(vertical.value) \(horizontal.value)")
}

public func padding(_ vertical: Percentage, _ horizontal: Length) -> CSSDeclaration {
	CSSDeclaration("padding", "\(vertical.value) \(horizontal.value)")
}

public func padding(_ vertical: Percentage, _ horizontal: Percentage) -> CSSDeclaration {
	CSSDeclaration("padding", "\(vertical.value) \(horizontal.value)")
}


public func padding(_ top: Length, _ right: Length, _ bottom: Length, _ left: Length) -> CSSDeclaration {
	CSSDeclaration("padding", "\(top.value) \(right.value) \(bottom.value) \(left.value)")
}

public func padding(_ top: Int, _ right: String, _ bottom: Int, _ left: Length) -> CSSDeclaration {
	CSSDeclaration("padding", "\(top) \(right) \(bottom) \(left.value)")
}

public func margin(_ value: String) -> CSSDeclaration {
	CSSDeclaration("margin", value)
}

public func margin(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("margin", value.value)
}

public func margin(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("margin", value.value)
}
public func margin(_ value: CSSKeyword.Auto) -> CSSDeclaration {
	CSSDeclaration("margin", value.rawValue)
}

public func margin(_ vertical: Length, _ horizontal: Length) -> CSSDeclaration {
	CSSDeclaration("margin", "\(vertical.value) \(horizontal.value)")
}

public func margin(_ vertical: Length, _ horizontal: Percentage) -> CSSDeclaration {
	CSSDeclaration("margin", "\(vertical.value) \(horizontal.value)")
}

public func margin(_ vertical: Percentage, _ horizontal: Length) -> CSSDeclaration {
	CSSDeclaration("margin", "\(vertical.value) \(horizontal.value)")
}

public func margin(_ vertical: Percentage, _ horizontal: Percentage) -> CSSDeclaration {
	CSSDeclaration("margin", "\(vertical.value) \(horizontal.value)")
}

public func margin(_ vertical: Length, _ horizontal: CSSKeyword.Auto) -> CSSDeclaration {
	CSSDeclaration("margin", "\(vertical.value) \(horizontal.rawValue)")
}
public func margin(_ vertical: CSSKeyword.Auto, _ horizontal: Length) -> CSSDeclaration {
	CSSDeclaration("margin", "\(vertical.rawValue) \(horizontal.value)")
}
public func margin(_ vertical: CSSKeyword.Auto, _ horizontal: CSSKeyword.Auto) -> CSSDeclaration {
	CSSDeclaration("margin", "\(vertical.rawValue) \(horizontal.rawValue)")
}
public func margin(_ top: Length, _ right: CSSKeyword.Auto, _ bottom: Length, _ left: CSSKeyword.Auto) -> CSSDeclaration {
	CSSDeclaration("margin", "\(top.value) \(right.rawValue) \(bottom.value) \(left.rawValue)")
}

public func margin(_ top: Length, _ right: Length, _ bottom: Length, _ left: Length) -> CSSDeclaration {
	CSSDeclaration("margin", "\(top.value) \(right.value) \(bottom.value) \(left.value)")
}

public func fontSize(_ value: String) -> CSSDeclaration {
	CSSDeclaration("font-size", value)
}

public func fontSize(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("font-size", value.value)
}

public func fontSize(_ value: Percentage) -> CSSDeclaration {
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
public func fontFamily(_ value: CSSFontFamily.GenericFamily.GenericScriptSpecific) -> CSSDeclaration {
	CSSDeclaration("font-family", value.value)
}
public func fontFamily(_ value: CSSFontFamily.GenericFamily) -> CSSDeclaration {
	CSSDeclaration("font-family", value.value)
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
public func lineHeight(_ value: String) -> CSSDeclaration {
	CSSDeclaration("line-height", value)
}

public func lineHeight(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("line-height", value.value)
}

public func lineHeight(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("line-height", value.value)
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
public func textOverflow(_ value: CSSTextOverflow) -> CSSDeclaration {
	CSSDeclaration("text-overflow", value.rawValue)
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
public func backgroundColor(_ value: String) -> CSSDeclaration {
	CSSDeclaration("background-color", value)
}
public func borderRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("border-radius", value)
}

public func borderRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("border-radius", value.value)
}

public func borderRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("border-radius", value.value)
}
public func borderRadius(_ topLeft: Length, _ topRight: Length, _ bottomRight: Int, _ bottomLeft: Int) -> CSSDeclaration {
	CSSDeclaration("border-radius", "\(topLeft.value) \(topRight.value) \(bottomRight) \(bottomLeft)")
}
public func borderRadius(_ topLeft: Int, _ topRight: Length, _ bottomRight: Length, _ bottomLeft: Int) -> CSSDeclaration {
	CSSDeclaration("border-radius", "\(topLeft) \(topRight.value) \(bottomRight.value) \(bottomLeft)")
}

// Directional border radius functions
public func borderTopLeftRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("border-top-left-radius", value)
}

public func borderTopLeftRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("border-top-left-radius", value.value)
}

public func borderTopLeftRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("border-top-left-radius", value.value)
}

public func borderTopRightRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("border-top-right-radius", value)
}

public func borderTopRightRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("border-top-right-radius", value.value)
}

public func borderTopRightRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("border-top-right-radius", value.value)
}
public func borderBottomLeftRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("border-bottom-left-radius", value)
}

public func borderBottomLeftRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("border-bottom-left-radius", value.value)
}

public func borderBottomLeftRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("border-bottom-left-radius", value.value)
}
public func borderBottomRightRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("border-bottom-right-radius", value)
}

public func borderBottomRightRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("border-bottom-right-radius", value.value)
}

public func borderBottomRightRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("border-bottom-right-radius", value.value)
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
public func border(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSDeclaration {
	CSSDeclaration("border", "\(width.value) \(style.value) \(color.value)")
}
public func borderWidth(_ value: Length) -> CSSDeclaration {
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
public func fill(_ value: String) -> CSSDeclaration {
	CSSDeclaration("fill", value)
}
public func stroke(_ value: CSSColor) -> CSSDeclaration {
	CSSDeclaration("stroke", value.value)
}
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
public func strokeMiterlimit(_ value: String) -> CSSDeclaration {
	CSSDeclaration("stroke-miterlimit", value)
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
@available(*, deprecated)
public func flexDirection(_ value: String) -> CSSDeclaration {
	CSSDeclaration("flex-direction", value)
}
@available(*, deprecated)
public func alignItems(_ value: String) -> CSSDeclaration {
	CSSDeclaration("align-items", value)
}
public func alignSelf(_ value: String) -> CSSDeclaration {
	CSSDeclaration("align-self", value)
}
public func alignSelf(_ value: CSSAlignSelf) -> CSSDeclaration {
	CSSDeclaration("align-self", value.rawValue)
}
@available(*, deprecated)
public func justifyContent(_ value: String) -> CSSDeclaration {
	CSSDeclaration("justify-content", value)
}

public func boxSizing(_ value: CSSBoxSizing) -> CSSDeclaration {
	CSSDeclaration("box-sizing", value.rawValue)
}
@available(*, deprecated)
public func boxSizing(_ value: String) -> CSSDeclaration {
	CSSDeclaration("box-sizing", value)
}
public func maxWidth(_ value: String) -> CSSDeclaration {
	CSSDeclaration("max-width", value)
}

public func maxWidth(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("max-width", value.value)
}

public func maxWidth(_ value: Percentage) -> CSSDeclaration {
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
public func paddingRight(_ value: String) -> CSSDeclaration {
	CSSDeclaration("padding-right", value)
}

public func paddingRight(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("padding-right", value.value)
}

public func paddingRight(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("padding-right", value.value)
}
public func paddingLeft(_ value: String) -> CSSDeclaration {
	CSSDeclaration("padding-left", value)
}

public func paddingLeft(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("padding-left", value.value)
}

public func paddingLeft(_ value: Percentage) -> CSSDeclaration {
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
	let value = properties.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("transition-property", value)
}

public func transitionProperty(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("transition-property", value.rawValue)
}

// transition-duration = <time>#
public func transitionDuration(_ durations: CSSTime...) -> CSSDeclaration {
	let value = durations.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("transition-duration", value)
}

// transition-timing-function = <easing-function>#
public func transitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSDeclaration {
	let value = functions.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("transition-timing-function", value)
}

public func transitionTimingFunction(_ value: String) -> CSSDeclaration {
	CSSDeclaration("transition-timing-function", value)
}

// transition-delay = <time>#
public func transitionDelay(_ delays: CSSTime...) -> CSSDeclaration {
	let value = delays.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("transition-delay", value)
}

// transition-behavior = <transition-behavior-value>#
public func transitionBehavior(_ behaviors: CSSTransitionBehaviorValue...) -> CSSDeclaration {
	let value = behaviors.map { $0.rawValue }.joined(separator: ", ")
	return CSSDeclaration("transition-behavior", value)
}


public func letterSpacing(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("letter-spacing", value.value)
}

public func letterSpacing(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("letter-spacing", value.value)
}


public func transform(_ value: Length) -> CSSDeclaration {
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
	let value = transitions.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("transition", value)
}

// Convenience: unwrapped tuple syntax
public func transition(_ property: CSSSingleTransitionProperty, _ duration: CSSTime) -> CSSDeclaration {
	transition(CSSSingleTransition(property, duration, .ease))
}

public func transition(_ property: CSSSingleTransitionProperty, _ duration: CSSTime, _ easingFunction: CSSEasingFunction) -> CSSDeclaration {
	transition(CSSSingleTransition(property, duration, easingFunction))
}

public func transition(_ property: CSSSingleTransitionProperty, _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ delay: CSSTime) -> CSSDeclaration {
	transition(CSSSingleTransition(property, duration, easingFunction, delay))
}

public func transition(_ property: CSSSingleTransitionProperty, _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ behavior: CSSTransitionBehaviorValue) -> CSSDeclaration {
	transition(CSSSingleTransition(property, duration, easingFunction, nil, behavior))
}

public func transition(_ property: CSSSingleTransitionProperty, _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ delay: CSSTime, _ behavior: CSSTransitionBehaviorValue) -> CSSDeclaration {
	transition(CSSSingleTransition(property, duration, easingFunction, delay, behavior))
}

// Overload for multiple (property, duration) tuples
public func transition(_ transition1: (CSSSingleTransitionProperty, CSSTime), _ transition2: (CSSSingleTransitionProperty, CSSTime)) -> CSSDeclaration {
	transition(
		CSSSingleTransition(transition1.0, transition1.1, .ease),
		CSSSingleTransition(transition2.0, transition2.1, .ease)
	)
}

public func transition(_ transition1: (CSSSingleTransitionProperty, CSSTime), _ transition2: (CSSSingleTransitionProperty, CSSTime), _ transition3: (CSSSingleTransitionProperty, CSSTime)) -> CSSDeclaration {
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

public func outline(_ value: CSSOutline) -> CSSDeclaration {
	CSSDeclaration("outline", value.rawValue)
}
public func outline(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSDeclaration {
	CSSDeclaration("outline", "\(width.value) \(style.value) \(color.value)")
}
public func outline(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSKeyword.Transparent) -> CSSDeclaration {
	CSSDeclaration("outline", "\(width.value) \(style.value) \(color.rawValue)")
}
public func outline(_ value: String) -> CSSDeclaration {
	CSSDeclaration("outline", value)
}

public func outlineWidth(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("outline-width", value.value)
}
public func outlineWidth(_ value: String) -> CSSDeclaration {
	CSSDeclaration("outline-width", value)
}

public func outlineStyle(_ value: CSSBorder.LineStyle) -> CSSDeclaration {
	CSSDeclaration("outline-style", value.value)
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
public func transform(_ f1: CSSTransformFunction, _ f2: CSSTransformFunction, _ f3: CSSTransformFunction) -> CSSDeclaration {
	CSSDeclaration("transform", "\(f1.value) \(f2.value) \(f3.value)")
}
public func transform(_ f1: CSSTransformFunction, _ f2: CSSTransformFunction, _ f3: CSSTransformFunction, _ f4: CSSTransformFunction) -> CSSDeclaration {
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
public func top(_ value: String) -> CSSDeclaration {
	CSSDeclaration("top", value)
}

public func top(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("top", value.value)
}

public func top(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("top", value.value)
}
public func left(_ value: String) -> CSSDeclaration {
	CSSDeclaration("left", value)
}

public func left(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("left", value.value)
}

public func left(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("left", value.value)
}
public func right(_ value: String) -> CSSDeclaration {
	CSSDeclaration("right", value)
}

public func right(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("right", value.value)
}

public func right(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("right", value.value)
}
public func bottom(_ value: String) -> CSSDeclaration {
	CSSDeclaration("bottom", value)
}

public func bottom(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("bottom", value.value)
}

public func bottom(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("bottom", value.value)
}
public func overflowY(_ value: String) -> CSSDeclaration {
	CSSDeclaration("overflow-y", value)
}
public func overflowY(_ value: CSSOverflow) -> CSSDeclaration {
	CSSDeclaration("overflow-y", value.rawValue)
}
public func overflowX(_ value: String) -> CSSDeclaration {
	CSSDeclaration("overflow-x", value)
}
public func overflowX(_ value: CSSOverflow) -> CSSDeclaration {
	CSSDeclaration("overflow-x", value.rawValue)
}
public func overflow(_ value: String) -> CSSDeclaration {
	CSSDeclaration("overflow", value)
}
public func overflow(_ value: CSSOverflow) -> CSSDeclaration {
	CSSDeclaration("overflow", value.rawValue)
}
public func objectFit(_ value: CSSObjectFit) -> CSSDeclaration {
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
public func maxHeight(_ value: String) -> CSSDeclaration {
	CSSDeclaration("max-height", value)
}

public func maxHeight(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("max-height", value.value)
}

public func maxHeight(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("max-height", value.value)
}
public func maxHeight(_ value: CSSKeyword.Length) -> CSSDeclaration {
	CSSDeclaration("max-height", value.rawValue)
}
public func maxHeight(_ value: CSSKeyword.Auto) -> CSSDeclaration {
	CSSDeclaration("max-height", value.rawValue)
}
public func minHeight(_ value: String) -> CSSDeclaration {
	CSSDeclaration("min-height", value)
}

public func minHeight(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("min-height", value.value)
}

public func minHeight(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("min-height", value.value)
}
public func minHeight(_ value: CSSKeyword.Length) -> CSSDeclaration {
	CSSDeclaration("min-height", value.rawValue)
}
public func minHeight(_ value: CSSKeyword.Auto) -> CSSDeclaration {
	CSSDeclaration("min-height", value.rawValue)
}
public func minWidth(_ value: String) -> CSSDeclaration {
	CSSDeclaration("min-width", value)
}

public func minWidth(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("min-width", value.value)
}

public func minWidth(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("min-width", value.value)
}
public func minWidth(_ value: CSSKeyword.Length) -> CSSDeclaration {
	CSSDeclaration("min-width", value.rawValue)
}
public func minWidth(_ value: CSSKeyword.Auto) -> CSSDeclaration {
	CSSDeclaration("min-width", value.rawValue)
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

public func marginTop(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("margin-top", value.value)
}

public func marginTop(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("margin-top", value.value)
}
public func marginLeft(_ value: String) -> CSSDeclaration {
	CSSDeclaration("margin-left", value)
}
public func marginLeft(_ value: CSSKeyword.Auto) -> CSSDeclaration {
	CSSDeclaration("margin-left", value.rawValue)
}
public func marginLeft(_ value: CSSKeyword.Global) -> CSSDeclaration {
	CSSDeclaration("margin-left", value.rawValue)
}

public func marginLeft(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("margin-left", value.value)
}

public func marginLeft(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("margin-left", value.value)
}
public func marginBottom(_ value: String) -> CSSDeclaration {
	CSSDeclaration("margin-bottom", value)
}
public func marginBottom(_ value: CSSKeyword.Auto) -> CSSDeclaration {
	CSSDeclaration("margin-bottom", value.rawValue)
}
public func marginBottom(_ value: CSSKeyword.Global) -> CSSDeclaration {
	CSSDeclaration("margin-bottom", value.rawValue)
}

public func marginBottom(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("margin-bottom", value.value)
}

public func marginBottom(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("margin-bottom", value.value)
}
public func marginRight(_ value: String) -> CSSDeclaration {
	CSSDeclaration("margin-right", value)
}
public func marginRight(_ value: CSSKeyword.Auto) -> CSSDeclaration {
	CSSDeclaration("margin-right", value.rawValue)
}
public func marginRight(_ value: CSSKeyword.Global) -> CSSDeclaration {
	CSSDeclaration("margin-right", value.rawValue)
}

public func marginRight(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("margin-right", value.value)
}

public func marginRight(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("margin-right", value.value)
}
public func paddingTop(_ value: String) -> CSSDeclaration {
	CSSDeclaration("padding-top", value)
}

public func paddingTop(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("padding-top", value.value)
}

public func paddingTop(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("padding-top", value.value)
}
public func paddingBottom(_ value: String) -> CSSDeclaration {
	CSSDeclaration("padding-bottom", value)
}

public func paddingBottom(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("padding-bottom", value.value)
}

public func paddingBottom(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("padding-bottom", value.value)
}

public func textDecoration(_ value: String) -> CSSDeclaration {
	CSSDeclaration("text-decoration", value)
}
public func textDecoration(_ value: CSSTextDecoration) -> CSSDeclaration {
	CSSDeclaration("text-decoration", String(describing: value.value))
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

public func borderBottom(_ value: String) -> CSSDeclaration {
	CSSDeclaration("border-bottom", value)
}
public func borderBottom(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("border-bottom", value.rawValue)
}
public func borderBottom(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSDeclaration {
	CSSDeclaration("border-bottom", "\(width.value) \(style.value) \(color.value)")
}
public func borderBottom(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSKeyword.Transparent) -> CSSDeclaration {
	CSSDeclaration("border-bottom", "\(width.value) \(style.value) \(color.rawValue)")
}
public func borderTop(_ value: String) -> CSSDeclaration {
	CSSDeclaration("border-top", value)
}
public func borderTop(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("border-top", value.rawValue)
}
public func borderTop(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSDeclaration {
	CSSDeclaration("border-top", "\(width.value) \(style.value) \(color.value)")
}
public func borderRight(_ value: String) -> CSSDeclaration {
	CSSDeclaration("border-right", value)
}
public func borderRight(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("border-right", value.rawValue)
}
public func borderRight(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSDeclaration {
	CSSDeclaration("border-right", "\(width.value) \(style.value) \(color.value)")
}
public func borderLeft(_ value: String) -> CSSDeclaration {
	CSSDeclaration("border-left", value)
}
public func borderLeft(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("border-left", value.rawValue)
}
public func borderLeft(_ width: Length, _ style: CSSBorder.LineStyle, _ color: CSSColor) -> CSSDeclaration {
	CSSDeclaration("border-left", "\(width.value) \(style.value) \(color.value)")
}
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

public func flex(_ value: String) -> CSSDeclaration {
	CSSDeclaration("flex", value)
}
public func flex(_ value: Int) -> CSSDeclaration {
	CSSDeclaration("flex", "\(value)")
}
public func flex(_ value: Double) -> CSSDeclaration {
	CSSDeclaration("flex", "\(value)")
}
public func flexGrow(_ value: String) -> CSSDeclaration {
	CSSDeclaration("flex-grow", value)
}
public func flexGrow(_ value: Int) -> CSSDeclaration {
	CSSDeclaration("flex-grow", "\(value)")
}
public func flexGrow(_ value: Double) -> CSSDeclaration {
	CSSDeclaration("flex-grow", "\(value)")
}
public func flexShrink(_ value: String) -> CSSDeclaration {
	CSSDeclaration("flex-shrink", value)
}
public func flexShrink(_ value: Int) -> CSSDeclaration {
	CSSDeclaration("flex-shrink", "\(value)")
}
public func flexShrink(_ value: Double) -> CSSDeclaration {
	CSSDeclaration("flex-shrink", "\(value)")
}
public func flexWrap(_ value: CSSFlexWrap) -> CSSDeclaration {
	CSSDeclaration("flex-wrap", value.rawValue)
}
public func flexWrap(_ value: String) -> CSSDeclaration {
	CSSDeclaration("flex-wrap", value)
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
public func background(_ value: String) -> CSSDeclaration {
	CSSDeclaration("background", value)
}
public func backgroundImage(_ value: String) -> CSSDeclaration {
	CSSDeclaration("background-image", value)
}
public func backgroundSize(_ value: CSSBackgroundSize) -> CSSDeclaration {
	CSSDeclaration("background-size", value.rawValue)
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
	CSSDeclaration("background-position", value.rawValue)
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
public func strokeWidth(_ value: String) -> CSSDeclaration {
	CSSDeclaration("stroke-width", value)
}
public func strokeLinecap(_ value: String) -> CSSDeclaration {
	CSSDeclaration("stroke-linecap", value)
}
public func dominantBaseline(_ value: String) -> CSSDeclaration {
	CSSDeclaration("dominant-baseline", value)
}
public func opacity(_ value: String) -> CSSDeclaration {
	CSSDeclaration("opacity", value)
}
public func opacity(_ value: CSSNumber) -> CSSDeclaration {
	CSSDeclaration("opacity", value.value)
}
public func gap(_ value: String) -> CSSDeclaration {
	CSSDeclaration("gap", value)
}

public func gap(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("gap", value.value)
}

public func gap(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("gap", value.value)
}

public func gap(_ rowGap: String, _ columnGap: String) -> CSSDeclaration {
	CSSDeclaration("gap", "\(rowGap) \(columnGap)")
}

public func gap(_ rowGap: Length, _ columnGap: Length) -> CSSDeclaration {
	CSSDeclaration("gap", "\(rowGap.value) \(columnGap.value)")
}

public func content(_ value: String) -> CSSDeclaration {
	CSSDeclaration("content", value)
}
// box-shadow = <spread-shadow>#
public func boxShadow(_ shadows: CSSSpreadShadow...) -> CSSDeclaration {
	let value = shadows.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("box-shadow", value)
}

// Convenience: Apply color to shadow (e.g., boxShadow(boxShadowOutsetSmall, boxShadowColorProgressiveFocus))
public func boxShadow(_ shadow: CSSSpreadShadow, _ color: CSSColor) -> CSSDeclaration {
	// Combine the shadow with the color by prepending color to shadow value
	let value = "\(color.value) \(shadow.value)"
	return CSSDeclaration("box-shadow", value)
}

// Convenience: Two shadows with colors (e.g., boxShadow((boxShadowOutsetMediumBelow, boxShadowColorAlphaBase), (boxShadowOutsetMediumAround, boxShadowColorAlphaBase)))
public func boxShadow(_ shadow1: (CSSSpreadShadow, CSSColor), _ shadow2: (CSSSpreadShadow, CSSColor)) -> CSSDeclaration {
	let value1 = "\(shadow1.1.value) \(shadow1.0.value)"
	let value2 = "\(shadow2.1.value) \(shadow2.0.value)"
	return CSSDeclaration("box-shadow", "\(value1), \(value2)")
}

// Convenience: Two shadows with offsetX, offsetY, blur, color tuples
public func boxShadow(_ shadow1: (Length, Length, Length, CSSColor), _ shadow2: (Length, Length, Length, CSSColor)) -> CSSDeclaration {
	let value1 = "\(shadow1.0.value) \(shadow1.1.value) \(shadow1.2.value) \(shadow1.3.value)"
	let value2 = "\(shadow2.0.value) \(shadow2.1.value) \(shadow2.2.value) \(shadow2.3.value)"
	return CSSDeclaration("box-shadow", "\(value1), \(value2)")
}

// Convenience: color, offsetX, offsetY, blur, spread, position (CSSColor)
public func boxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length, _ position: CSSSpreadShadow.BoxShadowPosition) -> CSSDeclaration {
	boxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread),
		position: position
	))
}

// Convenience: color, offsetX, offsetY, blur, spread (no position) (CSSColor)
public func boxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length) -> CSSDeclaration {
	boxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread)
	))
}

// Convenience: offsetX, offsetY, blur, spread, color (color last)
public func boxShadow(_ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length, _ color: CSSColor) -> CSSDeclaration {
	boxShadow(CSSSpreadShadow(
		color: CSSSpreadShadow.BoxShadowColor(color),
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread)
	))
}

// Convenience: color, offsetX, offsetY, blur (no spread, no position) (CSSColor)
public func boxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length) -> CSSDeclaration {
	boxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur)
	))
}

public func boxShadow(_ color: CSSColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length) -> CSSDeclaration {
	boxShadow(CSSSpreadShadow(
		color: CSSSpreadShadow.BoxShadowColor(color),
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur)
	))
}

// Convenience: color, offsetX, offsetY (no blur, spread, position) (CSSColor)
public func boxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length) -> CSSDeclaration {
	boxShadow(CSSSpreadShadow(
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

// Convenience: position-first overload for inset shadows
// Usage: boxShadow(.inset, 0, 0, 0, px(1), color)
public func boxShadow(_ position: CSSSpreadShadow.BoxShadowPosition, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length, _ color: CSSColor) -> CSSDeclaration {
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
public func boxShadow(_ position: CSSSpreadShadow.BoxShadowPosition, _ offsetX: Length, _ offsetY: Length, _ color: CSSColor) -> CSSDeclaration {
	boxShadow(CSSSpreadShadow(
		color: CSSSpreadShadow.BoxShadowColor(color),
		offsetX: offsetX,
		offsetY: offsetY,
		position: position
	))
}

public func outlineOffset(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("outline-offset", value.value)
}

public func outlineOffset(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("outline-offset", value.value)
}
public func outlineOffset(_ value: String) -> CSSDeclaration {
	CSSDeclaration("outline-offset", value)
}
// MARK: - Animation
// animation = <single-animation>#
public func animation(_ animations: CSSSingleAnimation...) -> CSSDeclaration {
	let value = animations.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("animation", value)
}

public func animation(_ value: String) -> CSSDeclaration {
	CSSDeclaration("animation", value)
}

// Convenience: unwrapped tuple syntax - minimal 3-param (name, duration, easing)
public func animation(_ name: String, _ duration: CSSTime, _ easingFunction: CSSEasingFunction) -> CSSDeclaration {
	animation(CSSSingleAnimation(
		duration: .time(duration),
		easingFunction: easingFunction,
		name: .name(name)
	))
}

// With iteration count (4 params)
public func animation(_ name: String, _ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ iterationCount: CSSSingleAnimationIterationCount) -> CSSDeclaration {
	animation(CSSSingleAnimation(
		duration: .time(duration),
		easingFunction: easingFunction,
		iterationCount: iterationCount,
		name: .name(name)
	))
}

// Convenience: accept CSSTime directly (auto-wraps in duration type)
public func animation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ iterationCount: CSSSingleAnimationIterationCount) -> CSSDeclaration {
	animation(CSSSingleAnimation(
		duration: .time(duration),
		easingFunction: easingFunction,
		iterationCount: iterationCount,
		name: .name(name)
	))
}

// With timeline as CSSScroll
public func animation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll) -> CSSDeclaration {
	animation(CSSSingleAnimation(
		duration: .time(duration),
		easingFunction: easingFunction,
		name: .name(name),
		timeline: .scroll(timeline)
	))
}

// With timeline as CSSView
public func animation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView) -> CSSDeclaration {
	animation(CSSSingleAnimation(
		duration: .time(duration),
		easingFunction: easingFunction,
		name: .name(name),
		timeline: .view(timeline)
	))
}

// With timeline as String (auto-converts to dashed-ident)
public func animation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String) -> CSSDeclaration {
	animation(CSSSingleAnimation(
		duration: .time(duration),
		easingFunction: easingFunction,
		name: .name(name),
		timeline: .dashedIdent(CSSDashedIdent(timeline))
	))
}

// Multiple animations with tuples (2-4 animations)
public func animation(
	_ a1: (CSSTime, CSSEasingFunction, String, CSSSingleAnimationIterationCount),
	_ a2: (CSSTime, CSSEasingFunction, String, CSSSingleAnimationIterationCount)
) -> CSSDeclaration {
	animation(
		CSSSingleAnimation(duration: .time(a1.0), easingFunction: a1.1, iterationCount: a1.3, name: .name(a1.2)),
		CSSSingleAnimation(duration: .time(a2.0), easingFunction: a2.1, iterationCount: a2.3, name: .name(a2.2))
	)
}

public func animation(
	_ a1: (CSSTime, CSSEasingFunction, String, CSSSingleAnimationIterationCount),
	_ a2: (CSSTime, CSSEasingFunction, String, CSSSingleAnimationIterationCount),
	_ a3: (CSSTime, CSSEasingFunction, String, CSSSingleAnimationIterationCount)
) -> CSSDeclaration {
	animation(
		CSSSingleAnimation(duration: .time(a1.0), easingFunction: a1.1, iterationCount: a1.3, name: .name(a1.2)),
		CSSSingleAnimation(duration: .time(a2.0), easingFunction: a2.1, iterationCount: a2.3, name: .name(a2.2)),
		CSSSingleAnimation(duration: .time(a3.0), easingFunction: a3.1, iterationCount: a3.3, name: .name(a3.2))
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
	let value = durations.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("animation-duration", value)
}

public func animationDuration(_ value: CSSKeyword.Auto) -> CSSDeclaration {
	CSSDeclaration("animation-duration", value.rawValue)
}

public func animationDuration(_ value: String) -> CSSDeclaration {
	CSSDeclaration("animation-duration", value)
}

// animation-timing-function = <easing-function>#
public func animationTimingFunction(_ functions: CSSEasingFunction...) -> CSSDeclaration {
	let value = functions.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("animation-timing-function", value)
}

public func animationTimingFunction(_ value: String) -> CSSDeclaration {
	CSSDeclaration("animation-timing-function", value)
}

// animation-delay = <time>#
public func animationDelay(_ delays: CSSTime...) -> CSSDeclaration {
	let value = delays.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("animation-delay", value)
}

public func animationDelay(_ value: String) -> CSSDeclaration {
	CSSDeclaration("animation-delay", value)
}

// animation-iteration-count = <single-animation-iteration-count>#
public func animationIterationCount(_ counts: CSSSingleAnimationIterationCount...) -> CSSDeclaration {
	let value = counts.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("animation-iteration-count", value)
}

public func animationIterationCount(_ value: CSSKeyword.Infinite) -> CSSDeclaration {
	CSSDeclaration("animation-iteration-count", value.rawValue)
}

public func animationIterationCount(_ value: String) -> CSSDeclaration {
	CSSDeclaration("animation-iteration-count", value)
}

// animation-direction = <single-animation-direction>#
public func animationDirection(_ directions: CSSSingleAnimationDirection...) -> CSSDeclaration {
	let value = directions.map { $0.rawValue }.joined(separator: ", ")
	return CSSDeclaration("animation-direction", value)
}

public func animationDirection(_ value: String) -> CSSDeclaration {
	CSSDeclaration("animation-direction", value)
}

// animation-fill-mode = <single-animation-fill-mode>#
public func animationFillMode(_ modes: CSSSingleAnimationFillMode...) -> CSSDeclaration {
	let value = modes.map { $0.rawValue }.joined(separator: ", ")
	return CSSDeclaration("animation-fill-mode", value)
}

public func animationFillMode(_ value: String) -> CSSDeclaration {
	CSSDeclaration("animation-fill-mode", value)
}

// animation-play-state = <single-animation-play-state>#
public func animationPlayState(_ states: CSSSingleAnimationPlayState...) -> CSSDeclaration {
	let value = states.map { $0.rawValue }.joined(separator: ", ")
	return CSSDeclaration("animation-play-state", value)
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

// Two values
public func transformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
	CSSDeclaration("transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func transformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSDeclaration {
	CSSDeclaration("transform-origin", "\(x.rawValue) \(y.value)")
}

public func transformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
	CSSDeclaration("transform-origin", "\(x.value) \(y.rawValue)")
}


// Three values
public func transformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func transformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("transform-origin", "\(x.rawValue) \(y.value) \(z.value)")
}

public func transformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("transform-origin", "\(x.value) \(y.rawValue) \(z.value)")
}

public func transformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func transformOrigin(_ value: String) -> CSSDeclaration {
	CSSDeclaration("transform-origin", value)
}
public func visibility(_ value: String) -> CSSDeclaration {
	CSSDeclaration("visibility", value)
}
public func visibility(_ value: CSSKeyword.Visibility) -> CSSDeclaration {
	CSSDeclaration("visibility", value.rawValue)
}
public func stopColor(_ value: String) -> CSSDeclaration {
	CSSDeclaration("stop-color", value)
}
public func stopOpacity(_ value: String) -> CSSDeclaration {
	CSSDeclaration("stop-opacity", value)
}
public func gridTemplateColumns(_ value: String) -> CSSDeclaration {
	CSSDeclaration("grid-template-columns", value)
}
public func gridTemplateColumns(_ values: Length...) -> CSSDeclaration {
	let joined = values.map { $0.value }.joined(separator: " ")
	return CSSDeclaration("grid-template-columns", joined)
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
public func clip(_ value: String) -> CSSDeclaration {
	CSSDeclaration("clip", value)
}
public func backgroundBlendMode(_ value: CSSBlendMode) -> CSSDeclaration {
	CSSDeclaration("background-blend-mode", value.rawValue)
}
public func backgroundBlendMode(_ value: String) -> CSSDeclaration {
	CSSDeclaration("background-blend-mode", value)
}
public func mixBlendMode(_ value: CSSBlendMode) -> CSSDeclaration {
	CSSDeclaration("mix-blend-mode", value.rawValue)
}
public func mixBlendMode(_ value: CSSMixBlendMode) -> CSSDeclaration {
	CSSDeclaration("mix-blend-mode", value.rawValue)
}
public func mixBlendMode(_ value: String) -> CSSDeclaration {
	CSSDeclaration("mix-blend-mode", value)
}
public func textSizeAdjust(_ value: CSSTextSizeAdjust) -> CSSDeclaration {
	CSSDeclaration("text-size-adjust", value.rawValue)
}
public func textSizeAdjust(_ value: String) -> CSSDeclaration {
	CSSDeclaration("text-size-adjust", value)
}
public func userSelect(_ value: CSSUserSelect) -> CSSDeclaration {
	CSSDeclaration("user-select", value.rawValue)
}
public func whiteSpace(_ value: CSSWhiteSpace) -> CSSDeclaration {
	CSSDeclaration("white-space", value.rawValue)
}

public func wordBreak(_ value: CSSWordBreak) -> CSSDeclaration {
    CSSDeclaration("word-break", value.rawValue)
}

public func wordBreak(_ value: String) -> CSSDeclaration {
    CSSDeclaration("word-break", value)
}

public func customProperty(_ name: String, _ value: String) -> CSSDeclaration {
	CSSDeclaration(name, value)
}

public func customProperty(_ name: String, _ value: Int) -> CSSDeclaration {
	CSSDeclaration(name, "\(value)")
}

public func customProperty(_ name: String, _ value: Double) -> CSSDeclaration {
	CSSDeclaration(name, "\(value)")
}

public func customProperty(_ name: String, _ value: CSSColor) -> CSSDeclaration {
	CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSBlendMode) -> CSSDeclaration {
	CSSDeclaration(name, value.rawValue)
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

public func customProperty(_ name: String, _ value: CSSSingleAnimationIterationCount) -> CSSDeclaration {
	CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSTextDecoration) -> CSSDeclaration {
	CSSDeclaration(name, String(describing: value.value))
}

public func customProperty(_ name: String, _ value: CSSTextOverflow) -> CSSDeclaration {
	CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSFontFamily) -> CSSDeclaration {
	CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSFontFamily.GenericFamily.GenericComplete) -> CSSDeclaration {
	CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSFontFamily.GenericFamily.GenericIncomplete) -> CSSDeclaration {
	CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSFontFamily.GenericFamily.GenericScriptSpecific) -> CSSDeclaration {
	CSSDeclaration(name, value.value)
}

public func customProperty(_ name: String, _ value: CSSFontFamily.GenericFamily) -> CSSDeclaration {
	CSSDeclaration(name, value.value)
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

public func customProperty(_ name: String, _ value: CSSKeyword.Length) -> CSSDeclaration {
	CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSBoxSizing) -> CSSDeclaration {
	CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSBackgroundSize) -> CSSDeclaration {
	CSSDeclaration(name, value.rawValue)
}

public func customProperty(_ name: String, _ value: CSSBackgroundPosition) -> CSSDeclaration {
	CSSDeclaration(name, value.rawValue)
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

public func customProperty(_ name: String, _ properties: (CSSSingleTransitionProperty, CSSSingleTransitionProperty, CSSSingleTransitionProperty)) -> CSSDeclaration {
	CSSDeclaration(name, "\(properties.0.value), \(properties.1.value), \(properties.2.value)")
}

public func customProperty(_ name: String, _ properties: (CSSSingleTransitionProperty, CSSSingleTransitionProperty, CSSSingleTransitionProperty, CSSSingleTransitionProperty)) -> CSSDeclaration {
	CSSDeclaration(name, "\(properties.0.value), \(properties.1.value), \(properties.2.value), \(properties.3.value)")
}

public func customProperty(_ name: String, _ boxShadow: (CSSSpreadShadow.BoxShadowPosition, Length, Length, Length, Length)) -> CSSDeclaration {
		CSSDeclaration(name, "\(boxShadow.0.rawValue) \(boxShadow.1.value) \(boxShadow.2.value) \(boxShadow.3.value) \(boxShadow.4.value)")
}

public func customProperty(_ name: String, _ boxShadow: (Length, Length, Length, Length)) -> CSSDeclaration {
	CSSDeclaration(name, "\(boxShadow.0.value) \(boxShadow.1.value) \(boxShadow.2.value) \(boxShadow.3.value)")
}

public func customProperty(_ name: String, _ value: (CSSSpreadShadow, CSSColor)) -> CSSDeclaration {
	CSSDeclaration(name, "\(value.0.value) \(value.1.value)")
}

// Two box shadows with colors
public func customProperty(_ name: String, _ value: ((CSSSpreadShadow, CSSColor), (CSSSpreadShadow, CSSColor))) -> CSSDeclaration {
	let shadow1 = "\(value.0.1.value) \(value.0.0.value)"
	let shadow2 = "\(value.1.1.value) \(value.1.0.value)"
	return CSSDeclaration(name, "\(shadow1), \(shadow2)")
}

// Border tuple (width, style, color)
public func customProperty(_ name: String, _ value: (Length, CSSBorder.LineStyle, CSSColor)) -> CSSDeclaration {
	return CSSDeclaration(name, "\(value.0.value) \(value.1.value) \(value.2.value)")
}

public func customProperty(_ name: String, _ value: (Length, CSSBorder.LineStyle, CSSKeyword.Transparent)) -> CSSDeclaration {
	return CSSDeclaration(name, "\(value.0.value) \(value.1.value) \(value.2.rawValue)")
}

// Font stacks with GenericComplete
public func customProperty(_ name: String, _ fonts: (String, CSSFontFamily.GenericFamily.GenericComplete)) -> CSSDeclaration {
	CSSDeclaration(name, "\(fonts.0), \(fonts.1.rawValue)")
}

public func customProperty(_ name: String, _ fonts: (String, String, CSSFontFamily.GenericFamily.GenericComplete)) -> CSSDeclaration {
	CSSDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2.rawValue)")
}

public func customProperty(_ name: String, _ fonts: (String, String, String, CSSFontFamily.GenericFamily.GenericComplete)) -> CSSDeclaration {
	CSSDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3.rawValue)")
}

public func customProperty(_ name: String, _ fonts: (String, String, String, String, CSSFontFamily.GenericFamily.GenericComplete)) -> CSSDeclaration {
	CSSDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4.rawValue)")
}

public func customProperty(_ name: String, _ fonts: (String, String, String, String, String, CSSFontFamily.GenericFamily.GenericComplete)) -> CSSDeclaration {
	CSSDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4), \(fonts.5.rawValue)")
}

public func customProperty(_ name: String, _ fonts: (String, String, String, String, String, String, CSSFontFamily.GenericFamily.GenericComplete)) -> CSSDeclaration {
	CSSDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4), \(fonts.5), \(fonts.6.rawValue)")
}

public func customProperty(_ name: String, _ fonts: (String, String, String, String, String, String, String, CSSFontFamily.GenericFamily.GenericComplete)) -> CSSDeclaration {
	CSSDeclaration(name, "\(fonts.0), \(fonts.1), \(fonts.2), \(fonts.3), \(fonts.4), \(fonts.5), \(fonts.6), \(fonts.7.rawValue)")
}

// Font stacks with GenericIncomplete + CSSFontFamily
public func customProperty(_ name: String, _ fonts: (String, CSSFontFamily.GenericFamily.GenericIncomplete, CSSFontFamily)) -> CSSDeclaration {
	CSSDeclaration(name, "\(fonts.0), \(fonts.1.rawValue), \(fonts.2.value)")
}

// Font stacks with just GenericIncomplete + CSSFontFamily (no initial string)
public func customProperty(_ name: String, _ fonts: (CSSFontFamily.GenericFamily.GenericIncomplete, CSSFontFamily)) -> CSSDeclaration {
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

public func webkitAppearance(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-appearance", value)
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

public func mozAppearance(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-appearance", value)
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
	CSSDeclaration("-webkit-box-sizing", value.rawValue)
}

public func mozBoxSizing(_ value: CSSBoxSizing) -> CSSDeclaration {
	CSSDeclaration("-moz-box-sizing", value.rawValue)
}

// MARK: - Transform
public func webkitTransform(_ value: CSSTransformFunction) -> CSSDeclaration {
	CSSDeclaration("-webkit-transform", value.value)
}

public func webkitTransform(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-transform", value)
}

public func mozTransform(_ value: CSSTransformFunction) -> CSSDeclaration {
	CSSDeclaration("-moz-transform", value.value)
}

public func mozTransform(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-transform", value)
}

public func msTransform(_ value: CSSTransformFunction) -> CSSDeclaration {
	CSSDeclaration("-ms-transform", value.value)
}

public func msTransform(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-transform", value)
}

public func oTransform(_ value: CSSTransformFunction) -> CSSDeclaration {
	CSSDeclaration("-o-transform", value.value)
}

public func oTransform(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-transform", value)
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

// Webkit - Two values
public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
	CSSDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSDeclaration {
	CSSDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.value)")
}

public func webkitTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
	CSSDeclaration("-webkit-transform-origin", "\(x.value) \(y.rawValue)")
}


// Webkit - Three values
public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func webkitTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-webkit-transform-origin", "\(x.rawValue) \(y.value) \(z.value)")
}

public func webkitTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-webkit-transform-origin", "\(x.value) \(y.rawValue) \(z.value)")
}

public func webkitTransformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-webkit-transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func webkitTransformOrigin(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-transform-origin", value)
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

// Mozilla - Two values
public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
	CSSDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSDeclaration {
	CSSDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.value)")
}

public func mozTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
	CSSDeclaration("-moz-transform-origin", "\(x.value) \(y.rawValue)")
}


// Mozilla - Three values
public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func mozTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-moz-transform-origin", "\(x.rawValue) \(y.value) \(z.value)")
}

public func mozTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-moz-transform-origin", "\(x.value) \(y.rawValue) \(z.value)")
}

public func mozTransformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-moz-transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func mozTransformOrigin(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-transform-origin", value)
}

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

// Microsoft - Two values
public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
	CSSDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSDeclaration {
	CSSDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.value)")
}

public func msTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
	CSSDeclaration("-ms-transform-origin", "\(x.value) \(y.rawValue)")
}


// Microsoft - Three values
public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func msTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-ms-transform-origin", "\(x.rawValue) \(y.value) \(z.value)")
}

public func msTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-ms-transform-origin", "\(x.value) \(y.rawValue) \(z.value)")
}

public func msTransformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-ms-transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func msTransformOrigin(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-transform-origin", value)
}

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

// Opera - Two values
public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
	CSSDeclaration("-o-transform-origin", "\(x.rawValue) \(y.rawValue)")
}

public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length) -> CSSDeclaration {
	CSSDeclaration("-o-transform-origin", "\(x.rawValue) \(y.value)")
}

public func oTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical) -> CSSDeclaration {
	CSSDeclaration("-o-transform-origin", "\(x.value) \(y.rawValue)")
}


// Opera - Three values
public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-o-transform-origin", "\(x.rawValue) \(y.rawValue) \(z.value)")
}

public func oTransformOrigin(_ x: CSSTransformOrigin.Horizontal, _ y: Length, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-o-transform-origin", "\(x.rawValue) \(y.value) \(z.value)")
}

public func oTransformOrigin(_ x: Length, _ y: CSSTransformOrigin.Vertical, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-o-transform-origin", "\(x.value) \(y.rawValue) \(z.value)")
}

public func oTransformOrigin(_ x: Length, _ y: Length, _ z: Length) -> CSSDeclaration {
	CSSDeclaration("-o-transform-origin", "\(x.value) \(y.value) \(z.value)")
}

public func oTransformOrigin(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-transform-origin", value)
}

// MARK: - Transform Style
public func webkitTransformStyle(_ value: CSSTransformStyle) -> CSSDeclaration {
	CSSDeclaration("-webkit-transform-style", value.rawValue)
}

public func webkitTransformStyle(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-transform-style", value)
}

public func mozTransformStyle(_ value: CSSTransformStyle) -> CSSDeclaration {
	CSSDeclaration("-moz-transform-style", value.rawValue)
}

public func mozTransformStyle(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-transform-style", value)
}

public func msTransformStyle(_ value: CSSTransformStyle) -> CSSDeclaration {
	CSSDeclaration("-ms-transform-style", value.rawValue)
}

public func msTransformStyle(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-transform-style", value)
}

public func oTransformStyle(_ value: CSSTransformStyle) -> CSSDeclaration {
	CSSDeclaration("-o-transform-style", value.rawValue)
}

public func oTransformStyle(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-transform-style", value)
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

public func webkitTransitionDelay(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-transition-delay", value)
}

public func mozTransitionDelay(_ value: CSSTime) -> CSSDeclaration {
	CSSDeclaration("-moz-transition-delay", value.value)
}

public func mozTransitionDelay(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-transition-delay", value)
}

public func msTransitionDelay(_ value: CSSTime) -> CSSDeclaration {
	CSSDeclaration("-ms-transition-delay", value.value)
}

public func msTransitionDelay(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-transition-delay", value)
}

public func oTransitionDelay(_ value: CSSTime) -> CSSDeclaration {
	CSSDeclaration("-o-transition-delay", value.value)
}

public func oTransitionDelay(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-transition-delay", value)
}

// MARK: - Transition Duration
public func webkitTransitionDuration(_ value: CSSTime) -> CSSDeclaration {
	CSSDeclaration("-webkit-transition-duration", value.value)
}

public func webkitTransitionDuration(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-transition-duration", value)
}

public func mozTransitionDuration(_ value: CSSTime) -> CSSDeclaration {
	CSSDeclaration("-moz-transition-duration", value.value)
}

public func mozTransitionDuration(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-transition-duration", value)
}

public func msTransitionDuration(_ value: CSSTime) -> CSSDeclaration {
	CSSDeclaration("-ms-transition-duration", value.value)
}

public func msTransitionDuration(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-transition-duration", value)
}

public func oTransitionDuration(_ value: CSSTime) -> CSSDeclaration {
	CSSDeclaration("-o-transition-duration", value.value)
}

public func oTransitionDuration(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-transition-duration", value)
}

// MARK: - Transition Property
public func webkitTransitionProperty(_ properties: CSSSingleTransitionProperty...) -> CSSDeclaration {
	let value = properties.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("-webkit-transition-property", value)
}

public func webkitTransitionProperty(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-transition-property", value)
}

public func mozTransitionProperty(_ properties: CSSSingleTransitionProperty...) -> CSSDeclaration {
	let value = properties.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("-moz-transition-property", value)
}

public func mozTransitionProperty(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-transition-property", value)
}

public func msTransitionProperty(_ properties: CSSSingleTransitionProperty...) -> CSSDeclaration {
	let value = properties.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("-ms-transition-property", value)
}

public func msTransitionProperty(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-transition-property", value)
}

public func oTransitionProperty(_ properties: CSSSingleTransitionProperty...) -> CSSDeclaration {
	let value = properties.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("-o-transition-property", value)
}

public func oTransitionProperty(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-transition-property", value)
}

// MARK: - Transition Timing Function
public func webkitTransitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSDeclaration {
	let value = functions.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("-webkit-transition-timing-function", value)
}

public func webkitTransitionTimingFunction(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-transition-timing-function", value)
}

public func mozTransitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSDeclaration {
	let value = functions.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("-moz-transition-timing-function", value)
}

public func mozTransitionTimingFunction(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-transition-timing-function", value)
}

public func msTransitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSDeclaration {
	let value = functions.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("-ms-transition-timing-function", value)
}

public func msTransitionTimingFunction(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-transition-timing-function", value)
}

public func oTransitionTimingFunction(_ functions: CSSEasingFunction...) -> CSSDeclaration {
	let value = functions.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("-o-transition-timing-function", value)
}

public func oTransitionTimingFunction(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-transition-timing-function", value)
}

// MARK: - Animation
public func webkitAnimation(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation", value)
}

// Convenience overloads for webkit
public func webkitAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ iterationCount: CSSSingleAnimationIterationCount) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)")
}

public func webkitAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func webkitAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func webkitAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation", "\(duration.value) \(easingFunction.value) \(name) \(CSSDashedIdent(timeline).value)")
}

public func mozAnimation(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-animation", value)
}

// Convenience overloads for moz
public func mozAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ iterationCount: CSSSingleAnimationIterationCount) -> CSSDeclaration {
	CSSDeclaration("-moz-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)")
}

public func mozAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll) -> CSSDeclaration {
	CSSDeclaration("-moz-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func mozAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView) -> CSSDeclaration {
	CSSDeclaration("-moz-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func mozAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String) -> CSSDeclaration {
	CSSDeclaration("-moz-animation", "\(duration.value) \(easingFunction.value) \(name) \(CSSDashedIdent(timeline).value)")
}

public func msAnimation(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-animation", value)
}

// Convenience overloads for ms
public func msAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ iterationCount: CSSSingleAnimationIterationCount) -> CSSDeclaration {
	CSSDeclaration("-ms-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)")
}

public func msAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll) -> CSSDeclaration {
	CSSDeclaration("-ms-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func msAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView) -> CSSDeclaration {
	CSSDeclaration("-ms-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func msAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String) -> CSSDeclaration {
	CSSDeclaration("-ms-animation", "\(duration.value) \(easingFunction.value) \(name) \(CSSDashedIdent(timeline).value)")
}

public func oAnimation(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-animation", value)
}

// Convenience overloads for o
public func oAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ iterationCount: CSSSingleAnimationIterationCount) -> CSSDeclaration {
	CSSDeclaration("-o-animation", "\(duration.value) \(easingFunction.value) \(name) \(iterationCount.value)")
}

public func oAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSScroll) -> CSSDeclaration {
	CSSDeclaration("-o-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func oAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: CSSView) -> CSSDeclaration {
	CSSDeclaration("-o-animation", "\(duration.value) \(easingFunction.value) \(name) \(timeline.value)")
}

public func oAnimation(_ duration: CSSTime, _ easingFunction: CSSEasingFunction, _ name: String, _ timeline: String) -> CSSDeclaration {
	CSSDeclaration("-o-animation", "\(duration.value) \(easingFunction.value) \(name) \(CSSDashedIdent(timeline).value)")
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

public func webkitAnimationFillMode(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation-fill-mode", value)
}

public func mozAnimationFillMode(_ value: CSSSingleAnimationFillMode) -> CSSDeclaration {
	CSSDeclaration("-moz-animation-fill-mode", value.rawValue)
}

public func mozAnimationFillMode(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-animation-fill-mode", value)
}

public func msAnimationFillMode(_ value: CSSSingleAnimationFillMode) -> CSSDeclaration {
	CSSDeclaration("-ms-animation-fill-mode", value.rawValue)
}

public func msAnimationFillMode(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-animation-fill-mode", value)
}

public func oAnimationFillMode(_ value: CSSSingleAnimationFillMode) -> CSSDeclaration {
	CSSDeclaration("-o-animation-fill-mode", value.rawValue)
}

public func oAnimationFillMode(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-animation-fill-mode", value)
}

// MARK: - Animation Iteration Count
public func webkitAnimationIterationCount(_ value: CSSSingleAnimationIterationCount) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation-iteration-count", value.value)
}

public func webkitAnimationIterationCount(_ value: CSSKeyword.Infinite) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation-iteration-count", value.rawValue)
}

public func webkitAnimationIterationCount(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation-iteration-count", value)
}

public func mozAnimationIterationCount(_ value: CSSSingleAnimationIterationCount) -> CSSDeclaration {
	CSSDeclaration("-moz-animation-iteration-count", value.value)
}

public func mozAnimationIterationCount(_ value: CSSKeyword.Infinite) -> CSSDeclaration {
	CSSDeclaration("-moz-animation-iteration-count", value.rawValue)
}

public func mozAnimationIterationCount(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-animation-iteration-count", value)
}

public func msAnimationIterationCount(_ value: CSSSingleAnimationIterationCount) -> CSSDeclaration {
	CSSDeclaration("-ms-animation-iteration-count", value.value)
}

public func msAnimationIterationCount(_ value: CSSKeyword.Infinite) -> CSSDeclaration {
	CSSDeclaration("-ms-animation-iteration-count", value.rawValue)
}

public func msAnimationIterationCount(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-animation-iteration-count", value)
}

public func oAnimationIterationCount(_ value: CSSSingleAnimationIterationCount) -> CSSDeclaration {
	CSSDeclaration("-o-animation-iteration-count", value.value)
}

public func oAnimationIterationCount(_ value: CSSKeyword.Infinite) -> CSSDeclaration {
	CSSDeclaration("-o-animation-iteration-count", value.rawValue)
}

public func oAnimationIterationCount(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-animation-iteration-count", value)
}

// MARK: - Animation Name
public func webkitAnimationName(_ value: CSSKeyframesName) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation-name", value.value)
}

public func webkitAnimationName(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation-name", value)
}

public func webkitAnimationName(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation-name", value.rawValue)
}

public func mozAnimationName(_ value: CSSKeyframesName) -> CSSDeclaration {
	CSSDeclaration("-moz-animation-name", value.value)
}

public func mozAnimationName(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-animation-name", value)
}

public func mozAnimationName(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("-moz-animation-name", value.rawValue)
}

public func msAnimationName(_ value: CSSKeyframesName) -> CSSDeclaration {
	CSSDeclaration("-ms-animation-name", value.value)
}

public func msAnimationName(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-animation-name", value)
}

public func msAnimationName(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("-ms-animation-name", value.rawValue)
}

public func oAnimationName(_ value: CSSKeyframesName) -> CSSDeclaration {
	CSSDeclaration("-o-animation-name", value.value)
}

public func oAnimationName(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-animation-name", value)
}

public func oAnimationName(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("-o-animation-name", value.rawValue)
}

// MARK: - Animation Play State
public func webkitAnimationPlayState(_ value: CSSSingleAnimationPlayState) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation-play-state", value.rawValue)
}

public func webkitAnimationPlayState(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation-play-state", value)
}

public func mozAnimationPlayState(_ value: CSSSingleAnimationPlayState) -> CSSDeclaration {
	CSSDeclaration("-moz-animation-play-state", value.rawValue)
}

public func mozAnimationPlayState(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-animation-play-state", value)
}

public func msAnimationPlayState(_ value: CSSSingleAnimationPlayState) -> CSSDeclaration {
	CSSDeclaration("-ms-animation-play-state", value.rawValue)
}

public func msAnimationPlayState(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-animation-play-state", value)
}

public func oAnimationPlayState(_ value: CSSSingleAnimationPlayState) -> CSSDeclaration {
	CSSDeclaration("-o-animation-play-state", value.rawValue)
}

public func oAnimationPlayState(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-animation-play-state", value)
}

// MARK: - Animation Timing Function
public func webkitAnimationTimingFunction(_ value: CSSEasingFunction) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation-timing-function", value.value)
}

public func webkitAnimationTimingFunction(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-animation-timing-function", value)
}

public func mozAnimationTimingFunction(_ value: CSSEasingFunction) -> CSSDeclaration {
	CSSDeclaration("-moz-animation-timing-function", value.value)
}

public func mozAnimationTimingFunction(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-animation-timing-function", value)
}

public func msAnimationTimingFunction(_ value: CSSEasingFunction) -> CSSDeclaration {
	CSSDeclaration("-ms-animation-timing-function", value.value)
}

public func msAnimationTimingFunction(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-animation-timing-function", value)
}

public func oAnimationTimingFunction(_ value: CSSEasingFunction) -> CSSDeclaration {
	CSSDeclaration("-o-animation-timing-function", value.value)
}

public func oAnimationTimingFunction(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-animation-timing-function", value)
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
public func webkitPerspective(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-webkit-perspective", value.value)
}

public func webkitPerspective(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("-webkit-perspective", value.rawValue)
}

public func webkitPerspective(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-perspective", value)
}

public func mozPerspective(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-moz-perspective", value.value)
}

public func mozPerspective(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("-moz-perspective", value.rawValue)
}

public func mozPerspective(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-perspective", value)
}

public func msPerspective(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-ms-perspective", value.value)
}

public func msPerspective(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("-ms-perspective", value.rawValue)
}

public func msPerspective(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-perspective", value)
}

public func oPerspective(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-o-perspective", value.value)
}

public func oPerspective(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("-o-perspective", value.rawValue)
}

public func oPerspective(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-perspective", value)
}

// MARK: - Perspective Origin

public func webkitPerspectiveOrigin(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-webkit-perspective-origin", value.value)
}

public func webkitPerspectiveOrigin(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("-webkit-perspective-origin", value.value)
}


public func webkitPerspectiveOrigin(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-perspective-origin", value)
}


public func mozPerspectiveOrigin(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-moz-perspective-origin", value.value)
}

public func mozPerspectiveOrigin(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("-moz-perspective-origin", value.value)
}


public func mozPerspectiveOrigin(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-perspective-origin", value)
}


public func msPerspectiveOrigin(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-ms-perspective-origin", value.value)
}

public func msPerspectiveOrigin(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("-ms-perspective-origin", value.value)
}


public func msPerspectiveOrigin(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-perspective-origin", value)
}


public func oPerspectiveOrigin(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-o-perspective-origin", value.value)
}

public func oPerspectiveOrigin(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("-o-perspective-origin", value.value)
}


public func oPerspectiveOrigin(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-o-perspective-origin", value)
}

// MARK: - Border Radius

public func webkitBorderRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-radius", value.value)
}

public func webkitBorderRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-radius", value.value)
}

public func webkitBorderRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-radius", value)
}


public func mozBorderRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-moz-border-radius", value.value)
}

public func mozBorderRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("-moz-border-radius", value.value)
}

public func mozBorderRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-border-radius", value)
}


public func webkitBorderTopLeftRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-top-left-radius", value.value)
}

public func webkitBorderTopLeftRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-top-left-radius", value.value)
}

public func webkitBorderTopLeftRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-top-left-radius", value)
}


public func mozBorderTopLeftRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-moz-border-top-left-radius", value.value)
}

public func mozBorderTopLeftRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("-moz-border-top-left-radius", value.value)
}

public func mozBorderTopLeftRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-border-top-left-radius", value)
}


public func webkitBorderTopRightRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-top-right-radius", value.value)
}

public func webkitBorderTopRightRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-top-right-radius", value.value)
}

public func webkitBorderTopRightRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-top-right-radius", value)
}


public func mozBorderTopRightRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-moz-border-top-right-radius", value.value)
}

public func mozBorderTopRightRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("-moz-border-top-right-radius", value.value)
}

public func mozBorderTopRightRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-border-top-right-radius", value)
}


public func webkitBorderBottomLeftRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-bottom-left-radius", value.value)
}

public func webkitBorderBottomLeftRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-bottom-left-radius", value.value)
}

public func webkitBorderBottomLeftRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-bottom-left-radius", value)
}


public func mozBorderBottomLeftRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-moz-border-bottom-left-radius", value.value)
}

public func mozBorderBottomLeftRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("-moz-border-bottom-left-radius", value.value)
}

public func mozBorderBottomLeftRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-border-bottom-left-radius", value)
}


public func webkitBorderBottomRightRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-bottom-right-radius", value.value)
}

public func webkitBorderBottomRightRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-bottom-right-radius", value.value)
}

public func webkitBorderBottomRightRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-border-bottom-right-radius", value)
}


public func mozBorderBottomRightRadius(_ value: Length) -> CSSDeclaration {
	CSSDeclaration("-moz-border-bottom-right-radius", value.value)
}

public func mozBorderBottomRightRadius(_ value: Percentage) -> CSSDeclaration {
	CSSDeclaration("-moz-border-bottom-right-radius", value.value)
}

public func mozBorderBottomRightRadius(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-border-bottom-right-radius", value)
}

// MARK: - Box Shadow
public func webkitBoxShadow(_ shadows: CSSSpreadShadow...) -> CSSDeclaration {
	let value = shadows.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("-webkit-box-shadow", value)
}

public func webkitBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length, _ position: CSSSpreadShadow.BoxShadowPosition) -> CSSDeclaration {
	webkitBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread),
		position: position
	))
}

public func webkitBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length) -> CSSDeclaration {
	webkitBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread)
	))
}

public func webkitBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length) -> CSSDeclaration {
	webkitBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur)
	))
}

public func webkitBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length) -> CSSDeclaration {
	webkitBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY
	))
}

public func webkitBoxShadow(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-box-shadow", value)
}

public func webkitBoxShadow(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("-webkit-box-shadow", value.rawValue)
}

public func mozBoxShadow(_ shadows: CSSSpreadShadow...) -> CSSDeclaration {
	let value = shadows.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("-moz-box-shadow", value)
}

public func mozBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length, _ position: CSSSpreadShadow.BoxShadowPosition) -> CSSDeclaration {
	mozBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread),
		position: position
	))
}

public func mozBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length) -> CSSDeclaration {
	mozBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread)
	))
}

public func mozBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length) -> CSSDeclaration {
	mozBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur)
	))
}

public func mozBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length) -> CSSDeclaration {
	mozBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY
	))
}

public func mozBoxShadow(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-moz-box-shadow", value)
}

public func mozBoxShadow(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("-moz-box-shadow", value.rawValue)
}

public func msBoxShadow(_ shadows: CSSSpreadShadow...) -> CSSDeclaration {
	let value = shadows.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("-ms-box-shadow", value)
}

public func msBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length, _ position: CSSSpreadShadow.BoxShadowPosition) -> CSSDeclaration {
	msBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread),
		position: position
	))
}

public func msBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length, _ spread: Length) -> CSSDeclaration {
	msBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur),
		spread: CSSSpreadShadow.BoxShadowSpread(spread)
	))
}

public func msBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length, _ blur: Length) -> CSSDeclaration {
	msBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY,
		blur: CSSSpreadShadow.BoxShadowBlur(blur)
	))
}

public func msBoxShadow(_ color: CSSSpreadShadow.BoxShadowColor, _ offsetX: Length, _ offsetY: Length) -> CSSDeclaration {
	msBoxShadow(CSSSpreadShadow(
		color: color,
		offsetX: offsetX,
		offsetY: offsetY
	))
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
	let value = functions.map { $0.value }.joined(separator: " ")
	return CSSDeclaration("filter", value)
}

public func filter(_ value: String) -> CSSDeclaration {
	CSSDeclaration("filter", value)
}

public func filter(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("filter", value.rawValue)
}

public func webkitFilter(_ functions: CSSFilterFunction...) -> CSSDeclaration {
	let value = functions.map { $0.value }.joined(separator: " ")
	return CSSDeclaration("-webkit-filter", value)
}

public func webkitFilter(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-filter", value)
}

public func msFilter(_ functions: CSSFilterFunction...) -> CSSDeclaration {
	let value = functions.map { $0.value }.joined(separator: " ")
	return CSSDeclaration("-ms-filter", value)
}

public func msFilter(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-ms-filter", value)
}

// MARK: - Backdrop Filter
public func backdropFilter(_ functions: CSSFilterFunction...) -> CSSDeclaration {
	let value = functions.map { $0.value }.joined(separator: " ")
	return CSSDeclaration("backdrop-filter", value)
}

public func backdropFilter(_ value: String) -> CSSDeclaration {
	CSSDeclaration("backdrop-filter", value)
}

public func backdropFilter(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("backdrop-filter", value.rawValue)
}

public func webkitBackdropFilter(_ functions: CSSFilterFunction...) -> CSSDeclaration {
	let value = functions.map { $0.value }.joined(separator: " ")
	return CSSDeclaration("-webkit-backdrop-filter", value)
}

public func webkitBackdropFilter(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-backdrop-filter", value)
}

// MARK: - Mask
// mask = <mask-layer>#
public func mask(_ layers: CSSMaskLayer...) -> CSSDeclaration {
	let value = layers.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("mask", value)
}

// Convenience: mask(url, position, size, repeat, operator) - all double values
public func mask(
	_ reference: CSSMaskLayer.MaskReference,
	_ position: (CSSMaskLayer.Position.PositionOne.PositionKeyword, CSSMaskLayer.Position.PositionOne.PositionKeyword),
	_ size: (Length, CSSKeyword.Auto),
	_ repeatStyle: (CSSMaskLayer.RepeatStyle.Repetition, CSSMaskLayer.RepeatStyle.Repetition),
	_ compositingOperator: CSSMaskLayer.CompositingOperator
) -> CSSDeclaration {
	let pos1 = CSSMaskLayer.Position.PositionOne.keyword(position.0)
	let pos2 = CSSMaskLayer.Position.PositionOne.keyword(position.1)
	let posTwo = CSSMaskLayer.Position.PositionTwo(pos1, pos2)
	return mask(CSSMaskLayer(
		reference: reference,
		position: .two(posTwo),
		size: .custom("\(size.0.value) \(size.1.rawValue)"),
		repeatStyle: .repetition(repeatStyle.0, repeatStyle.1),
		compositingOperator: compositingOperator
	))
}

// Convenience: mask(url, position, size, repeat, operator) - single repeat
public func mask(
	_ reference: CSSMaskLayer.MaskReference,
	_ position: (CSSMaskLayer.Position.PositionOne.PositionKeyword, CSSMaskLayer.Position.PositionOne.PositionKeyword),
	_ size: (Length, CSSKeyword.Auto),
	_ repeatStyle: CSSMaskLayer.RepeatStyle.Repetition,
	_ compositingOperator: CSSMaskLayer.CompositingOperator
) -> CSSDeclaration {
	let pos1 = CSSMaskLayer.Position.PositionOne.keyword(position.0)
	let pos2 = CSSMaskLayer.Position.PositionOne.keyword(position.1)
	let posTwo = CSSMaskLayer.Position.PositionTwo(pos1, pos2)
	return mask(CSSMaskLayer(
		reference: reference,
		position: .two(posTwo),
		size: .custom("\(size.0.value) \(size.1.rawValue)"),
		repeatStyle: .repetition(repeatStyle, nil),
		compositingOperator: compositingOperator
	))
}

// Convenience: mask(url, position, size, repeat) - all double
public func mask(
	_ reference: CSSMaskLayer.MaskReference,
	_ position: (CSSMaskLayer.Position.PositionOne.PositionKeyword, CSSMaskLayer.Position.PositionOne.PositionKeyword),
	_ size: (Length, Length),
	_ repeatStyle: (CSSMaskLayer.RepeatStyle.Repetition, CSSMaskLayer.RepeatStyle.Repetition)
) -> CSSDeclaration {
	let pos1 = CSSMaskLayer.Position.PositionOne.keyword(position.0)
	let pos2 = CSSMaskLayer.Position.PositionOne.keyword(position.1)
	let posTwo = CSSMaskLayer.Position.PositionTwo(pos1, pos2)
	return mask(CSSMaskLayer(
		reference: reference,
		position: .two(posTwo),
		size: .twoLengths(size.0, size.1),
		repeatStyle: .repetition(repeatStyle.0, repeatStyle.1)
	))
}

// Convenience: mask(url, position, size, repeat) - single repeat
public func mask(
	_ reference: CSSMaskLayer.MaskReference,
	_ position: (CSSMaskLayer.Position.PositionOne.PositionKeyword, CSSMaskLayer.Position.PositionOne.PositionKeyword),
	_ size: (Length, Length),
	_ repeatStyle: CSSMaskLayer.RepeatStyle.Repetition
) -> CSSDeclaration {
	let pos1 = CSSMaskLayer.Position.PositionOne.keyword(position.0)
	let pos2 = CSSMaskLayer.Position.PositionOne.keyword(position.1)
	let posTwo = CSSMaskLayer.Position.PositionTwo(pos1, pos2)
	return mask(CSSMaskLayer(
		reference: reference,
		position: .two(posTwo),
		size: .twoLengths(size.0, size.1),
		repeatStyle: .repetition(repeatStyle, nil)
	))
}

public func mask(_ value: String) -> CSSDeclaration {
	CSSDeclaration("mask", value)
}

public func mask(_ value: CSSKeyword.None) -> CSSDeclaration {
	CSSDeclaration("mask", value.rawValue)
}

public func webkitMask(_ layers: CSSMaskLayer...) -> CSSDeclaration {
	let value = layers.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("-webkit-mask", value)
}

// Convenience: webkitMask(url, position, size, repeat, operator) - all double values
public func webkitMask(
	_ reference: CSSMaskLayer.MaskReference,
	_ position: (CSSMaskLayer.Position.PositionOne.PositionKeyword, CSSMaskLayer.Position.PositionOne.PositionKeyword),
	_ size: (Length, CSSKeyword.Auto),
	_ repeatStyle: (CSSMaskLayer.RepeatStyle.Repetition, CSSMaskLayer.RepeatStyle.Repetition),
	_ compositingOperator: CSSMaskLayer.CompositingOperator
) -> CSSDeclaration {
	let pos1 = CSSMaskLayer.Position.PositionOne.keyword(position.0)
	let pos2 = CSSMaskLayer.Position.PositionOne.keyword(position.1)
	let posTwo = CSSMaskLayer.Position.PositionTwo(pos1, pos2)
	return webkitMask(CSSMaskLayer(
		reference: reference,
		position: .two(posTwo),
		size: .custom("\(size.0.value) \(size.1.rawValue)"),
		repeatStyle: .repetition(repeatStyle.0, repeatStyle.1),
		compositingOperator: compositingOperator
	))
}

// Convenience: webkitMask(url, position, size, repeat, operator) - single repeat
public func webkitMask(
	_ reference: CSSMaskLayer.MaskReference,
	_ position: (CSSMaskLayer.Position.PositionOne.PositionKeyword, CSSMaskLayer.Position.PositionOne.PositionKeyword),
	_ size: (Length, CSSKeyword.Auto),
	_ repeatStyle: CSSMaskLayer.RepeatStyle.Repetition,
	_ compositingOperator: CSSMaskLayer.CompositingOperator
) -> CSSDeclaration {
	let pos1 = CSSMaskLayer.Position.PositionOne.keyword(position.0)
	let pos2 = CSSMaskLayer.Position.PositionOne.keyword(position.1)
	let posTwo = CSSMaskLayer.Position.PositionTwo(pos1, pos2)
	return webkitMask(CSSMaskLayer(
		reference: reference,
		position: .two(posTwo),
		size: .custom("\(size.0.value) \(size.1.rawValue)"),
		repeatStyle: .repetition(repeatStyle, nil),
		compositingOperator: compositingOperator
	))
}

// Convenience: webkitMask(url, position, size, repeat) - all double
public func webkitMask(
	_ reference: CSSMaskLayer.MaskReference,
	_ position: (CSSMaskLayer.Position.PositionOne.PositionKeyword, CSSMaskLayer.Position.PositionOne.PositionKeyword),
	_ size: (Length, Length),
	_ repeatStyle: (CSSMaskLayer.RepeatStyle.Repetition, CSSMaskLayer.RepeatStyle.Repetition)
) -> CSSDeclaration {
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
) -> CSSDeclaration {
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
public func webkitTextSizeAdjust(_ value: CSSTextSizeAdjust) -> CSSDeclaration {
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

public func webkitTouchCallout(_ value: String) -> CSSDeclaration {
	CSSDeclaration("-webkit-touch-callout", value)
}

// MARK: - Mask Image
// mask-image = <mask-reference>#
public func maskImage(_ references: CSSMaskLayer.MaskReference...) -> CSSDeclaration {
	let value = references.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("mask-image", value)
}

public func maskImage(_ value: String) -> CSSDeclaration {
	CSSDeclaration("mask-image", value)
}

public func webkitMaskImage(_ references: CSSMaskLayer.MaskReference...) -> CSSDeclaration {
	let value = references.map { $0.value }.joined(separator: ", ")
	return CSSDeclaration("-webkit-mask-image", value)
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

#endif
