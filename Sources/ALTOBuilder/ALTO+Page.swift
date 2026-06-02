extension ALTO {
  /// `<Page>` element in ALTO XML v4 — a single page/canvas with OCR results.
  public struct Page: Sendable {
    public let identifier: String
    public let label: String?
    public let imageWidth: Int
    public let imageHeight: Int
    public let textLines: [TextLine]
  }
}
