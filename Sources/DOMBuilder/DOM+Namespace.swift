import EmbeddedSwiftUtilities
import WebTypes

extension DOM {
  #if SERVER
    public enum Namespace: String, Sendable {
      case html = "http://www.w3.org/1999/xhtml"
      case svg = "http://www.w3.org/2000/svg"
      case mathml = "http://www.w3.org/1998/Math/MathML"
    }
  #endif

  #if CLIENT
    public enum Namespace: Sendable, RawRepresentable {
      case html
      case svg
      case mathml
      public var rawValue: String {
        switch self {
        case .html: return "http://www.w3.org/1999/xhtml"
        case .svg: return "http://www.w3.org/2000/svg"
        case .mathml: return "http://www.w3.org/1998/Math/MathML"
        }
      }
      public init?(rawValue: String) {
        if stringEquals(rawValue, "http://www.w3.org/1999/xhtml") {
          self = .html
        } else if stringEquals(rawValue, "http://www.w3.org/2000/svg") {
          self = .svg
        } else if stringEquals(rawValue, "http://www.w3.org/1998/Math/MathML") {
          self = .mathml
        } else {
          return nil
        }
      }
    }
  #endif
}
