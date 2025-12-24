#if !os(WASI)

public enum CSSUserSelect: String {
	case none = "none"
	case auto = "auto"
	case text = "text"
	case contain = "contain"
}

#endif
