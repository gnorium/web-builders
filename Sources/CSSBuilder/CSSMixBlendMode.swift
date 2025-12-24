#if !os(WASI)

import WebTypes

public enum CSSMixBlendMode: String {
	case plusDarker = "plus-darker"
	case plusLighter = "plus-lighter"

	/// Initialize from CSSBlendMode
	public init(_ blendMode: CSSBlendMode) {
		self.init(rawValue: blendMode.rawValue)!
	}
}

#endif
