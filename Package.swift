// swift-tools-version: 5.9.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BynnIDVerification",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "BynnIDVerification",
            targets: ["BynnIDVerification"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "BynnIDVerification",
            path: "releases/1.0.0/BynnIDVerification.xcframework.zip"
        )
    ]
)
