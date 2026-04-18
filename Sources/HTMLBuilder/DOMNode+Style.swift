import DOMBuilder
import CSSBuilder
import WebTypes

extension DOMNode {
    /// Ergonomic style modifier that integrates with CSSBuilder.
    /// This handles both inline styles and automatic extraction to global styles if needed.
    public func style(prefix: Bool = true, @CSSBuilder _ content: @Sendable () -> [AnyCSSContent]) -> DOMNode {
        guard case .element(_, _, let attrs, _, _, _) = self else {
            return self
        }
        
        let existingStyle = attrs.first(where: { $0.0 == "style" })?.1
        let className = attrs.first(where: { $0.0 == "class" })?.1 ?? ""
        
        let (inlineStyle, _) = processStyleBlock(
            cssItems: content(),
            prefix: prefix,
            className: className,
            existingStyle: existingStyle
        )

        return inlineStyle.isEmpty ? self : addingAttribute("style", inlineStyle)
    }

    // Common style-related individual modifiers
    public func opacity(_ value: Double) -> DOMNode { addingAttribute("opacity", "\(value)") }
    public func opacity(_ value: String) -> DOMNode { addingAttribute("opacity", value) }
    public func clipPath(_ value: String) -> DOMNode { addingAttribute("clip-path", value) }
}
