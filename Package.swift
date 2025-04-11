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
        // Wrapper target to expose both TwilioVoice and your xcframework
        .target(
            name: "C2CB_iOS_LibraryWrapper",
            dependencies: [
                "twilio-voice-ios",
                "C2CB_iOS_Library"
            ]
        ),
        // Your binary framework
        .binaryTarget(
            name: "C2CB_iOS_Library",
            path: "./C2CB_iOS_Library.xcframework"
        ),
    ]
)
