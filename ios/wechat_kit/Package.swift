// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "wechat_kit",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "wechat-kit", targets: ["wechat_kit"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "wechat_kit",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                "WechatOpenSDK"
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ],
            cSettings: [
                .define("NO_PAY"),
                .headerSearchPath("include/wechat_kit")
            ],
            linkerSettings: [
                .linkedFramework("CoreGraphics"),
                .linkedFramework("Security"),
                .linkedFramework("WebKit"),
                .linkedLibrary("c++"),
                .linkedLibrary("z"),
                .linkedLibrary("sqlite3.0"),
                .unsafeFlags(["-ObjC", "-all_load"])
            ]
        ),
        .binaryTarget(
            name: "WechatOpenSDK",
            path: "Libraries/NoPay/WechatOpenSDK-XCFramework.xcframework"
        )
    ]
)
