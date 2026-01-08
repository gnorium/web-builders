// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "web-builders",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .watchOS(.v10),
        .tvOS(.v17),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "HTMLBuilder", targets: ["HTMLBuilder"]),
        .library(name: "CSSBuilder", targets: ["CSSBuilder"]),
        .library(name: "JSBuilder", targets: ["JSBuilder"]),
        .library(name: "SVGBuilder", targets: ["SVGBuilder"]),
    ],
    dependencies: [
        .package(url: "https://github.com/gnorium/web-types", branch: "main"),
        .package(url: "https://github.com/gnorium/web-formats", branch: "main")
    ],
    targets: [
        .target(
            name: "HTMLBuilder",
            dependencies: [
                "CSSBuilder",
                "JSBuilder",
                .product(name: "JSONFormat", package: "web-formats"),
                .product(name: "JSONLDFormat", package: "web-formats"),
                .product(name: "WebTypes", package: "web-types")
            ],
            path: "Sources/HTMLBuilder",
            swiftSettings: [
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "SVGBuilder",
            dependencies: [
                "HTMLBuilder",
                .product(name: "WebTypes", package: "web-types")
            ],
            path: "Sources/SVGBuilder",
            swiftSettings: [
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "CSSBuilder",
            dependencies: [
                .product(name: "WebTypes", package: "web-types")
            ],
            path: "Sources/CSSBuilder",
            swiftSettings: [
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "JSBuilder",
            dependencies: [
                .product(name: "WebTypes", package: "web-types")
            ],
            path: "Sources/JSBuilder",
            swiftSettings: [
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("StrictConcurrency")
            ]
        ),
        .testTarget(
            name: "WebBuildersTests",
            dependencies: ["HTMLBuilder", "CSSBuilder", "JSBuilder", "SVGBuilder"]
        ),
    ]
)
