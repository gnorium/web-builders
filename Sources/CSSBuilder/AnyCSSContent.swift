import WebTypes

/// Manual type-erasure wrapper for CSSContent.
/// Used to avoid protocol existentials (`any CSSContent`) which are
/// strictly limited in minimal runtime environments.
public struct AnyCSSContent: CSSContent {
    private let renderClosure: @Sendable (String, Int) -> String
    private let cssRuleTypeClosure: @Sendable () -> CSSRuleType

    public init(_ content: CSSDeclaration) {
        self.renderClosure = { prefix, indent in content.render(prefix: prefix, indent: indent) }
        self.cssRuleTypeClosure = { content.cssRuleType }
    }

    public init(_ content: CSSRuleset) {
        self.renderClosure = { prefix, indent in content.render(prefix: prefix, indent: indent) }
        self.cssRuleTypeClosure = { content.cssRuleType }
    }

    public init(_ content: CSSPseudoClass) {
        self.renderClosure = { prefix, indent in content.render(prefix: prefix, indent: indent) }
        self.cssRuleTypeClosure = { content.cssRuleType }
    }

    public init(_ content: CSSPseudoElement) {
        self.renderClosure = { prefix, indent in content.render(prefix: prefix, indent: indent) }
        self.cssRuleTypeClosure = { content.cssRuleType }
    }

    public init(_ content: CSSMedia) {
        self.renderClosure = { prefix, indent in content.render(prefix: prefix, indent: indent) }
        self.cssRuleTypeClosure = { content.cssRuleType }
    }

    public init(_ content: CSSFontFace) {
        self.renderClosure = { prefix, indent in content.render(prefix: prefix, indent: indent) }
        self.cssRuleTypeClosure = { content.cssRuleType }
    }

    public init(_ content: CSSKeyframes) {
        self.renderClosure = { prefix, indent in content.render(prefix: prefix, indent: indent) }
        self.cssRuleTypeClosure = { content.cssRuleType }
    }

    public init(_ content: CSSKeyframe) {
        self.renderClosure = { prefix, indent in content.render(prefix: prefix, indent: indent) }
        self.cssRuleTypeClosure = { content.cssRuleType }
    }

    public init(_ content: CSSImport) {
        self.renderClosure = { prefix, indent in content.render(prefix: prefix, indent: indent) }
        self.cssRuleTypeClosure = { content.cssRuleType }
    }
    
    /// Generic initializer for custom components and other CSSContent types.
    public init<T: CSSContent>(_ content: T) {
        self.renderClosure = { prefix, indent in content.render(prefix: prefix, indent: indent) }
        self.cssRuleTypeClosure = { content.cssRuleType }
    }

    #if !os(WASI)
    
    public init(_ content: any CSSContent) {
        self.renderClosure = { prefix, indent in content.render(prefix: prefix, indent: indent) }
        self.cssRuleTypeClosure = { content.cssRuleType }
    }
    
    #endif

    public init(render: @escaping @Sendable (String, Int) -> String, cssRuleType: @escaping @Sendable () -> CSSRuleType) {
        self.renderClosure = render
        self.cssRuleTypeClosure = cssRuleType
    }

    public func render(prefix: String, indent: Int) -> String {
        renderClosure(prefix, indent)
    }

    public var cssRuleType: CSSRuleType {
        cssRuleTypeClosure()
    }
}

extension Array where Element == AnyCSSContent {
    public mutating func append(_ element: CSSDeclaration) { self.append(AnyCSSContent(element)) }
    public mutating func append(_ element: CSSRuleset) { self.append(AnyCSSContent(element)) }
    public mutating func append(_ element: CSSPseudoClass) { self.append(AnyCSSContent(element)) }
    public mutating func append(_ element: CSSPseudoElement) { self.append(AnyCSSContent(element)) }
    public mutating func append(_ element: CSSMedia) { self.append(AnyCSSContent(element)) }
    public mutating func append(_ element: CSSFontFace) { self.append(AnyCSSContent(element)) }
    public mutating func append(_ element: CSSKeyframes) { self.append(AnyCSSContent(element)) }
    public mutating func append(_ element: CSSKeyframe) { self.append(AnyCSSContent(element)) }
    public mutating func append(_ element: CSSImport) { self.append(AnyCSSContent(element)) }

    public init<T: CSSContent>(_ array: [T]) {
        self = array.map { AnyCSSContent($0) }
    }
}
