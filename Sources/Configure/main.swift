// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Created by Sam Deane, 28/02/2018.
// All code (c) 2018 - present day, Elegant Chaos Limited.
// For licensing terms, see http://elegantchaos.com/license/liberal/.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import BuilderConfiguration

let settings = Settings(specs: [
    .base(
        values: [
          .setting("definition", "example")
        ],
        inherits: [
            .spec(name: "mac", filter: ["macOS"]),
            .spec(name: "debug", filter: ["debug"])
        ]
    ),
    .spec(
        name: "mac",
        values: [
          .setting("minimum-target", "macosx10.12"),
        ]
    ),
    .spec(
        name: "debug",
        values: [
          .setting("optimisation", "none")
        ]
    )
    ]
)

let configuration = Configuration(
    settings: settings,
    actions: [
        .action(name:"build", phases:[
            .toolPhase(name:"Preparing", tool: "BuilderToolExample"),
            .buildPhase(name:"Building", target:"BuilderExample"),
            .toolPhase(name:"Packaging", tool: "BuilderToolExample", arguments:["--show-environment", "--show-arguments"]),
            ]),
        .action(name:"test", phases:[
            .testPhase(name:"Testing", target:"BuilderExample"),
            ]),
        .action(name:"run", phases:[
            .actionPhase(name:"Building", action: "build"),
            .toolPhase(name:"Running", tool: "run", arguments:["BuilderExample"]),
            ]),
    ]
)

configuration.outputToBuilder()
