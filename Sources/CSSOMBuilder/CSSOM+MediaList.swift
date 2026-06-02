import EmbeddedSwiftUtilities
import WebTypes

/// https://drafts.csswg.org/cssom/#the-medialist-interface
extension CSSOM {
  public final class MediaList: @unchecked Sendable {
    private var queries: [String] = []

    public init() {}
    public init(_ mediaText: String) {
      if !stringIsEmpty(mediaText) { queries = [mediaText] }
    }

    public var mediaText: String {
      stringJoin(queries, separator: ", ")
    }

    public var length: Int { queries.count }

    public subscript(_ index: Int) -> String? {
      guard index >= 0 && index < queries.count else { return nil }
      return queries[index]
    }

    public func appendMedium(_ medium: String) {
      queries.append(medium)
    }

    public func deleteMedium(_ medium: String) {
      queries.removeAll { stringEquals($0, medium) }
    }
  }
}
