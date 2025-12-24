#if !os(WASI)

public enum SVGFillRule: String, Sendable {
	case nonzero = "nonzero"
	case evenodd = "evenodd"
}

#endif
