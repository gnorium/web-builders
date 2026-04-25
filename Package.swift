// swift-tools-version: 6.2

import PackageDescription

let package = Package(
  name: "web-builders",
  platforms: [
    .macOS(.v14),
    .iOS(.v17),
    .watchOS(.v10),
    .tvOS(.v17),
    .visionOS(.v1),
  ],
  products: [
    .library(name: "HTMLBuilder", targets: ["HTMLBuilder"]),
    .library(name: "CSSBuilder", targets: ["CSSBuilder"]),
    .library(name: "JSBuilder", targets: ["JSBuilder"]),
    .library(name: "SVGBuilder", targets: ["SVGBuilder"]),
    .library(name: "DOMBuilder", targets: ["DOMBuilder"]),
    .library(name: "CSSOMBuilder", targets: ["CSSOMBuilder"]),
  ],
  dependencies: [
    .package(url: "https://github.com/gnorium/web-types", branch: "main"),
    .package(url: "https://github.com/gnorium/web-formats", branch: "main"),
    .package(url: "https://github.com/gnorium/embedded-swift-utilities", branch: "main"),
  ],
  targets: [
    .target(
      name: "DOMBuilder",
      dependencies: [
        .product(name: "EmbeddedSwiftUtilities", package: "embedded-swift-utilities"),
        .product(name: "WebTypes", package: "web-types"),
      ],
      path: "Sources/DOMBuilder",
      swiftSettings: [
        .enableExperimentalFeature("Embedded", .when(platforms: [.wasi])),
        .enableExperimentalFeature("Extern", .when(platforms: [.wasi])),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("StrictConcurrency"),
        .define("CLIENT", .when(platforms: [.wasi])),
        .define("SERVER", .when(platforms: [.macOS, .linux, .windows])),
      ]
    ),
    .target(
      name: "HTMLBuilder",
      dependencies: [
        "DOMBuilder",
        "CSSBuilder",
        "CSSOMBuilder",
        "JSBuilder",
        .product(name: "JSONFormat", package: "web-formats"),
        .product(name: "JSONLDFormat", package: "web-formats"),
        .product(name: "WebTypes", package: "web-types"),
        .product(name: "EmbeddedSwiftUtilities", package: "embedded-swift-utilities"),
      ],
      path: "Sources/HTMLBuilder",
      swiftSettings: [
        .enableExperimentalFeature("Embedded", .when(platforms: [.wasi])),
        .enableExperimentalFeature("Extern", .when(platforms: [.wasi])),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("StrictConcurrency"),
        .define("CLIENT", .when(platforms: [.wasi])),
        .define("SERVER", .when(platforms: [.macOS, .linux, .windows])),
      ]
    ),
    .target(
      name: "SVGBuilder",
      dependencies: [
        "DOMBuilder",
        "HTMLBuilder",
        .product(name: "WebTypes", package: "web-types"),
        .product(name: "EmbeddedSwiftUtilities", package: "embedded-swift-utilities"),
      ],
      path: "Sources/SVGBuilder",
      swiftSettings: [
        .enableExperimentalFeature("Embedded", .when(platforms: [.wasi])),
        .enableExperimentalFeature("Extern", .when(platforms: [.wasi])),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("StrictConcurrency"),
        .define("CLIENT", .when(platforms: [.wasi])),
        .define("SERVER", .when(platforms: [.macOS, .linux, .windows])),
      ]
    ),
    .target(
      name: "CSSOMBuilder",
      dependencies: [
        .product(name: "WebTypes", package: "web-types"),
        .product(name: "EmbeddedSwiftUtilities", package: "embedded-swift-utilities"),
      ],
      path: "Sources/CSSOMBuilder",
      swiftSettings: [
        .enableExperimentalFeature("Embedded", .when(platforms: [.wasi])),
        .enableExperimentalFeature("Extern", .when(platforms: [.wasi])),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("StrictConcurrency"),
        .define("CLIENT", .when(platforms: [.wasi])),
        .define("SERVER", .when(platforms: [.macOS, .linux, .windows])),
      ]
    ),
    .target(
      name: "CSSBuilder",
      dependencies: [
        "CSSOMBuilder",
        .product(name: "WebTypes", package: "web-types"),
        .product(name: "EmbeddedSwiftUtilities", package: "embedded-swift-utilities"),
      ],
      path: "Sources/CSSBuilder",
      swiftSettings: [
        .enableExperimentalFeature("Embedded", .when(platforms: [.wasi])),
        .enableExperimentalFeature("Extern", .when(platforms: [.wasi])),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("StrictConcurrency"),
        .define("CLIENT", .when(platforms: [.wasi])),
        .define("SERVER", .when(platforms: [.macOS, .linux, .windows])),
      ]
    ),
    .target(
      name: "JSBuilder",
      dependencies: [
        .product(name: "WebTypes", package: "web-types"),
        .product(name: "JSONLDFormat", package: "web-formats"),
        .product(name: "JSONImportMapFormat", package: "web-formats"),
        .product(name: "EmbeddedSwiftUtilities", package: "embedded-swift-utilities"),
      ],
      path: "Sources/JSBuilder",
      swiftSettings: [
        .enableExperimentalFeature("Embedded", .when(platforms: [.wasi])),
        .enableExperimentalFeature("Extern", .when(platforms: [.wasi])),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("StrictConcurrency"),
        .define("CLIENT", .when(platforms: [.wasi])),
        .define("SERVER", .when(platforms: [.macOS, .linux, .windows])),
      ]
    ),
    .testTarget(
      name: "WebBuildersTests",
      dependencies: ["HTMLBuilder", "CSSBuilder", "JSBuilder", "SVGBuilder"]
    ),
  ]
)
