#if !os(WASI)

public enum CSSWhiteSpace: String {
	case normal = "normal"
	case nowrap = "nowrap"
	case pre = "pre"
	case preWrap = "pre-wrap"
	case preLine = "pre-line"
	case breakSpaces = "break-spaces"
}

#endif
