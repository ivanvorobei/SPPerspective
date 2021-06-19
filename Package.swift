// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SPPerspective",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "SPPerspective",
            targets: ["SPPerspective"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SPPerspective",
            swiftSettings: [
                .define("SPPERSPECTIVE_SPM")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
