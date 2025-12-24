#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

/// Base protocol for all HTML elements - provides common attributes and methods
public protocol HTMLElement: HTML {
	var attributes: [(String, String)] { get }
	func addingAttribute(_ key: String, _ value: String) -> Self
}

/// Central helper for processing style blocks with prefix support
/// This ensures DRY - all element types use the same style processing logic
public func processStyleBlock(
	cssItems: [CSS],
	prefix: Bool,
	className: String,
	existingStyle: String?
) -> (inlineStyle: String, didAppendGlobalStyles: Bool) {
	// Separate inline declarations from other rules
	var inlineDeclarations: [CSSDeclaration] = []
	var styleRules: [CSS] = []

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

	for rule in styleRules {
		if let ruleset = rule as? CSSRuleset {
			let declarations = ruleset.declarations.map { "  \($0.property): \($0.value);" }.joined(separator: "\n")
			let shouldPrefix = prefix && !selectorPrefix.isEmpty && !ruleset.selector.hasPrefix("*")
			let finalSelector = shouldPrefix
				? "\(selectorPrefix)\(ruleset.selector)"
				: ruleset.selector

			if !declarations.isEmpty {
				styleContent += "\(finalSelector) {\n\(declarations)\n}\n\n"
			}
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

			// Add any rulesets (pseudo-classes, etc.)
			for ruleset in mediaRulesets {
				let declarations = ruleset.declarations.map { "    \($0.property): \($0.value);" }.joined(separator: "\n")
				let shouldPrefixMedia = prefix && !selectorPrefix.isEmpty && !ruleset.selector.hasPrefix("*")
				if shouldPrefixMedia {
					mediaContent += "  \(selectorPrefix)\(ruleset.selector) {\n\(declarations)\n  }\n"
				} else {
					mediaContent += "  \(ruleset.selector) {\n\(declarations)\n  }\n"
				}
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

/// Default implementations for common HTML attributes and methods
extension HTMLElement {
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

	public func tabIndex(_ value: Int) -> Self {
		addingAttribute("tabindex", "\(value)")
	}
}

#endif
