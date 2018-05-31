# BuilderExample

_Note: Builder requires Swift 4.2_

This is an example project for [Builder](https://github.com/elegantchaos/Builder), which is a build tool layered on top of the Swift Package Manager.

To build this example:

```
swift run builder run
```

What this command does is to ask the Swift Package Manager to build and run the product called `builder`, and to pass it the argument `run`.

The `builder` product is supplied by the Builder project, which is listed as a dependency in `Package.swift`.

When `builder` runs, it builds and runs the `Configure` target, which gives it a configuration.

It then looks up the `run` action in the configuration. This tells Builder what to do to build and run the example product.

The nice thing about all of this is that the build relies on three external dependencies (Builder itself, BuilderConfiguration, and an example tool BuilderToolExample), but you don't have to do any preliminary fetching or installing of things. As long as you have swift installed, you're good to go.
