extension ALTO {
  /// `<Page>` element in ALTO XML v4—a single page/canvas with OCR results.
  public struct Page: Sendable {
    public let identifier: Swift.String
    public let label: Swift.String?
    public let imageWidth: Int
    public let imageHeight: Int
    public let textLines: [TextLine]

    public init(
      identifier: Swift.String,
      label: Swift.String? = nil,
      imageWidth: Int,
      imageHeight: Int,
      textLines: [TextLine]
    ) {
      self.identifier = identifier
      self.label = label
      self.imageWidth = imageWidth
      self.imageHeight = imageHeight
      self.textLines = textLines
    }
  }
}
