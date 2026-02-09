#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

/// Base protocol for all HTMLProtocol elements - provides common attributes and methods
public protocol HTMLElementProtocol: HTMLProtocol {
	var attributes: [(String, String)] { get }
	func addingAttribute(_ key: String, _ value: String) -> Self
}

/// Escapes HTMLProtocol-special characters in attribute values to prevent injection/breakage.
public func escapeHTMLAttributeValue(_ value: String) -> String {
	value
		.replacingOccurrences(of: "&", with: "&amp;")
		.replacingOccurrences(of: "\"", with: "&quot;")
		.replacingOccurrences(of: "<", with: "&lt;")
		.replacingOccurrences(of: ">", with: "&gt;")
}

/// Central helper for processing style blocks with prefix support
/// This ensures DRY - all element types use the same style processing logic
public func processStyleBlock(
	cssItems: [any CSSProtocol],
	prefix: Bool,
	className: String,
	existingStyle: String?
) -> (inlineStyle: String, didAppendGlobalStyles: Bool) {
	// Separate inline declarations from other rules
	var inlineDeclarations: [CSSDeclaration] = []
	var styleRules: [any CSSProtocol] = []

	for item in cssItems {
		if let declaration = item as? CSSDeclaration {
			inlineDeclarations.append(declaration)
		} else if item is CSSRuleset || item is CSSMedia || item is CSSKeyframes || item is CSSFontFace {
			styleRules.append(item)
		}
	}

	// 1. Build inline style string
	var inlineStyle = ""
	if !inlineDeclarations.isEmpty {
		let newStylePart = inlineDeclarations.map { "\($0.property): \($0.value)" }.joined(separator: "; ")

		var styleParts = [String]()
		if let existing = existingStyle, !existing.isEmpty {
			styleParts.append(existing)
		}
		styleParts.append(newStylePart)

		inlineStyle = styleParts.joined(separator: "; ") + ";"
	}

	// 2. If there are no other rules, we are done
	if styleRules.isEmpty {
		return (inlineStyle, false)
	}

	// 3. Process collected styles (rulesets, media queries, keyframes, font-face)
	let selectorPrefix: String
	if prefix && !className.isEmpty {
		selectorPrefix = "." + className.split(separator: " ").joined(separator: ".")
	} else {
		selectorPrefix = ""
	}

	var styleContent = ""

	// Helper function to recursively process rulesets and their nested rules
	func processRuleset(_ ruleset: CSSRuleset, parentSelector: String, indentLevel: Int = 0) {
		let indent = String(repeating: "  ", count: indentLevel)
		let declIndent = String(repeating: "  ", count: indentLevel + 1)

		// Build the full selector by combining parent with current
		let currentSelector: String
		if parentSelector.isEmpty {
			currentSelector = ruleset.selector
		} else {
			// Combine parent selector with nested selector
			// e.g., ".class:hover" + "> .child" = ".class:hover > .child"
			currentSelector = parentSelector + ruleset.selector
		}

		// Output declarations for this ruleset
		if !ruleset.declarations.isEmpty {
			let declarations = ruleset.declarations.map { "\(declIndent)\($0.property): \($0.value);" }.joined(separator: "\n")
			styleContent += "\(indent)\(currentSelector) {\n\(declarations)\n\(indent)}\n\n"
		}

		// Recursively process nested rules
		for nestedRule in ruleset.nestedRules {
			if let nestedRuleset = nestedRule as? CSSRuleset {
				processRuleset(nestedRuleset, parentSelector: currentSelector, indentLevel: indentLevel)
			}
		}
	}

	for rule in styleRules {
		if let ruleset = rule as? CSSRuleset {
			let shouldPrefix = prefix && !selectorPrefix.isEmpty && !ruleset.selector.hasPrefix("*")
			let baseSelector = shouldPrefix ? selectorPrefix : ""
			processRuleset(ruleset, parentSelector: baseSelector)
		} else if let mediaAtRule = rule as? CSSMedia {
			// Separate declarations from rulesets in media query
			var mediaDeclarations: [CSSDeclaration] = []
			var mediaRulesets: [CSSRuleset] = []

			for mediaRule in mediaAtRule.rules {
				if let declaration = mediaRule as? CSSDeclaration {
					mediaDeclarations.append(declaration)
				} else if let ruleset = mediaRule as? CSSRuleset {
					mediaRulesets.append(ruleset)
				}
			}

			var mediaContent = ""

			// If there are direct declarations, wrap them in the element's selector
			if !mediaDeclarations.isEmpty {
				let declarations = mediaDeclarations.map { "    \($0.property): \($0.value);" }.joined(separator: "\n")
				if prefix && !selectorPrefix.isEmpty {
					mediaContent += "  \(selectorPrefix) {\n\(declarations)\n  }\n"
				} else {
					// No prefix - this shouldn't happen for component styles, but handle it
					let decls = mediaDeclarations.map { "  \($0.property): \($0.value);" }.joined(separator: "\n")
					mediaContent += "\(decls)\n"
				}
			}

			// Add any rulesets (pseudo-classes, etc.) - now with nested rule support
			for ruleset in mediaRulesets {
				let shouldPrefixMedia = prefix && !selectorPrefix.isEmpty && !ruleset.selector.hasPrefix("*")
				let baseSelector = shouldPrefixMedia ? selectorPrefix : ""

				// Use a local helper for media query context
				func processMediaRuleset(_ rs: CSSRuleset, parentSelector: String) {
					let currentSelector: String
					if parentSelector.isEmpty {
						currentSelector = rs.selector
					} else {
						currentSelector = parentSelector + rs.selector
					}

					if !rs.declarations.isEmpty {
						let declarations = rs.declarations.map { "    \($0.property): \($0.value);" }.joined(separator: "\n")
						mediaContent += "  \(currentSelector) {\n\(declarations)\n  }\n"
					}

					for nestedRule in rs.nestedRules {
						if let nestedRuleset = nestedRule as? CSSRuleset {
							processMediaRuleset(nestedRuleset, parentSelector: currentSelector)
						}
					}
				}

				processMediaRuleset(ruleset, parentSelector: baseSelector)
			}

			if !mediaContent.isEmpty {
				styleContent += "@media \(mediaAtRule.condition) {\n\(mediaContent.trimmingCharacters(in: .newlines))\n}\n\n"
			}
		} else if let keyframesAtRule = rule as? CSSKeyframes {
			styleContent += keyframesAtRule.render() + "\n\n"
		} else if let fontFaceAtRule = rule as? CSSFontFace {
			styleContent += fontFaceAtRule.render() + "\n\n"
		}
	}

	// 4. Append to global styles
	if !styleContent.isEmpty {
		HTMLGlobalStyle.shared.append(styleContent)
	}

	return (inlineStyle, !styleContent.isEmpty)
}

/// Default implementations for common HTMLProtocol attributes and methods
extension HTMLElementProtocol {
	public func `class`(_ value: String) -> Self {
		addingAttribute("class", value)
	}

	public func id(_ value: String) -> Self {
		addingAttribute("id", value)
	}

	public func title(_ value: String) -> Self {
		addingAttribute("title", value)
	}

	public func role(_ value: String) -> Self {
		addingAttribute("role", value)
	}

	public func role(_ value: ARIARole) -> Self {
		addingAttribute("role", value.rawValue)
	}

	// Data attributes
	public func data(_ key: String, _ value: String) -> Self {
		addingAttribute("data-\(key)", value)
	}

	public func data(_ key: String, _ value: Bool) -> Self {
		addingAttribute("data-\(key)", value ? "true" : "false")
	}

	public func data(_ key: String, _ value: Int) -> Self {
		addingAttribute("data-\(key)", "\(value)")
	}

	// ARIA attributes
	public func ariaLabel(_ value: String) -> Self {
		addingAttribute("aria-label", value)
	}

	public func ariaHidden(_ value: Bool) -> Self {
		addingAttribute("aria-hidden", value ? "true" : "false")
	}

	public func ariaDisabled(_ value: Bool) -> Self {
		addingAttribute("aria-disabled", value ? "true" : "false")
	}

	public func ariaValueNow(_ value: Int) -> Self {
		addingAttribute("aria-valuenow", "\(value)")
	}

	public func ariaValueMin(_ value: Int) -> Self {
		addingAttribute("aria-valuemin", "\(value)")
	}

	public func ariaValueMax(_ value: Int) -> Self {
		addingAttribute("aria-valuemax", "\(value)")
	}

	public func ariaExpanded(_ value: String) -> Self {
		addingAttribute("aria-expanded", value)
	}

	public func ariaExpanded(_ value: Bool) -> Self {
		addingAttribute("aria-expanded", value ? "true" : "false")
	}

	public func ariaPressed(_ value: Bool) -> Self {
		addingAttribute("aria-pressed", value ? "true" : "false")
	}

	public func ariaPressed(_ value: String) -> Self {
		addingAttribute("aria-pressed", value)
	}

	public func ariaLive(_ value: String) -> Self {
		addingAttribute("aria-live", value)
	}

	public func ariaDescribedby(_ value: String) -> Self {
		addingAttribute("aria-describedby", value)
	}

	public func ariaBusy(_ value: Bool) -> Self {
		addingAttribute("aria-busy", value ? "true" : "false")
	}

	public func ariaModal(_ value: Bool) -> Self {
		addingAttribute("aria-modal", value ? "true" : "false")
	}

	public func ariaSelected(_ value: Bool) -> Self {
		addingAttribute("aria-selected", value ? "true" : "false")
	}

	public func ariaMultiselectable(_ value: Bool) -> Self {
		addingAttribute("aria-multiselectable", value ? "true" : "false")
	}

	public func ariaInvalid(_ value: Bool) -> Self {
		addingAttribute("aria-invalid", value ? "true" : "false")
	}

	public func ariaHaspopup(_ value: ARIAHaspopup) -> Self {
		addingAttribute("aria-haspopup", value.rawValue)
	}

	public func ariaHaspopup(_ value: String) -> Self {
		addingAttribute("aria-haspopup", value)
	}

	public func ariaAutocomplete(_ value: String) -> Self {
		addingAttribute("aria-autocomplete", value)
	}

	public func ariaControls(_ value: String) -> Self {
		addingAttribute("aria-controls", value)
	}

	public func ariaLabelledby(_ value: String?) -> Self {
		guard let value = value else { return self }
		return addingAttribute("aria-labelledby", value)
	}

	public func ariaCurrent(_ value: ARIACurrent) -> Self {
		addingAttribute("aria-current", value.rawValue)
	}

	public func ariaCurrent(_ value: String) -> Self {
		addingAttribute("aria-current", value)
	}

	public func tabindex(_ value: Int) -> Self {
		addingAttribute("tabindex", "\(value)")
	}

	// Event attributes
	public func onclick(_ value: String) -> Self {
		addingAttribute("onclick", value)
	}

	public func onchange(_ value: String) -> Self {
		addingAttribute("onchange", value)
	}

	public func onsubmit(_ value: String) -> Self {
		addingAttribute("onsubmit", value)
	}

	public func oninput(_ value: String) -> Self {
		addingAttribute("oninput", value)
	}

	public func onfocus(_ value: String) -> Self {
		addingAttribute("onfocus", value)
	}

	public func onblur(_ value: String) -> Self {
		addingAttribute("onblur", value)
	}

	public func onkeydown(_ value: String) -> Self {
		addingAttribute("onkeydown", value)
	}

	public func onkeyup(_ value: String) -> Self {
		addingAttribute("onkeyup", value)
	}

	public func onmouseenter(_ value: String) -> Self {
		addingAttribute("onmouseenter", value)
	}

	public func onmouseleave(_ value: String) -> Self {
		addingAttribute("onmouseleave", value)
	}

	// Boolean attributes
	public func hidden(_ value: Bool = true) -> Self {
		value ? addingAttribute("hidden", "hidden") : self
	}
}

#endif
