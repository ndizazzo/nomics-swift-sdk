// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "NomicsSDK",
    products: [
        .library(
            name: "NomicsSDK",
            targets: ["NomicsSDK"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "NomicsSDK",
            dependencies: []),
        .testTarget(
            name: "NomicsSDKTests",
            dependencies: ["NomicsSDK"]),
    ]
)
