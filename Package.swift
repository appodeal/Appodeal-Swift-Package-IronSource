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
        .package(url: "https://github.com/ironsource-mobile/Unity-Mediation-iAds-Swift-Package", exact: "9.4.0"),
    ],
    targets: [
        .target(
            name: "AppodealIronSourceAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "UnityMediationSDK", package: "Unity-Mediation-iAds-Swift-Package"),
                .target(name: "AppodealIronSourceAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealIronSourceAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealIronSourceAdapter/9.4.0.0.0/AppodealIronSourceAdapter.xcframework.zip",
            checksum: "2a31c6026f6cd0b5197d70ccc23acd01f2f6cf7bdd4eed72d3d098bd60298c31"
        ),

    ]
)
