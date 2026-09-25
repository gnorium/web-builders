import WebTypes

extension HTML {
  /// `ValidityState`: which of a control's constraints its value breaks,
  /// read from `validity` on an input or a textarea. The browser computes it
  /// whether or not the form has `novalidate`, so a form that shows its own
  /// messages still asks the browser what an email or a `pattern` allows.
  public struct ValidityState: Sendable {
    public let valueMissing: Bool
    public let typeMismatch: Bool
    public let patternMismatch: Bool
    public let tooLong: Bool
    public let tooShort: Bool
    public let rangeUnderflow: Bool
    public let rangeOverflow: Bool
    public let stepMismatch: Bool
    public let badInput: Bool
    public let customError: Bool
    public let valid: Bool

    /// The bridge's bitmask, one bit per flag in the order above.
    public init(bits: Int32) {
      valueMissing = bits & (1 << 0) != 0
      typeMismatch = bits & (1 << 1) != 0
      patternMismatch = bits & (1 << 2) != 0
      tooLong = bits & (1 << 3) != 0
      tooShort = bits & (1 << 4) != 0
      rangeUnderflow = bits & (1 << 5) != 0
      rangeOverflow = bits & (1 << 6) != 0
      stepMismatch = bits & (1 << 7) != 0
      badInput = bits & (1 << 8) != 0
      customError = bits & (1 << 9) != 0
      valid = bits & (1 << 10) != 0
    }
  }
}
