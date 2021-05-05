// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "SPPerspective",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "SPPerspective", targets: ["SPPerspective"]),
    ],
    targets: [
        .target(name: "SPPerspective", dependencies: [])
    ]
)
