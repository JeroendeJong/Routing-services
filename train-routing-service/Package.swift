// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "TrainRoutingService",
    products: [
        .library(name: "TrainRoutingService", targets: ["App"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(url: "https://github.com/vapor/postgresql.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["PostgreSQL", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
    ]
)

