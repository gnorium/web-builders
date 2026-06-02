import WebTypes

/// https://drafts.csswg.org/cssom/#the-stylesheet-interface
extension CSSOM {
  open class StyleSheet: @unchecked Sendable {
    open var type: String { "text/css" }
    open var href: String? { nil }
    open var title: String? { nil }
    open var disabled: Bool = false
    open var media: CSSOM.MediaList = CSSOM.MediaList()

    public init() {}
  }
}
