import WebTypes
import EmbeddedSwiftUtilities

/// The unified Rule structure for CSS Object Model (CSSOM).
/// Matches the W3C CSSRule interface exactly.
public enum CSSRule: Sendable {
    /// Interface: CSSStyleRule
    case styleRule(selector: String, style: [CSSRule])
    
    /// Interface: CSSMediaRule
    case mediaRule(condition: String, rules: [CSSRule])
    
    /// Interface: CSSFontFaceRule
    case fontFaceRule(style: [CSSRule])
    
    /// Interface: CSSKeyframesRule
    case keyframesRule(name: String, rules: [CSSRule])
    
    /// Interface: CSSKeyframeRule
    case keyframeRule(keyText: String, style: [CSSRule])
    
    /// Interface: CSSImportRule
    case importRule(url: String, media: String? = nil)

    /// Interface: CSSStyleDeclaration (property: value pair)
    case styleDeclaration(property: String, value: String, isImportant: Bool = false)
    
    case raw(String)
    case fragment([CSSRule])

    // MARK: - Serialization

    public func serialize(indent: Int = 0, prefix: String = "") -> String {
        switch self {
        case .styleDeclaration(let property, let value, let isImportant):
            let ind = String(repeating: "  ", count: indent)
            let importantSuffix = isImportant ? " !important" : ""
            return "\(ind)\(property): \(value)\(importantSuffix);"

        case .styleRule(let selector, let style):
            let ind = String(repeating: "  ", count: indent)
            
            let fullSelector: String
            if prefix.isEmpty {
                fullSelector = selector
            } else {
                if selector.hasPrefix(":") || selector.hasPrefix("[") || selector.hasPrefix(".") || selector.hasPrefix("#") {
                    fullSelector = prefix + selector
                } else {
                    fullSelector = prefix + " " + selector
                }
            }

            var declarations = [CSSRule]()
            var nestedRules = [CSSRule]()
            
            for item in style {
                switch item {
                case .styleDeclaration:
                    declarations.append(item)
                default:
                    nestedRules.append(item)
                }
            }

            var result = ""
            if !declarations.isEmpty {
                var declString = ""
                for (index, d) in declarations.enumerated() {
                    declString += d.serialize(indent: indent + 1)
                    if index < declarations.count - 1 {
                        declString += "\n"
                    }
                }
                result += "\(ind)\(fullSelector) {\n\(declString)\n\(ind)}\n\n"
            }

            for nested in nestedRules {
                result += nested.serialize(indent: indent, prefix: fullSelector)
            }
            
            return result

        case .mediaRule(let query, let rules):
            let ind = String(repeating: "  ", count: indent)
            var inner = ""
            for (index, item) in rules.enumerated() {
                inner += item.serialize(indent: indent + 1, prefix: prefix)
                if index < rules.count - 1 {
                    inner += "\n"
                }
            }
            return "\(ind)@media \(query) {\n\(inner)\n\(ind)}\n"

        case .fontFaceRule(let style):
            let ind = String(repeating: "  ", count: indent)
            var inner = ""
            for (index, item) in style.enumerated() {
                inner += item.serialize(indent: indent + 1)
                if index < style.count - 1 {
                    inner += "\n"
                }
            }
            return "\(ind)@font-face {\n\(inner)\n\(ind)}\n"

        case .keyframesRule(let name, let rules):
            let ind = String(repeating: "  ", count: indent)
            var inner = ""
            for (index, item) in rules.enumerated() {
                inner += item.serialize(indent: indent + 1)
                if index < rules.count - 1 {
                    inner += "\n"
                }
            }
            return "\(ind)@keyframes \(name) {\n\(inner)\n\(ind)}\n"

        case .keyframeRule(let at, let style):
            let ind = String(repeating: "  ", count: indent)
            var inner = ""
            for (index, item) in style.enumerated() {
                inner += item.serialize(indent: indent + 1)
                if index < style.count - 1 {
                    inner += "\n"
                }
            }
            return "\(ind)\(at) {\n\(inner)\n\(ind)}"

        case .importRule(let url, let media):
            let ind = String(repeating: "  ", count: indent)
            let mediaSuffix = media.map { " \($0)" } ?? ""
            return "\(ind)@import \"\(url)\"\(mediaSuffix);"

        case .raw(let content):
            return content

        case .fragment(let nodes):
            var result = ""
            for (index, node) in nodes.enumerated() {
                result += node.serialize(indent: indent, prefix: prefix)
                if index < nodes.count - 1 {
                    result += "\n"
                }
            }
            return result
        }
    }
}
