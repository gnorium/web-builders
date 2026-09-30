extension ALTO {
  /// `<TextLine>` element in ALTO XML v4—a line of words.
  public struct TextLine: Sendable {
    public let strings: [String]
    public let hpos: Int
    public let vpos: Int
    public let width: Int
    public let height: Int

    public init(strings: [String], hpos: Int, vpos: Int, width: Int, height: Int) {
      self.strings = strings
      self.hpos = hpos
      self.vpos = vpos
      self.width = width
      self.height = height
    }
  }
}
