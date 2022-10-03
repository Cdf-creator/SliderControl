// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "SliderControl",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "SliderControl",
            type: .static,
            targets: [
                "SliderControl"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "SliderControl",
            dependencies: [],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)