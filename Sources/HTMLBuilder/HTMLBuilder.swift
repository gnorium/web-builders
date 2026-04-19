#if CLIENT

import EmbeddedSwiftUtilities

#endif

import DOMBuilder
import WebTypes
import JSONLDFormat
import JSONImportMapFormat

@resultBuilder
public struct HTMLBuilder {
    public static func buildBlock(_ components: [DOMNode]...) -> [DOMNode] {
        var result = [DOMNode]()
        for component in components {
            result.append(contentsOf: component)
        }
        return result
    }
    
    public static func buildExpression(_ string: String) -> [DOMNode] {
        [.text(string)]
    }
    
    @_disfavoredOverload
    public static func buildExpression(_ convertible: some DOMNodeConvertible) -> [DOMNode] {
        [convertible.render()]
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

    public static func build(@HTMLBuilder _ content: () -> [DOMNode]) -> [DOMNode] {
        content()
    }

    /// Helper for generating raw HTML strings.
    public static func serialize(@HTMLBuilder _ content: () -> [DOMNode]) -> String {
        let items = content()
        var result = ""
        for (index, item) in items.enumerated() {
            result += item.serialize(indent: 0)
            if index < items.count - 1 {
                result += "\n"
            }
        }
        return result
    }
}
