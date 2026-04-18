import CSSBuilder
import WebTypes
import DOMBuilder

// Internal protocol for shared media functionality
protocol HTMLMediaElement {
	func src(_ value: String) -> Self
	func controls(_ value: Bool) -> Self
	func autoplay(_ value: Bool) -> Self
	func loop(_ value: Bool) -> Self
	func muted(_ value: Bool) -> Self
	func preload(_ value: String) -> Self
	func crossorigin(_ value: String) -> Self
}
