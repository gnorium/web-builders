extension ALTO {
  /// `<TextLine>` element in ALTO XML v4 — a line of words.
  public struct TextLine: Sendable {
    public let strings: [String]
    public let hpos: Int
    public let vpos: Int
    public let width: Int
    public let height: Int
  }
}
