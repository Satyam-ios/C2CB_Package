// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "C2CB_iOS_Library",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "C2CB_iOS_Library",
            targets: ["C2CB_iOS_LibraryWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/twilio/twilio-voice-ios", from: "6.13.0")
    ],
    targets: [
        .target(
            name: "C2CB_iOS_LibraryWrapper",
            dependencies: [
                // Use the product name from the dependency
                .product(name: "TwilioVoice", package: "twilio-voice-ios"),
                "C2CB_iOS_Library"
            ]
        ),
        .binaryTarget(
            name: "C2CB_iOS_Library",
            path: "./C2CB_iOS_Library.xcframework"
        ),
    ]
)
