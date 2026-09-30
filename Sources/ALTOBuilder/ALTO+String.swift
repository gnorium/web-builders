extension ALTO {
  /// `<String>` element in ALTO XML v4—a single word with bounding box and confidence.
  public struct String: Sendable {
    public let content: Swift.String
    public let confidence: Double
    public let hpos: Int
    public let vpos: Int
    public let width: Int
    public let height: Int

    public init(content: Swift.String, confidence: Double, hpos: Int, vpos: Int, width: Int, height: Int) {
      self.content = content
      self.confidence = confidence
      self.hpos = hpos
      self.vpos = vpos
      self.width = width
      self.height = height
    }
  }
}
