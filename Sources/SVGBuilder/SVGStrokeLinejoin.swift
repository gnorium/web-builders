#if !os(WASI)

import Foundation

public enum SVGStrokeLinejoin: String, Sendable {
	case miter = "miter"
	case round = "round"
	case bevel = "bevel"
	case inherit = "inherit"
	case initial = "initial"
}

#endif
