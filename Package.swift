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
        .library(
            name: "WebBuilders",
            targets: ["WebBuilders"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/gnorium/web-types", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "WebBuilders",
            dependencies: [
                .product(name: "WebTypes", package: "web-types")
            ],
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals"),
                .enableUpcomingFeature("ConciseMagicFile"),
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("ForwardTrailingClosures"),
                .enableUpcomingFeature("ImplicitOpenExistentials"),
                .enableUpcomingFeature("StrictConcurrency"),
                .unsafeFlags(["-warn-concurrency"], .when(configuration: .debug)),
            ]
        ),
        .testTarget(
            name: "WebBuildersTests",
            dependencies: ["WebBuilders"]
        ),
    ]
)
