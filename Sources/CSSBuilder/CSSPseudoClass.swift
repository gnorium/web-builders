import CSSOMBuilder
import WebTypes

#if SERVER
  public enum CSSPseudoClass: String, CSSContent, Equatable {
    case root = ":root"
    case hover = ":hover"
    case focus = ":focus"
    case focusVisible = ":focus-visible"
    case focusWithin = ":focus-within"
    case active = ":active"
    case visited = ":visited"
    case link = ":link"
    case disabled = ":disabled"
    case enabled = ":enabled"
    case checked = ":checked"
    case indeterminate = ":indeterminate"
    case firstChild = ":first-child"
    case lastChild = ":last-child"
    case nthChild = ":nth-child"
    case nthOfType = ":nth-of-type"
    case firstOfType = ":first-of-type"
    case lastOfType = ":last-of-type"
    case onlyChild = ":only-child"
    case onlyOfType = ":only-of-type"
    case empty = ":empty"
    case target = ":target"
    case optional = ":optional"
    case required = ":required"
    case valid = ":valid"
    case invalid = ":invalid"
    case inRange = ":in-range"
    case outOfRange = ":out-of-range"
    case readOnly = ":read-only"
    case readWrite = ":read-write"

    public static func not(_ pseudoClass: CSSPseudoClass) -> String {
      ":not(\(pseudoClass.rawValue))"
    }

    public static func not(_ selector: String) -> String {
      ":not(\(selector))"
    }

    public func render() -> CSSRule {
      .raw("")
    }

    public var cssRuleType: CSSRuleType { .styleRule }
  }
#endif

#if CLIENT
  import EmbeddedSwiftUtilities

  public enum CSSPseudoClass: CSSContent, Equatable, RawRepresentable {
    case root
    case hover
    case focus
    case focusVisible
    case focusWithin
    case active
    case visited
    case link
    case disabled
    case enabled
    case checked
    case indeterminate
    case firstChild
    case lastChild
    case nthChild
    case nthOfType
    case firstOfType
    case lastOfType
    case onlyChild
    case onlyOfType
    case empty
    case target
    case optional
    case required
    case valid
    case invalid
    case inRange
    case outOfRange
    case readOnly
    case readWrite

    public var rawValue: String {
      switch self {
      case .root: return ":root"
      case .hover: return ":hover"
      case .focus: return ":focus"
      case .focusVisible: return ":focus-visible"
      case .focusWithin: return ":focus-within"
      case .active: return ":active"
      case .visited: return ":visited"
      case .link: return ":link"
      case .disabled: return ":disabled"
      case .enabled: return ":enabled"
      case .checked: return ":checked"
      case .indeterminate: return ":indeterminate"
      case .firstChild: return ":first-child"
      case .lastChild: return ":last-child"
      case .nthChild: return ":nth-child"
      case .nthOfType: return ":nth-of-type"
      case .firstOfType: return ":first-of-type"
      case .lastOfType: return ":last-of-type"
      case .onlyChild: return ":only-child"
      case .onlyOfType: return ":only-of-type"
      case .empty: return ":empty"
      case .target: return ":target"
      case .optional: return ":optional"
      case .required: return ":required"
      case .valid: return ":valid"
      case .invalid: return ":invalid"
      case .inRange: return ":in-range"
      case .outOfRange: return ":out-of-range"
      case .readOnly: return ":read-only"
      case .readWrite: return ":read-write"
      }
    }

    public init?(rawValue: String) {
      if stringEquals(rawValue, ":root") {
        self = .root
      } else if stringEquals(rawValue, ":hover") {
        self = .hover
      } else if stringEquals(rawValue, ":focus") {
        self = .focus
      } else if stringEquals(rawValue, ":focus-visible") {
        self = .focusVisible
      } else if stringEquals(rawValue, ":focus-within") {
        self = .focusWithin
      } else if stringEquals(rawValue, ":active") {
        self = .active
      } else if stringEquals(rawValue, ":visited") {
        self = .visited
      } else if stringEquals(rawValue, ":link") {
        self = .link
      } else if stringEquals(rawValue, ":disabled") {
        self = .disabled
      } else if stringEquals(rawValue, ":enabled") {
        self = .enabled
      } else if stringEquals(rawValue, ":checked") {
        self = .checked
      } else if stringEquals(rawValue, ":indeterminate") {
        self = .indeterminate
      } else if stringEquals(rawValue, ":first-child") {
        self = .firstChild
      } else if stringEquals(rawValue, ":last-child") {
        self = .lastChild
      } else if stringEquals(rawValue, ":nth-child") {
        self = .nthChild
      } else if stringEquals(rawValue, ":nth-of-type") {
        self = .nthOfType
      } else if stringEquals(rawValue, ":first-of-type") {
        self = .firstOfType
      } else if stringEquals(rawValue, ":last-of-type") {
        self = .lastOfType
      } else if stringEquals(rawValue, ":only-child") {
        self = .onlyChild
      } else if stringEquals(rawValue, ":only-of-type") {
        self = .onlyOfType
      } else if stringEquals(rawValue, ":empty") {
        self = .empty
      } else if stringEquals(rawValue, ":target") {
        self = .target
      } else if stringEquals(rawValue, ":optional") {
        self = .optional
      } else if stringEquals(rawValue, ":required") {
        self = .required
      } else if stringEquals(rawValue, ":valid") {
        self = .valid
      } else if stringEquals(rawValue, ":invalid") {
        self = .invalid
      } else if stringEquals(rawValue, ":in-range") {
        self = .inRange
      } else if stringEquals(rawValue, ":out-of-range") {
        self = .outOfRange
      } else if stringEquals(rawValue, ":read-only") {
        self = .readOnly
      } else if stringEquals(rawValue, ":read-write") {
        self = .readWrite
      } else {
        return nil
      }
    }

    public static func not(_ pseudoClass: CSSPseudoClass) -> String {
      ":not(\(pseudoClass.rawValue))"
    }

    public static func not(_ selector: String) -> String {
      ":not(\(selector))"
    }

    public func render() -> CSSRule {
      .raw("")
    }

    public var cssRuleType: CSSRuleType { .styleRule }
  }
#endif

// Shared helper functions
public func pseudoClass(_ pseudoClass: CSSPseudoClass, @CSSOMBuilder _ content: () -> [CSSRule])
  -> CSSStyleRule
{
  CSSStyleRule(pseudoClass.rawValue, content)
}

public func pseudoClass(
  _ p1: CSSPseudoClass, _ p2: CSSPseudoClass, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(p1.rawValue)\(p2.rawValue)", content)
}

public func pseudoClass(
  _ p1: CSSPseudoClass, _ p2: CSSPseudoClass, _ p3: CSSPseudoClass,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(p1.rawValue)\(p2.rawValue)\(p3.rawValue)", content)
}

public func pseudoClass(
  _ pseudoClass: CSSPseudoClass, _ combinator: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  let combinedSelector = "\(pseudoClass.rawValue)\(combinator)"
  return CSSStyleRule(combinedSelector, content)
}

public func pseudoClass(
  _ pseudoClass: CSSPseudoClass, _ combinator1: String, _ combinator2: String,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  let combinedSelector = "\(pseudoClass.rawValue)\(combinator1)\(combinator2)"
  return CSSStyleRule(combinedSelector, content)
}

public func pseudoClass(
  _ pseudoClass: CSSPseudoClass, _ combinator1: String, _ combinator2: String,
  _ combinator3: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  let combinedSelector = "\(pseudoClass.rawValue)\(combinator1)\(combinator2)\(combinator3)"
  return CSSStyleRule(combinedSelector, content)
}

public func pseudoClass(_ selector: String, @CSSOMBuilder _ content: () -> [CSSRule])
  -> CSSStyleRule
{
  CSSStyleRule(selector, content)
}

public func not(_ selector: String) -> String {
  ":not(\(selector))"
}

public func not(_ pseudo: CSSPseudoClass) -> String {
  ":not(\(pseudo.rawValue))"
}

public func nthChild(_ arg: String) -> String {
  ":nth-child(\(arg))"
}

public func nthChild(_ arg: Int) -> String {
  ":nth-child(\(arg))"
}

public func nthOfType(_ arg: String) -> String {
  ":nth-of-type(\(arg))"
}

public func nthOfType(_ arg: Int) -> String {
  ":nth-of-type(\(arg))"
}

public func pseudoClass(_ selector: String, _ pseudoClass: CSSPseudoClass) -> String {
  "\(selector)\(pseudoClass.rawValue)"
}

public func pseudoClass(_ pseudoClass: CSSPseudoClass) -> String {
  pseudoClass.rawValue
}
