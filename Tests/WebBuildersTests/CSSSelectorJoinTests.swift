import CSSOMBuilder
import WebTypes
import XCTest

final class CSSSelectorJoinTests: XCTestCase {
  func testSplitSelectorListKeepsFunctionalAndAttributeListsWhole() {
    XCTAssertEqual(
      CSSOM.splitSelectorList(".a:is([data-part='F'], [data-part='M']) > b, :is(td, th), [title='x,y'], .c"),
      [".a:is([data-part='F'], [data-part='M']) > b", " :is(td, th)", " [title='x,y']", " .c"]
    )
  }

  func testJoinSelectorsDoesNotScopeInsideIsList() {
    XCTAssertEqual(
      CSSOM.joinSelectors(".tei-view", "& .tei-block:is([data-part='F'], [data-part='M']) > :first-child"),
      ".tei-view .tei-block:is([data-part='F'], [data-part='M']) > :first-child"
    )
    XCTAssertEqual(
      CSSOM.joinSelectors(".tei-view", "& .tei-table :is(td, th) > .x, & :where(.a, .b):not(.c, .d)"),
      ".tei-view .tei-table :is(td, th) > .x, .tei-view :where(.a, .b):not(.c, .d)"
    )
  }

  func testJoinSelectorsStillDistributesTopLevelLists() {
    XCTAssertEqual(CSSOM.joinSelectors(".p, .q", "& .a, & .b"), ".p .a, .p .b, .q .a, .q .b")
  }
}
