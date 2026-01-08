# WebBuilders, as used in [gnorium.com](https://gnorium.com)

HTML, CSS, JS, and SVG DSL builders for Swift, enabling declarative UI construction in Swift environments.

## Overview

WebBuilders provides type-safe DSL builders for HTML, CSS, JavaScript, and SVG, allowing you to construct web interfaces using Swift's result builder syntax.

## Features
Result Builders:
- **HTML Builder**: Type-safe HTML element construction
- **CSS Builder**: Declarative CSS styling with compile-time safety
- **JS Builder**: JavaScript code generation with type safety
- **SVG Builder**: SVG element construction

## Installation

### Swift Package Manager

Add WebBuilders to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/gnorium/web-builders", from: "1.0.0")
]
```

Then add it to your target dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "WebBuilders", package: "web-builders")
    ]
)
```

## Usage

```swift
import HTMLBuilder
import CSSBuilder
import JSBuilder
import SVGBuilder

// Build HTML declaratively
div {
    h1 { "Welcome" }
    p { "Built with Swift" }
}

// Build CSS declaratively
style {
    color(.red)
    fontSize(px(16))
}

// Build JavaScript declaratively
const.myVar |= "Hello"
id("console").log(id("myVar"))

// Build SVG declaratively
svg {
    circle().cx(50).cy(50).r(40)
}
```

## Requirements

- Swift 6.2+

## License

Apache License 2.0 - See [LICENSE](LICENSE) for details

## Contributing

Contributions welcome! Please open an issue or submit a pull request.

## Related Packages

- [design-tokens](https://github.com/gnorium/design-tokens) - Universal design tokens based on Apple HIG
- [embedded-swift-utilities](https://github.com/gnorium/embedded-swift-utilities) - Utilities for Embedded Swift
- [web-administrator](https://github.com/gnorium/web-administrator) - Web administration panel for applications
- [web-apis](https://github.com/gnorium/web-apis) - Web API implementations for Swift WebAssembly
- [web-components](https://github.com/gnorium/web-components) - Reusable UI components for web applications
- [web-formats](https://github.com/gnorium/web-formats) - Structured data format builders
- [web-types](https://github.com/gnorium/web-types) - Shared web types and design tokens