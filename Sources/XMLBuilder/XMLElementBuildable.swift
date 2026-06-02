import EmbeddedSwiftUtilities
import WebTypes

/// Base protocol for all XML elements — provides common attribute methods.
public protocol XMLElementBuildable: Sendable {
  var attributes: [(String, String)] { get }
  func addingAttribute(_ key: String, _ value: String) -> Self
}

public extension XMLElementBuildable {
  func addingAttribute(_ key: String, _ value: Int) -> Self {
    addingAttribute(key, intToString(value))
  }
  func addingAttribute(_ key: String, _ value: Double) -> Self {
    addingAttribute(key, doubleToString(value))
  }
}
