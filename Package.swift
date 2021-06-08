// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "ReblazeSDK",
    products: [
        .library(
            name: "ReblazeSDK",
            targets: ["ReblazeSDK"]),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "ReblazeSDK",
            path: "libs/iOS/ReblazeSDK.xcframework")
    ]
)
