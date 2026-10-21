// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealIronSourceAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealIronSourceAdapter",
            targets: ["AppodealIronSourceAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/ironsource-mobile/LevelPlay-Swift-Package", exact: "9.6.0"),
    ],
    targets: [
        .target(
            name: "AppodealIronSourceAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "UnityMediationSDK", package: "LevelPlay-Swift-Package"),
                .target(name: "AppodealIronSourceAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealIronSourceAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealIronSourceAdapter/9.6.0.0.1/ead11fa92a85/AppodealIronSourceAdapter.xcframework.zip",
            checksum: "ead11fa92a853d3735e15d4a017657eb360542dcc49643e3b34e1ec9c625caf1"
        ),

    ]
)
