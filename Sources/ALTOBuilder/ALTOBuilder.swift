import EmbeddedSwiftUtilities
import XMLBuilder

/// Builds ALTO XML v4 from typed ALTO model objects.
public enum ALTOBuilder {
  /// Build ALTO pages from data, returning typed pages.
  public static func build(pages: [ALTO.Page]) -> [ALTO.Page] { pages }

  /// Render typed ALTO pages to an ALTO XML v4 document string.
  public static func render(_ pages: [ALTO.Page]) -> String {
    let alto = XML.Element(name: "alto", attributes: [
      ("xmlns", "http://www.loc.gov/standards/alto/ns-v4#")
    ])

    let description = XML.Element(name: "Description")
    description.children.append(XML.Element(name: "MeasurementUnit", text: "pixel"))
    alto.children.append(description)

    let layout = XML.Element(name: "Layout")
    for (i, page) in pages.enumerated() {
      let pageEl = XML.Element(name: "Page", attributes: [
        ("ID", "page_\(i + 1)"),
        ("WIDTH", intToString(page.imageWidth)),
        ("HEIGHT", intToString(page.imageHeight)),
        ("PHYSICAL_IMG_NR", intToString(i + 1)),
      ])
      let printSpace = XML.Element(name: "PrintSpace", attributes: [
        ("HPOS", "0"), ("VPOS", "0"),
        ("WIDTH", intToString(page.imageWidth)),
        ("HEIGHT", intToString(page.imageHeight)),
      ])
      for (li, line) in page.textLines.enumerated() {
        let textBlock = XML.Element(name: "TextBlock", attributes: [
          ("ID", "tb_\(li + 1)"),
          ("HPOS", intToString(line.hpos)), ("VPOS", intToString(line.vpos)),
          ("WIDTH", intToString(line.width)), ("HEIGHT", intToString(line.height)),
        ])
        let textLine = XML.Element(name: "TextLine", attributes: [
          ("ID", "tl_\(li + 1)"),
          ("HPOS", intToString(line.hpos)), ("VPOS", intToString(line.vpos)),
          ("WIDTH", intToString(line.width)), ("HEIGHT", intToString(line.height)),
        ])
        for (wi, s) in line.strings.enumerated() {
          let str = XML.Element(name: "String", attributes: [
            ("ID", "s_\(li + 1)_\(wi + 1)"),
            ("CONTENT", s.content),
            ("HPOS", intToString(s.hpos)), ("VPOS", intToString(s.vpos)),
            ("WIDTH", intToString(s.width)), ("HEIGHT", intToString(s.height)),
            ("WC", doubleToString(s.confidence)),
          ])
          textLine.children.append(str)
        }
        textBlock.children.append(textLine)
        printSpace.children.append(textBlock)
      }
      pageEl.children.append(printSpace)
      layout.children.append(pageEl)
    }
    alto.children.append(layout)

    return XML.Document(root: alto).render()
  }
}
