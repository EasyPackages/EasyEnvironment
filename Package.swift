// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "EasyEnvironment",
    products: [
        .library(name: "EasyEnvironment", targets: ["EasyEnvironment"]),
        .library(name: "EasyAppEnvironment", targets: ["EasyAppEnvironment"]),
    ],
    dependencies: [
        .package(url: "https://github.com/EasyPackages/EasyCore.git", from: "0.0.1")
    ],
    targets: [
        .target(name: "EasyEnvironment"),
        
        .target(
            name: "EasyAppEnvironment",
            dependencies: [
                "EasyEnvironment",
                "EasyCore"
            ]
        ),
        .testTarget(
            name: "EasyAppEnvironmentTests",
            dependencies: ["EasyAppEnvironment"]
        ),
    ]
)
