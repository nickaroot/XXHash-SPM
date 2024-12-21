// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "XXHashWrapper",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v4)
    ],
    products: [
        .library(
            name: "XXHashWrapper",
            targets: ["XXHashWrapper"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "XXHashWrapper",
            dependencies: ["xxHash"],
            path: "Sources/XXHashWrapper",
            cSettings: [
                .headerSearchPath("../xxHashTarget/include"),
                .define("SWIFT_BRIDGING_HEADER", to: "Sources/XXHashWrapper/XXHashWrapper-Bridging-Header.h"),
                .define("XXH_INLINE_ALL", to: "1"),
            ]
        ),
        .target(
            name: "xxHash",
            path: "Sources/xxHashTarget",
            sources: ["."],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .define("XXH_INLINE_ALL", to: "1"),
            ]
        ),
        .testTarget(
            name: "XXHashWrapperTests",
            dependencies: ["XXHashWrapper"]
        ),
    ]
)
