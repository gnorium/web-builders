import ALTOBuilder
import XCTest

final class ALTOBuilderTests: XCTestCase {
  func testRenderPreservesPageIdentifierAndWordGeometry() {
    let word = ALTO.String(content: "Gnorium", confidence: 0.98, hpos: 12, vpos: 24, width: 96, height: 18)
    let line = ALTO.TextLine(strings: [word], hpos: 12, vpos: 24, width: 96, height: 18)
    let page = ALTO.Page(identifier: "folio-1", imageWidth: 1200, imageHeight: 1800, textLines: [line])

    let xml = ALTOBuilder.render([page])

    XCTAssertTrue(xml.contains("ID=\"folio-1\""))
    XCTAssertTrue(xml.contains("CONTENT=\"Gnorium\""))
    XCTAssertTrue(xml.contains("HPOS=\"12\""))
    XCTAssertTrue(xml.contains("WC=\"0.98\""))
  }
}
