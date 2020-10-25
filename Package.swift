// swift-tools-version:5.3

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
