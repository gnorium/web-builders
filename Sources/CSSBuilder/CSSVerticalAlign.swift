#if !os(WASI)

public enum CSSVerticalAlign: String {
	case baseline = "baseline"
	case top = "top"
	case middle = "middle"
	case bottom = "bottom"
	case textTop = "text-top"
	case textBottom = "text-bottom"
	case sub = "sub"
	case `super` = "super"
}

#endif
