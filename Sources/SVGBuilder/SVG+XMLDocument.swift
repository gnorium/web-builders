import DOMBuilder
import WebTypes
import XMLBuilder

extension SVG.SVGSVGElement {
  /// Converts this SVG element tree to a standalone XML.Document for SVG file output.
  /// Use this for server-side SVG file generation (OCR overlays, exports, etc.).
  /// For inline HTML or live WASM DOM use, render() or the DOM tree directly.
  public func asXMLDocument() -> XML.Document {
    XML.Document(
      root: domToXML(self),
      namespace: "http://www.w3.org/2000/svg"
    )
  }
}

private func domToXML(_ element: DOM.Element) -> XML.Element {
  let xmlEl = XML.Element(name: element.tag, attributes: element.attributes)
  for child in element.children {
    if let el = child as? DOM.Element {
      xmlEl.children.append(domToXML(el))
    } else if let text = child as? DOM.Text {
      xmlEl.text = (xmlEl.text ?? "") + text.content
    }
  }
  return xmlEl
}
