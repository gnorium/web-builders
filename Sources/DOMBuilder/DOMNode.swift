import WebTypes
import EmbeddedSwiftUtilities

public enum DOMNamespace: String, Sendable {
    case html = "http://www.w3.org/1999/xhtml"
    case svg = "http://www.w3.org/2000/svg"
}

/// The unified Node structure for both HTML and SVG.
/// "Namespaces differentiate meaning—not types."
public enum DOMNode: Sendable {
    case element(
        ns: DOMNamespace,
        tag: String,
        attributes: [(String, String)],
        children: [DOMNode],
        selfClosing: Bool = false,
        inline: Bool = false
    )
    case text(String, isRaw: Bool = false)
    case fragment([DOMNode])

    // MARK: - Rendering
    
    public func render(indent: Int = 0) -> String {
        switch self {
        case .element(_, let tag, let attrs, let children, let selfClosing, let inline):
            let ind = String(repeating: "  ", count: indent)
            let attrString = renderAttributes(attrs)
            
            if selfClosing {
                return ind + "<\(tag)\(attrString) />"
            }
            
            let open = "<\(tag)\(attrString)>"
            let close = "</\(tag)>"
            
            if children.isEmpty {
                return ind + open + close
            }
            
            // Optimization for single text line
            if children.count == 1, case .text(let content, let isRaw) = children[0], !content.contains("\n"), !isRaw {
                return ind + open + content + close
            }
            
            if inline {
                var inner = ""
                for child in children {
                    inner += child.render(indent: 0)
                }
                return ind + open + inner + close
            }
            
            var inner = ""
            var actualCount = 0
            for child in children {
                let rendered = child.render(indent: indent + 1)
                if !rendered.isEmpty {
                    if actualCount > 0 { inner += "\n" }
                    inner += rendered
                    actualCount += 1
                }
            }
            
            if actualCount == 0 {
                return ind + open + close
            }
            
            return "\(ind)\(open)\n\(inner)\n\(ind)\(close)"
            
        case .text(let content, let isRaw):
            if isRaw { return content }
            
            let lines = stringSplit(content, separator: "\n")
            let ind = String(repeating: "  ", count: indent)
            var result = ""
            for (index, line) in lines.enumerated() {
                if !line.isEmpty {
                    result += ind + line
                }
                if index < lines.count - 1 {
                    result += "\n"
                }
            }
            return result
            
        case .fragment(let nodes):
            var result = ""
            for (index, node) in nodes.enumerated() {
                result += node.render(indent: indent)
                if index < nodes.count - 1 {
                    result += "\n"
                }
            }
            return result
        }
    }

    private func renderAttributes(_ attrs: [(String, String)]) -> String {
        guard !attrs.isEmpty else { return "" }
        return " " + attrs
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
    }
    
    public var nodeType: HTMLNodeType {
        switch self {
        case .element: return .elementNode
        case .text: return .textNode
        case .fragment: return .documentFragmentNode
        }
    }
    
    public var textContent: String? {
        switch self {
        case .element(_, _, _, let children, _, _):
            var text = ""
            for child in children {
                if let tc = child.textContent {
                    text += tc
                }
            }
            return text
        case .text(let s, _):
            return s
        case .fragment(let nodes):
            var text = ""
            for node in nodes {
                if let tc = node.textContent {
                    text += tc
                }
            }
            return text
        }
    }
}

// MARK: - Modifiers Base Logic

extension DOMNode {
    /// Returns a new Node with the attribute added or updated.
    public func addingAttribute(_ key: String, _ value: String) -> DOMNode {
        guard case .element(let ns, let tag, var attrs, let children, let selfClosing, let inline) = self else {
            return self
        }
        
        attrs.removeAll { $0.0 == key }
        attrs.append((key, value))
        
        return .element(ns: ns, tag: tag, attributes: attrs, children: children, selfClosing: selfClosing, inline: inline)
    }
    
    /// Updates children of an existing element node.
    public func withChildren(_ newChildren: [DOMNode]) -> DOMNode {
        guard case .element(let ns, let tag, let attrs, _, let selfClosing, let inline) = self else {
            return self
        }
        return .element(ns: ns, tag: tag, attributes: attrs, children: newChildren, selfClosing: selfClosing, inline: inline)
    }

    // MARK: - Universal Modifiers
    
    public func id(_ value: String) -> DOMNode { addingAttribute("id", value) }
    public func `class`(_ value: String) -> DOMNode { addingAttribute("class", value) }
    public func title(_ value: String) -> DOMNode { addingAttribute("title", value) }
    
    public func aria(_ key: String, _ value: String) -> DOMNode { addingAttribute("aria-\(key)", value) }
    public func aria(_ key: String, _ value: Bool) -> DOMNode { addingAttribute("aria-\(key)", value ? "true" : "false") }
}

extension DOMNode: DOMNodeConvertible {
    public func toNode() -> DOMNode { self }
}

/// Escapes HTMLAttribute-special characters in attribute values.
public func escapeHTMLAttributeValue(_ value: String) -> String {
    let s1 = stringReplace(value, "&", "&amp;")
    let s2 = stringReplace(s1, "\"", "&quot;")
    let s3 = stringReplace(s2, "<", "&lt;")
    return stringReplace(s3, ">", "&gt;")
}
