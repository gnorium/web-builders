import CSSBuilder
import CSSOMBuilder
import EmbeddedSwiftUtilities
import WebTypes
import DOMBuilder

/// Base protocol for all HTML elements - provides common attributes and methods
public protocol HTMLElementRenderable: HTMLContent {
	var attributes: [(String, String)] { get }
	func addingAttribute(_ key: String, _ value: String) -> Self
}

/// Central helper for processing style blocks with prefix support
/// This ensures DRY - all element types use the same style processing logic
public func processStyleBlock(
	cssItems: [CSSRule],
	prefix: Bool,
	className: String,
	existingStyle: String?
) -> (inlineStyle: String, didAppendGlobalStyles: Bool) {
    var inlineDeclarations: [CSSRule] = []
    var styleRules: [CSSRule] = []
    
    func flatten(_ items: [CSSRule]) {
        for item in items {
            switch item {
            case .styleDeclaration:
                inlineDeclarations.append(item)
            case .fragment(let fragments):
                flatten(fragments)
            default:
                styleRules.append(item)
            }
        }
    }
    
    flatten(cssItems)

	// 1. Build inline style string
	var inlineStyle = ""
	if !inlineDeclarations.isEmpty {
		var newStylePart = ""
        for (index, decl) in inlineDeclarations.enumerated() {
            newStylePart += decl.serialize(indent: 0, prefix: "")
            if index < inlineDeclarations.count - 1 {
                newStylePart += " "
            }
        }

		var styleParts: [String] = []
		if let existing = existingStyle, !existing.isEmpty {
			styleParts.append(existing)
		}
		styleParts.append(newStylePart)

        // Joining and trimming manually to avoid Foundation
        var joined = ""
        for (index, part) in styleParts.enumerated() {
            joined += part
            if index < styleParts.count - 1 { joined += " " }
        }
		inlineStyle = stringTrim(joined)
	}

	// 2. If there are no other rules, we are done
	if styleRules.isEmpty {
		return (inlineStyle, false)
	}

	// 3. Process collected styles natively
    let classParts = className.split(separator: " ")
    var selectorPrefix = ""
    if prefix && !className.isEmpty {
        selectorPrefix = "."
        for (index, part) in classParts.enumerated() {
            selectorPrefix += String(part)
            if index < classParts.count - 1 { selectorPrefix += "." }
        }
    }
    
	var styleContent = ""
	for rule in styleRules {
        styleContent += rule.serialize(indent: 0, prefix: selectorPrefix) + "\n\n"
	}

	// 4. Append to global styles
	if !styleContent.isEmpty {
		HTMLGlobalStyle.shared.append(styleContent)
	}

	return (inlineStyle, !styleContent.isEmpty)
}

/// Default implementations for universal HTML attributes (ARIA, Data, Events, Role)
/// Colliding modifiers (style, class, id) are intentionally omitted here and
/// provided by concrete extensions to resolve modular ambiguity.
extension HTMLElementRenderable {
    // MARK: - Core Style & Identity
    public func `class`(_ value: String) -> Self {
        addingAttribute("class", value)
    }

    public func id(_ value: String) -> Self {
        addingAttribute("id", value)
    }

    public func style(prefix: Bool = true, @CSSBuilder _ content: @Sendable () -> [CSSRule]) -> Self {
        let (inlineStyle, _) = processStyleBlock(
            cssItems: content(),
            prefix: prefix,
            className: attributes.first(where: { $0.0 == "class" })?.1 ?? "",
            existingStyle: attributes.first(where: { $0.0 == "style" })?.1
        )

        return inlineStyle.isEmpty ? self : addingAttribute("style", inlineStyle)
    }

    // MARK: - Core Attributes
	public func title(_ value: String) -> Self {
		addingAttribute("title", value)
	}

	public func lang(_ value: String) -> Self {
		addingAttribute("lang", value)
	}

    public func lang(_ value: HTMLLang) -> Self {
        addingAttribute("lang", value.rawValue)
    }

    public func dir(_ value: String) -> Self {
        addingAttribute("dir", value)
    }

    // MARK: - ARIA & Role
	public func role(_ value: String) -> Self {
		addingAttribute("role", value)
	}

	public func role(_ value: ARIARole) -> Self {
		addingAttribute("role", value.rawValue)
	}

    public func aria(label: String) -> Self {
        addingAttribute("aria-label", label)
    }

    public func aria(hidden: Bool) -> Self {
        addingAttribute("aria-hidden", hidden ? "true" : "false")
    }

    // MARK: - Universal Attributes
	public func data(_ key: String, _ value: String) -> Self {
		addingAttribute("data-\(key)", value)
	}

	public func data(_ key: String, _ value: Bool) -> Self {
		addingAttribute("data-\(key)", value ? "true" : "false")
	}

	public func data(_ key: String, _ value: Int) -> Self {
		addingAttribute("data-\(key)", intToString(value))
	}

	// ARIA attributes
	public func ariaLabel(_ value: String?) -> Self {
		guard let value = value else { return self }
		return addingAttribute("aria-label", value)
	}

	public func ariaHidden(_ value: Bool) -> Self {
		addingAttribute("aria-hidden", value ? "true" : "false")
	}

	public func ariaDisabled(_ value: Bool) -> Self {
		addingAttribute("aria-disabled", value ? "true" : "false")
	}

	public func ariaValueNow(_ value: Int) -> Self {
		addingAttribute("aria-valuenow", intToString(value))
	}

	public func ariaValueMin(_ value: Int) -> Self {
		addingAttribute("aria-valuemin", intToString(value))
	}

	public func ariaValueMax(_ value: Int) -> Self {
		addingAttribute("aria-valuemax", intToString(value))
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

	public func ariaDescribedby(_ value: String?) -> Self {
		guard let value = value else { return self }
		return addingAttribute("aria-describedby", value)
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

	public func ariaControls(_ value: String?) -> Self {
		guard let value = value else { return self }
		return addingAttribute("aria-controls", value)
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

	public func tabindex(_ value: String) -> Self {
		addingAttribute("tabindex", value)
	}

	public func tabindex(_ value: Int) -> Self {
		addingAttribute("tabindex", intToString(value))
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

	public func setAttribute(_ name: String, _ value: String) -> Self {
		addingAttribute(name, value)
	}

	public func setAttribute(_ name: String, _ value: Bool) -> Self {
		addingAttribute(name, value ? "true" : "false")
	}

	public func setAttribute(_ name: String, _ value: Int) -> Self {
		addingAttribute(name, intToString(value))
	}

	public func setAttribute(_ name: String, _ value: Double) -> Self {
		addingAttribute(name, doubleToString(value))
	}
}
