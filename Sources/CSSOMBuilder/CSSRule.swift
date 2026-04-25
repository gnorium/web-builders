import EmbeddedSwiftUtilities
import WebTypes

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

  public func build(indent: Int = 0, prefix: String = "") -> String {
    let ind = stringRepeating("  ", count: indent)
    switch self {
    case .styleDeclaration(let property, let value, let isImportant):
      let importantSuffix = isImportant ? " !important" : ""
      return "\(ind)\(property): \(value)\(importantSuffix);"

    case .styleRule(let selector, let style):
      let s = stringTrim(selector)
      let fullSelector: String
      if stringIsEmpty(prefix) {
        fullSelector = s
      } else {
        let parts = stringSplit(s, separator: ",")
        var joined = ""
        for (index, part) in parts.enumerated() {
          let trimmedPart = stringTrim(part)
          if !stringIsEmpty(trimmedPart) {
            let separator = (stringStartsWith(trimmedPart, ":") || stringStartsWith(trimmedPart, "[")) ? "" : " "
            joined = "\(joined)\(prefix)\(separator)\(trimmedPart)"
            if index < parts.count - 1 {
              joined = "\(joined), "
            }
          }
        }
        fullSelector = joined
      }

      var declarations = [CSSRule]()
      var nestedRules = [CSSRule]()

      func collect(_ items: [CSSRule]) {
        for item in items {
          switch item {
          case .styleDeclaration:
            declarations.append(item)
          case .fragment(let subItems):
            collect(subItems)
          default:
            nestedRules.append(item)
          }
        }
      }
      collect(style)

      var result = ""
      if declarations.count > 0 {
        var declString = ""
        for (index, d) in declarations.enumerated() {
          declString = "\(declString)\(d.build(indent: indent + 1))"
          if index < declarations.count - 1 {
            declString = "\(declString)\n"
          }
        }
        result = "\(result)\(ind)\(fullSelector) {\n\(declString)\n\(ind)}\n"
      }

      for nested in nestedRules {
        result = "\(result)\(nested.build(indent: indent, prefix: fullSelector))"
      }

      return result

    case .mediaRule(let query, let rules):
      let content = buildItems(rules, indent: indent + 1, prefix: prefix)
      if stringIsEmpty(content) || stringIsEmpty(stringTrim(content)) {
        return ""
      }
      var block = "\(ind)@media \(query) {\n"
      block = "\(block)\(content)"
      if !stringEndsWith(block, "\n") { block = "\(block)\n" }
      block = "\(block)\(ind)}\n"
      return block

    case .fontFaceRule(let style):
      var block = "\(ind)@font-face {\n"
      block = "\(block)\(buildItems(style, indent: indent + 1, prefix: ""))"
      if !stringEndsWith(block, "\n") { block = "\(block)\n" }
      block = "\(block)\(ind)}\n"
      return block

    case .keyframesRule(let name, let rules):
      var block = "\(ind)@keyframes \(name) {\n"
      block = "\(block)\(buildItems(rules, indent: indent + 1, prefix: ""))"
      if !stringEndsWith(block, "\n") { block = "\(block)\n" }
      block = "\(block)\(ind)}\n"
      return block

    case .keyframeRule(let at, let style):
      var block = "\(ind)\(at) {\n"
      block = "\(block)\(buildItems(style, indent: indent + 1, prefix: ""))"
      if !stringEndsWith(block, "\n") { block = "\(block)\n" }
      block = "\(block)\(ind)}\n"
      return block

    case .importRule(let url, let media):
      let mediaSuffix = media.map { " \($0)" } ?? ""
      return "\(ind)@import \"\(url)\"\(mediaSuffix);\n"

    case .raw(let content):
      return content

    case .fragment(let nodes):
      return buildItems(nodes, indent: indent, prefix: prefix)
    }
  }

  private func buildItems(_ items: [CSSRule], indent: Int, prefix: String) -> String {
    var result = ""
    var currentDecls = [CSSRule]()
    let ind = stringRepeating("  ", count: indent)

    func flush() {
      if currentDecls.count > 0 {
        if stringIsEmpty(prefix) {
          for d in currentDecls {
            result = "\(result)\(d.build(indent: indent))\n"
          }
        } else {
          result = "\(result)\(ind)\(prefix) {\n"
          for d in currentDecls {
            result = "\(result)\(d.build(indent: indent + 1))\n"
          }
          result = "\(result)\(ind)}\n"
        }
        currentDecls = []
      }
    }

    for item in items {
      switch item {
      case .styleDeclaration:
        currentDecls.append(item)
      case .fragment(let subItems):
        flush()
        result = "\(result)\(buildItems(subItems, indent: indent, prefix: prefix))"
      default:
        flush()
        let buildd = item.build(indent: indent, prefix: prefix)
        result = "\(result)\(buildd)"
        if !stringEndsWith(buildd, "\n") { result = "\(result)\n" }
      }
    }
    flush()
    return result
  }
}
