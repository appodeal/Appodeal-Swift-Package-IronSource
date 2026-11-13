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
        .package(url: "https://github.com/ironsource-mobile/LevelPlay-Swift-Package", exact: "9.8.0"),
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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealIronSourceAdapter/9.8.0.0.0/77424308ef6c/AppodealIronSourceAdapter.xcframework.zip",
            checksum: "77424308ef6c202bee116b2e5d8aa87443b615c7c33aa3804c8267b80dc1aec6"
        ),

    ]
)
