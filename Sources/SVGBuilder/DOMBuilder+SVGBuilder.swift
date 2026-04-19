import DOMBuilder

// Core overloads for the unified DOMBuilder
extension DOMBuilder {
    public static func buildExpression(_ el: SVGAnimateElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGAnimateTransformElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGCircleElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGClipPathElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGDefsElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGEllipseElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFEColorMatrixElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFEComponentTransferElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFEGaussianBlurElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFEMergeElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFEMergeNodeElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFEOffsetElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFETurbulenceElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFilterElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGGElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGImageElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGLineElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGLinearGradientElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGMaskElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGMetadataElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGPathElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGPatternElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGPolygonElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGPolylineElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGRadialGradientElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGRectElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGStopElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGSymbolElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGTextElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGUseElement) -> [DOMNode] { [el.render()] }
}

// Parallel overloads for the specialized SVGBuilder
extension SVGBuilder {
    public static func buildExpression(_ el: SVGAnimateElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGAnimateTransformElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGCircleElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGClipPathElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGDefsElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGEllipseElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFEColorMatrixElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFEComponentTransferElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFEGaussianBlurElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFEMergeElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFEMergeNodeElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFEOffsetElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFETurbulenceElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGFilterElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGGElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGImageElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGLineElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGLinearGradientElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGMaskElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGMetadataElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGPathElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGPatternElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGPolygonElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGPolylineElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGRadialGradientElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGRectElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGStopElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGSymbolElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGTextElement) -> [DOMNode] { [el.render()] }
    public static func buildExpression(_ el: SVGUseElement) -> [DOMNode] { [el.render()] }
}
