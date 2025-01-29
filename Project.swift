import ProjectDescription

let project = Project(
    name: "Disinfectapp",
    targets: [
        .target(
            name: "Disinfectapp",
            destinations: .macOS,
            product: .app,
            bundleId: "com.davidbures.Disinfectapp",
            infoPlist: .default,
            sources: ["Disinfectapp/Sources/**"],
            resources: ["Disinfectapp/Resources/**"],
            dependencies: [
                .external(name: "XAttr")
            ]
        ),
        .target(
            name: "DisinfectappTests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "io.tuist.DisinfectappTests",
            infoPlist: .default,
            sources: ["Disinfectapp/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Disinfectapp")]
        ),
    ]
)
