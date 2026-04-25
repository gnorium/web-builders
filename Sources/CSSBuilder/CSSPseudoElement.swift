import CSSOMBuilder
import WebTypes

#if SERVER
  public enum CSSPseudoElement: String, CSSContent, Equatable {
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

    public func render() -> CSSRule {
      .raw("")
    }

    public var cssRuleType: CSSRuleType { .styleRule }
  }
#endif

#if CLIENT
  import EmbeddedSwiftUtilities

  public enum CSSPseudoElement: CSSContent, Equatable, RawRepresentable {
    case before
    case after
    case firstLine
    case firstLetter
    case selection
    case placeholder
    case marker
    case backdrop

    // Webkit-specific pseudo-elements
    case webkitDetailsMarker
    case webkitSearchCancelButton
    case webkitSearchDecoration
    case webkitSearchResultsButton
    case webkitSearchResultsDecoration
    case webkitSliderThumb
    case webkitSliderRunnable
    case webkitScrollbar
    case webkitScrollbarButton
    case webkitScrollbarTrack
    case webkitScrollbarTrackPiece
    case webkitScrollbarThumb
    case webkitScrollbarCorner
    case webkitResizer
    case webkitInnerSpinButton
    case webkitOuterSpinButton
    case webkitInputPlaceholder
    case webkitFileUploadButton
    case webkitProgressBar
    case webkitProgressValue
    case webkitMeterBar
    case webkitMeterOptimumValue
    case webkitMeterSuboptimumValue
    case webkitMeterEvenLessGoodValue

    // Mozilla-specific pseudo-elements
    case mozFocusInner
    case mozFocusOuter
    case mozSelection
    case mozPlaceholder
    case mozProgressBar
    case mozRangeTrack
    case mozRangeThumb
    case mozRangeProgress
    case mozMeterBar
    case mozListBullet
    case mozListNumber

    // Microsoft-specific pseudo-elements
    case msBrowse
    case msCheck
    case msClear
    case msExpand
    case msFill
    case msFillLower
    case msFillUpper
    case msReveal
    case msThumb
    case msTicksAfter
    case msTicksBefore
    case msTooltip
    case msTrack
    case msValue
    case msInputPlaceholder

    public var rawValue: String {
      switch self {
      case .before: return "::before"
      case .after: return "::after"
      case .firstLine: return "::first-line"
      case .firstLetter: return "::first-letter"
      case .selection: return "::selection"
      case .placeholder: return "::placeholder"
      case .marker: return "::marker"
      case .backdrop: return "::backdrop"
      case .webkitDetailsMarker: return "::-webkit-details-marker"
      case .webkitSearchCancelButton: return "::-webkit-search-cancel-button"
      case .webkitSearchDecoration: return "::-webkit-search-decoration"
      case .webkitSearchResultsButton: return "::-webkit-search-results-button"
      case .webkitSearchResultsDecoration: return "::-webkit-search-results-decoration"
      case .webkitSliderThumb: return "::-webkit-slider-thumb"
      case .webkitSliderRunnable: return "::-webkit-slider-runnable-track"
      case .webkitScrollbar: return "::-webkit-scrollbar"
      case .webkitScrollbarButton: return "::-webkit-scrollbar-button"
      case .webkitScrollbarTrack: return "::-webkit-scrollbar-track"
      case .webkitScrollbarTrackPiece: return "::-webkit-scrollbar-track-piece"
      case .webkitScrollbarThumb: return "::-webkit-scrollbar-thumb"
      case .webkitScrollbarCorner: return "::-webkit-scrollbar-corner"
      case .webkitResizer: return "::-webkit-resizer"
      case .webkitInnerSpinButton: return "::-webkit-inner-spin-button"
      case .webkitOuterSpinButton: return "::-webkit-outer-spin-button"
      case .webkitInputPlaceholder: return "::-webkit-input-placeholder"
      case .webkitFileUploadButton: return "::-webkit-file-upload-button"
      case .webkitProgressBar: return "::-webkit-progress-bar"
      case .webkitProgressValue: return "::-webkit-progress-value"
      case .webkitMeterBar: return "::-webkit-meter-bar"
      case .webkitMeterOptimumValue: return "::-webkit-meter-optimum-value"
      case .webkitMeterSuboptimumValue: return "::-webkit-meter-suboptimum-value"
      case .webkitMeterEvenLessGoodValue: return "::-webkit-meter-even-less-good-value"
      case .mozFocusInner: return "::-moz-focus-inner"
      case .mozFocusOuter: return "::-moz-focus-outer"
      case .mozSelection: return "::-moz-selection"
      case .mozPlaceholder: return "::-moz-placeholder"
      case .mozProgressBar: return "::-moz-progress-bar"
      case .mozRangeTrack: return "::-moz-range-track"
      case .mozRangeThumb: return "::-moz-range-thumb"
      case .mozRangeProgress: return "::-moz-range-progress"
      case .mozMeterBar: return "::-moz-meter-bar"
      case .mozListBullet: return "::-moz-list-bullet"
      case .mozListNumber: return "::-moz-list-number"
      case .msBrowse: return "::-ms-browse"
      case .msCheck: return "::-ms-check"
      case .msClear: return "::-ms-clear"
      case .msExpand: return "::-ms-expand"
      case .msFill: return "::-ms-fill"
      case .msFillLower: return "::-ms-fill-lower"
      case .msFillUpper: return "::-ms-fill-upper"
      case .msReveal: return "::-ms-reveal"
      case .msThumb: return "::-ms-thumb"
      case .msTicksAfter: return "::-ms-ticks-after"
      case .msTicksBefore: return "::-ms-ticks-before"
      case .msTooltip: return "::-ms-tooltip"
      case .msTrack: return "::-ms-track"
      case .msValue: return "::-ms-value"
      case .msInputPlaceholder: return "::-ms-input-placeholder"
      }
    }

    public init?(rawValue: String) {
      if stringEquals(rawValue, "::before") {
        self = .before
      } else if stringEquals(rawValue, "::after") {
        self = .after
      } else if stringEquals(rawValue, "::first-line") {
        self = .firstLine
      } else if stringEquals(rawValue, "::first-letter") {
        self = .firstLetter
      } else if stringEquals(rawValue, "::selection") {
        self = .selection
      } else if stringEquals(rawValue, "::placeholder") {
        self = .placeholder
      } else if stringEquals(rawValue, "::marker") {
        self = .marker
      } else if stringEquals(rawValue, "::backdrop") {
        self = .backdrop
      } else if stringEquals(rawValue, "::-webkit-details-marker") {
        self = .webkitDetailsMarker
      } else if stringEquals(rawValue, "::-webkit-search-cancel-button") {
        self = .webkitSearchCancelButton
      } else if stringEquals(rawValue, "::-webkit-search-decoration") {
        self = .webkitSearchDecoration
      } else if stringEquals(rawValue, "::-webkit-search-results-button") {
        self = .webkitSearchResultsButton
      } else if stringEquals(rawValue, "::-webkit-search-results-decoration") {
        self = .webkitSearchResultsDecoration
      } else if stringEquals(rawValue, "::-webkit-slider-thumb") {
        self = .webkitSliderThumb
      } else if stringEquals(rawValue, "::-webkit-slider-runnable-track") {
        self = .webkitSliderRunnable
      } else if stringEquals(rawValue, "::-webkit-scrollbar") {
        self = .webkitScrollbar
      } else if stringEquals(rawValue, "::-webkit-scrollbar-button") {
        self = .webkitScrollbarButton
      } else if stringEquals(rawValue, "::-webkit-scrollbar-track") {
        self = .webkitScrollbarTrack
      } else if stringEquals(rawValue, "::-webkit-scrollbar-track-piece") {
        self = .webkitScrollbarTrackPiece
      } else if stringEquals(rawValue, "::-webkit-scrollbar-thumb") {
        self = .webkitScrollbarThumb
      } else if stringEquals(rawValue, "::-webkit-scrollbar-corner") {
        self = .webkitScrollbarCorner
      } else if stringEquals(rawValue, "::-webkit-resizer") {
        self = .webkitResizer
      } else if stringEquals(rawValue, "::-webkit-inner-spin-button") {
        self = .webkitInnerSpinButton
      } else if stringEquals(rawValue, "::-webkit-outer-spin-button") {
        self = .webkitOuterSpinButton
      } else if stringEquals(rawValue, "::-webkit-input-placeholder") {
        self = .webkitInputPlaceholder
      } else if stringEquals(rawValue, "::-webkit-file-upload-button") {
        self = .webkitFileUploadButton
      } else if stringEquals(rawValue, "::-webkit-progress-bar") {
        self = .webkitProgressBar
      } else if stringEquals(rawValue, "::-webkit-progress-value") {
        self = .webkitProgressValue
      } else if stringEquals(rawValue, "::-webkit-meter-bar") {
        self = .webkitMeterBar
      } else if stringEquals(rawValue, "::-webkit-meter-optimum-value") {
        self = .webkitMeterOptimumValue
      } else if stringEquals(rawValue, "::-webkit-meter-suboptimum-value") {
        self = .webkitMeterSuboptimumValue
      } else if stringEquals(rawValue, "::-webkit-meter-even-less-good-value") {
        self = .webkitMeterEvenLessGoodValue
      } else if stringEquals(rawValue, "::-moz-focus-inner") {
        self = .mozFocusInner
      } else if stringEquals(rawValue, "::-moz-focus-outer") {
        self = .mozFocusOuter
      } else if stringEquals(rawValue, "::-moz-selection") {
        self = .mozSelection
      } else if stringEquals(rawValue, "::-moz-placeholder") {
        self = .mozPlaceholder
      } else if stringEquals(rawValue, "::-moz-progress-bar") {
        self = .mozProgressBar
      } else if stringEquals(rawValue, "::-moz-range-track") {
        self = .mozRangeTrack
      } else if stringEquals(rawValue, "::-moz-range-thumb") {
        self = .mozRangeThumb
      } else if stringEquals(rawValue, "::-moz-range-progress") {
        self = .mozRangeProgress
      } else if stringEquals(rawValue, "::-moz-meter-bar") {
        self = .mozMeterBar
      } else if stringEquals(rawValue, "::-moz-list-bullet") {
        self = .mozListBullet
      } else if stringEquals(rawValue, "::-moz-list-number") {
        self = .mozListNumber
      } else if stringEquals(rawValue, "::-ms-browse") {
        self = .msBrowse
      } else if stringEquals(rawValue, "::-ms-check") {
        self = .msCheck
      } else if stringEquals(rawValue, "::-ms-clear") {
        self = .msClear
      } else if stringEquals(rawValue, "::-ms-expand") {
        self = .msExpand
      } else if stringEquals(rawValue, "::-ms-fill") {
        self = .msFill
      } else if stringEquals(rawValue, "::-ms-fill-lower") {
        self = .msFillLower
      } else if stringEquals(rawValue, "::-ms-fill-upper") {
        self = .msFillUpper
      } else if stringEquals(rawValue, "::-ms-reveal") {
        self = .msReveal
      } else if stringEquals(rawValue, "::-ms-thumb") {
        self = .msThumb
      } else if stringEquals(rawValue, "::-ms-ticks-after") {
        self = .msTicksAfter
      } else if stringEquals(rawValue, "::-ms-ticks-before") {
        self = .msTicksBefore
      } else if stringEquals(rawValue, "::-ms-tooltip") {
        self = .msTooltip
      } else if stringEquals(rawValue, "::-ms-track") {
        self = .msTrack
      } else if stringEquals(rawValue, "::-ms-value") {
        self = .msValue
      } else if stringEquals(rawValue, "::-ms-input-placeholder") {
        self = .msInputPlaceholder
      } else {
        return nil
      }
    }

    public func render() -> CSSRule {
      .raw("")
    }

    public var cssRuleType: CSSRuleType { .styleRule }
  }
#endif

// Shared helper functions
public func pseudoElement(
  _ pseudoElement: CSSPseudoElement, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(pseudoElement.rawValue, content)
}

public func pseudoElement(
  _ selector: String, _ pseudoElement: CSSPseudoElement, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(selector)\(pseudoElement.rawValue)", content)
}

public func pseudoElement(_ selector: String, @CSSOMBuilder _ content: () -> [CSSRule])
  -> CSSStyleRule
{
  CSSStyleRule(selector, content)
}

public func pseudoElement(_ selector: String, _ pseudoElement: CSSPseudoElement) -> String {
  "\(selector)\(pseudoElement.rawValue)"
}

public func pseudoElement(_ pseudoElement: CSSPseudoElement) -> String {
  pseudoElement.rawValue
}
