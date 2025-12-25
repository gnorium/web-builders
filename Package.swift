// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "WebBuilders",
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
        .package(url: "https://github.com/gnorium/web-types", from: "1.0.0"),
        .package(url: "https://github.com/gnorium/web-formats", from: "1.0.0")
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
                .enableUpcomingFeature("BareSlashRegexLiterals"),
                .enableUpcomingFeature("ConciseMagicFile"),
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("ForwardTrailingClosures"),
                .enableUpcomingFeature("ImplicitOpenExistentials"),
                .enableUpcomingFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "SVGBuilder",
            dependencies: ["HTMLBuilder"],
            path: "Sources/SVGBuilder",
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals"),
                .enableUpcomingFeature("ConciseMagicFile"),
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("ForwardTrailingClosures"),
                .enableUpcomingFeature("ImplicitOpenExistentials"),
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
                .enableUpcomingFeature("BareSlashRegexLiterals"),
                .enableUpcomingFeature("ConciseMagicFile"),
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("ForwardTrailingClosures"),
                .enableUpcomingFeature("ImplicitOpenExistentials"),
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
                .enableUpcomingFeature("BareSlashRegexLiterals"),
                .enableUpcomingFeature("ConciseMagicFile"),
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("ForwardTrailingClosures"),
                .enableUpcomingFeature("ImplicitOpenExistentials"),
                .enableUpcomingFeature("StrictConcurrency")
            ]
        ),
        .testTarget(
            name: "WebBuildersTests",
            dependencies: ["HTMLBuilder", "CSSBuilder", "JSBuilder", "SVGBuilder"]
        ),
    ]
)
