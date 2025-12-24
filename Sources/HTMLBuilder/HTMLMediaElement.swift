#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

// Internal protocol for shared media functionality
protocol MediaElementAttributes {
	func src(_ value: String) -> Self
	func controls(_ value: Bool) -> Self
	func autoplay(_ value: Bool) -> Self
	func loop(_ value: Bool) -> Self
	func muted(_ value: Bool) -> Self
	func preload(_ value: String) -> Self
	func crossorigin(_ value: String) -> Self
}

#endif
