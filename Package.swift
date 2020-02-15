// swift-tools-version:5.1
//
//  Package.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//
import PackageDescription

let package = Package(
    name: "Plug",
    products: [
        .library(
            name: "Plug",
            targets: ["Plug"])
    ],
    targets: [
        .target(
            name: "Plug",
            dependencies: [],
            path: "Plug"),
        .testTarget(
            name: "PlugTests",
            dependencies: ["Plug"],
            path: "PlugTests")
    ]
)
