import CSSOMBuilder
import WebTypes

#if SERVER
  extension CSS {
    public enum PseudoClass: Equatable {
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
      case nthChild(String)
      case nthOfType(String)
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
      case has(String)
      case not(String)

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
        case .nthChild(let arg): return ":nth-child(\(arg))"
        case .nthOfType(let arg): return ":nth-of-type(\(arg))"
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
        case .has(let selector): return ":has(\(selector))"
        case .not(let selector): return ":not(\(selector))"
        }
      }

      public static func not(_ pseudoClass: CSS.PseudoClass) -> CSS.PseudoClass {
        .not(pseudoClass.rawValue)
      }

      public static func nthChild(_ n: Int) -> CSS.PseudoClass { .nthChild("\(n)") }
      public static func nthOfType(_ n: Int) -> CSS.PseudoClass { .nthOfType("\(n)") }
    }
  }
#endif

#if CLIENT
  import EmbeddedSwiftUtilities
  extension CSS {
    public enum PseudoClass: Equatable, RawRepresentable {
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
      case nthChild(String)
      case nthOfType(String)
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
      case has(String)
      case not(String)

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
        case .nthChild(let arg): return ":nth-child(\(arg))"
        case .nthOfType(let arg): return ":nth-of-type(\(arg))"
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
        case .has(let selector): return ":has(\(selector))"
        case .not(let selector): return ":not(\(selector))"
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

      public static func not(_ pseudoClass: CSS.PseudoClass) -> CSS.PseudoClass {
        .not(pseudoClass.rawValue)
      }

      public static func nthChild(_ n: Int) -> CSS.PseudoClass { .nthChild("\(n)") }
      public static func nthOfType(_ n: Int) -> CSS.PseudoClass { .nthOfType("\(n)") }
    }
  }
#endif

// Shared helper functions
public func pseudoClass(_ pseudoClass: CSS.PseudoClass, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration)
  -> CSSOM.CSSStyleRule
{
  CSSOM.CSSStyleRule(pseudoClass.rawValue, style: content())
}

public func pseudoClass(
  _ p1: CSS.PseudoClass, _ p2: CSS.PseudoClass, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration
) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(p1.rawValue)\(p2.rawValue)", style: content())
}

public func pseudoClass(
  _ p1: CSS.PseudoClass, _ p2: CSS.PseudoClass, _ p3: CSS.PseudoClass,
  @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration
) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(p1.rawValue)\(p2.rawValue)\(p3.rawValue)", style: content())
}

public func pseudoClass(
  _ p1: CSS.PseudoClass, _ p2: CSS.PseudoClass, _ p3: CSS.PseudoClass, _ p4: CSS.PseudoClass,
  @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration
) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(p1.rawValue)\(p2.rawValue)\(p3.rawValue)\(p4.rawValue)", style: content())
}

public func pseudoClass(
  _ p1: CSS.PseudoClass, _ p2: String, _ p3: CSS.PseudoClass,
  @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration
) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(p1.rawValue)\(p2)\(p3.rawValue)", style: content())
}

public func pseudoClass(
  _ p1: CSS.PseudoClass, _ p2: CSS.PseudoClass, _ s1: String, _ s2: String,
  @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration
) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(p1.rawValue)\(p2.rawValue)\(s1)\(s2)", style: content())
}

public func pseudoClass(
  _ pseudoClass: CSS.PseudoClass, _ combinator: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration
) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(pseudoClass.rawValue)\(combinator)", style: content())
}

public func pseudoClass(
  _ pseudoClass: CSS.PseudoClass, _ combinator1: String, _ combinator2: String,
  @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration
) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(pseudoClass.rawValue)\(combinator1)\(combinator2)", style: content())
}

public func pseudoClass(
  _ pseudoClass: CSS.PseudoClass, _ combinator1: String, _ combinator2: String,
  _ combinator3: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration
) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(pseudoClass.rawValue)\(combinator1)\(combinator2)\(combinator3)", style: content())
}

public func pseudoClass(_ selector: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration)
  -> CSSOM.CSSStyleRule
{
  CSSOM.CSSStyleRule(selector, style: content())
}

public func pseudoClass(_ selector: String, _ pseudoClass: CSS.PseudoClass) -> String {
  "\(selector)\(pseudoClass.rawValue)"
}

public func pseudoClass(_ pseudoClass: CSS.PseudoClass) -> String {
  pseudoClass.rawValue
}
