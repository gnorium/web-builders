import WebTypes

/// The shared core result builder for all DOM-like content.
@resultBuilder
public struct DOMBuilder {
    public static func buildBlock(_ components: [DOMNode]...) -> [DOMNode] {
        components.flatMap { $0 }
    }
    
    public static func buildExpression(_ node: DOMNode) -> [DOMNode] {
        [node]
    }
    
    public static func buildExpression(_ string: String) -> [DOMNode] {
        [.text(string)]
    }
    
    public static func buildExpression(_ convertible: some DOMNodeConvertible) -> [DOMNode] {
        [convertible.toNode()]
    }
    
    public static func buildExpression(_ nodes: [DOMNode]) -> [DOMNode] {
        nodes
    }
    
    public static func buildOptional(_ component: [DOMNode]?) -> [DOMNode] {
        component ?? []
    }
    
    public static func buildEither(first component: [DOMNode]) -> [DOMNode] {
        component
    }
    
    public static func buildEither(second component: [DOMNode]) -> [DOMNode] {
        component
    }
    
    public static func buildArray(_ components: [[DOMNode]]) -> [DOMNode] {
        components.flatMap { $0 }
    }
    
    public static func buildLimitedAvailability(_ component: [DOMNode]) -> [DOMNode] {
        component
    }
}
