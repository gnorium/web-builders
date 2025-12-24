#if !os(WASI)

public enum CSSTextAlign: String, Sendable {
	case left = "left"
	case right = "right"
	case center = "center"
	case justify = "justify"
	case start = "start"
	case end = "end"
}

#endif
