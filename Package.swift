// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "C2CB_iOS_Library",
    platforms: [
            .iOS(.v13)
        ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "C2CB_iOS_Library",
            targets: ["C2CB_iOS_Library_Package"]),
    ],
    dependencies: [
            .package(url: "https://github.com/twilio/twilio-voice-ios", from: "6.13.0")
        ],
    targets: [
        .target(
                name: "C2CB_iOS_Library_Package",
                dependencies: [
                    "twilio-voice-ios",
                    "C2CB_iOS_Library"
                ],
                path: "Sources",
               ),
        .binaryTarget(
            name: "C2CB_iOS_Library",
            path: "./C2CB_iOS_Library.xcframework"
        ),
       ]
)
