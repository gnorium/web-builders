#if !os(WASI)

public enum CSSPseudoElement: String, CSS {
	case before = "::before"
	case after = "::after"
	case firstLine = "::first-line"
	case firstLetter = "::first-letter"
	case selection = "::selection"
	case placeholder = "::placeholder"
	case marker = "::marker"
	case backdrop = "::backdrop"

	// Webkit-specific pseudo-elements
	case webkitDetailsMarker = "::-webkit-details-marker"
	case webkitSearchCancelButton = "::-webkit-search-cancel-button"
	case webkitSearchDecoration = "::-webkit-search-decoration"
	case webkitSearchResultsButton = "::-webkit-search-results-button"
	case webkitSearchResultsDecoration = "::-webkit-search-results-decoration"
	case webkitSliderThumb = "::-webkit-slider-thumb"
	case webkitSliderRunnable = "::-webkit-slider-runnable-track"
	case webkitScrollbar = "::-webkit-scrollbar"
	case webkitScrollbarButton = "::-webkit-scrollbar-button"
	case webkitScrollbarTrack = "::-webkit-scrollbar-track"
	case webkitScrollbarTrackPiece = "::-webkit-scrollbar-track-piece"
	case webkitScrollbarThumb = "::-webkit-scrollbar-thumb"
	case webkitScrollbarCorner = "::-webkit-scrollbar-corner"
	case webkitResizer = "::-webkit-resizer"
	case webkitInnerSpinButton = "::-webkit-inner-spin-button"
	case webkitOuterSpinButton = "::-webkit-outer-spin-button"
	case webkitInputPlaceholder = "::-webkit-input-placeholder"
	case webkitFileUploadButton = "::-webkit-file-upload-button"
	case webkitProgressBar = "::-webkit-progress-bar"
	case webkitProgressValue = "::-webkit-progress-value"
	case webkitMeterBar = "::-webkit-meter-bar"
	case webkitMeterOptimumValue = "::-webkit-meter-optimum-value"
	case webkitMeterSuboptimumValue = "::-webkit-meter-suboptimum-value"
	case webkitMeterEvenLessGoodValue = "::-webkit-meter-even-less-good-value"

	// Mozilla-specific pseudo-elements
	case mozFocusInner = "::-moz-focus-inner"
	case mozFocusOuter = "::-moz-focus-outer"
	case mozSelection = "::-moz-selection"
	case mozPlaceholder = "::-moz-placeholder"
	case mozProgressBar = "::-moz-progress-bar"
	case mozRangeTrack = "::-moz-range-track"
	case mozRangeThumb = "::-moz-range-thumb"
	case mozRangeProgress = "::-moz-range-progress"
	case mozMeterBar = "::-moz-meter-bar"
	case mozListBullet = "::-moz-list-bullet"
	case mozListNumber = "::-moz-list-number"

	// Microsoft-specific pseudo-elements
	case msBrowse = "::-ms-browse"
	case msCheck = "::-ms-check"
	case msClear = "::-ms-clear"
	case msExpand = "::-ms-expand"
	case msFill = "::-ms-fill"
	case msFillLower = "::-ms-fill-lower"
	case msFillUpper = "::-ms-fill-upper"
	case msReveal = "::-ms-reveal"
	case msThumb = "::-ms-thumb"
	case msTicksAfter = "::-ms-ticks-after"
	case msTicksBefore = "::-ms-ticks-before"
	case msTooltip = "::-ms-tooltip"
	case msTrack = "::-ms-track"
	case msValue = "::-ms-value"
	case msInputPlaceholder = "::-ms-input-placeholder"

	public func render(indent: Int = 0) -> String {
		""
	}
}

public func pseudoElement(_ pseudoElement: CSSPseudoElement, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset(pseudoElement.rawValue, content)
}

public func pseudoElement(_ selector: String, _ pseudoElement: CSSPseudoElement) -> String {
	selector + pseudoElement.rawValue
}

public func pseudoElement(_ selector: String, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset(selector, content)
}

#endif
