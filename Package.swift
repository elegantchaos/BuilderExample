// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BuilderExample",
    products: [
        .executable(
            name: "BuilderExample",
            targets: ["BuilderExample"]),
    ],
    dependencies: [
      // example tool we're going to use in the build
      .package(url: "https://github.com/elegantchaos/BuilderToolExample.git", from: "1.0.6"),

      // support library we're going to use in the configuration target
      .package(url: "https://github.com/elegantchaos/BuilderConfiguration.git", from: "1.1.2"),

      // builder itself
      .package(url: "https://github.com/elegantchaos/Builder.git", from: "1.0.4"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "BuilderExample",
            dependencies: []),
          .target(
              name: "Configure",
            dependencies: ["BuilderConfiguration", "BuilderToolExample"]),
          .testTarget(
              name: "BuilderExampleTests",
              dependencies: ["BuilderExample"]),
    ]
)
