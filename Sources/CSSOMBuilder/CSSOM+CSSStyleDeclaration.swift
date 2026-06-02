import EmbeddedSwiftUtilities
import WebTypes

/// https://drafts.csswg.org/cssom/#the-cssstyledeclaration-interface
extension CSSOM {
  open class CSSStyleDeclaration: @unchecked Sendable {
    private var entries: [(String, String, Bool)] = []  // property, value, important

    /// Nested rules captured when a declaration-context `@CSSBuilder` block (e.g.
    /// inside `pseudoClass`/`nextSibling`/`selector`) contains nested rules. These
    /// are flattened against the owning rule's selector by `CSSStyleRule.cssText`.
    public var nestedRules: [CSSOM.CSSRule] = []

    public init() {}

    public var length: Int { entries.count }

    public var cssText: String {
      var parts: [String] = []
      for (property, value, important) in entries {
        let suffix = important ? " !important" : ""
        parts.append("\(property): \(value)\(suffix);")
      }
      return stringJoin(parts, separator: " ")
    }

    open func getPropertyValue(_ property: String) -> String {
      for entry in entries {
        if stringEquals(entry.0, property) { return entry.1 }
      }
      return ""
    }

    public func getPropertyPriority(_ property: String) -> String {
      for entry in entries {
        if stringEquals(entry.0, property) { return entry.2 ? "important" : "" }
      }
      return ""
    }

    open func setProperty(_ property: String, _ value: String, _ priority: String = "") {
      let important = stringEquals(priority, "important")
      for i in 0..<entries.count {
        if stringEquals(entries[i].0, property) {
          entries[i] = (property, value, important)
          return
        }
      }
      entries.append((property, value, important))
    }

    open func removeProperty(_ property: String) -> String {
      for i in 0..<entries.count {
        if stringEquals(entries[i].0, property) {
          let value = entries[i].1
          entries.remove(at: i)
          return value
        }
      }
      return ""
    }

    public func forEach(_ body: (String, String, String) -> Void) {
      for (prop, val, important) in entries {
        body(prop, val, important ? "important" : "")
      }
    }

    func renderLines(indent: Int) -> String {
      var result = ""
      let ind = stringRepeating("  ", count: indent)
      for (property, value, important) in entries {
        let suffix = important ? " !important" : ""
        result = "\(result)\(ind)\(property): \(value)\(suffix);\n"
      }
      return result
    }
  }
}
