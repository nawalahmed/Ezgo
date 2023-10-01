// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ezgo",
    dependencies: [
        // ... Other dependencies
        .package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.0"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-SQLite.git", from: "3.0.0"),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", from: "1.9.0"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-Mustache.git", from: "3.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "ezgo",
            dependencies: [.product(name: "PerfectHTTPServer", package: "Perfect-HTTPServer"), .product(name: "PerfectSQLite", package: "Perfect-SQLite"), .product(name: "SwiftyBeaver", package: "SwiftyBeaver"), .product(name: "PerfectMustache", package: "Perfect-Mustache")]),
        .testTarget(
            name: "ezgoTests",
            dependencies: ["ezgo"]),
    ]
)
