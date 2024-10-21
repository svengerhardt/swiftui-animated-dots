// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "AnimatedDots",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .tvOS(.v14)
    ],
    products: [
        .library(
            name: "AnimatedDots",
            targets: ["AnimatedDots"]),
    ],
    targets: [
        .target(
            name: "AnimatedDots"),

    ]
)
