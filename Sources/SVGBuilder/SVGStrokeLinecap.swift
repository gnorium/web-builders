#if !os(WASI)

import Foundation

public enum SVGStrokeLinecap: String, Sendable {
	case butt = "butt"
	case round = "round"
	case square = "square"
	case inherit = "inherit"
	case initial = "initial"
}

#endif
