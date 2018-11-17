// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let urls = [
    "https://github.com/PerfectlySoft/Perfect-HTTPServer.git",
    "https://github.com/PerfectlySoft/Perfect-PostgreSQL.git",
]

let package = Package(
    name: "PerfectServer",
    dependencies: urls.map { .package(url: $0, from: "3.0.0") },
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "PerfectServer",
            dependencies: ["PerfectHTTPServer", "PerfectPostgreSQL"]),
        .testTarget(
            name: "PerfectServerTests",
            dependencies: ["PerfectServer", "PerfectPostgreSQL"]),
    ]
)
