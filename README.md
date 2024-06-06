A core set of widgets, types, and services to create Fermilab applications.


## Features

-   Provides a `ControlsRouterApp` widget to create a base, scaffold widget that
    has a standardized theme.
-   Provides a class that accesses the Fermilab GraphQL API.
-   Provides a widget that authenticates users.

## Getting started

The latest, stable branch is `v0.1.x`. To add this package to your application,
add this dependency to your `pubspec.yaml` file:

```yaml
flutter_controls_core:
    git:
        url: https://github.com/fermi-ad/flutter-controls-core.git
        ref: v0.1.x
```

_NOTE:_ This project is under very active development so calling this the
"stable" branch is a stretch. With each pull request, we will create a tag to
point to it. If the HEAD of the `v0.1.x` produces a regression, you can
temporarily use a tag as the `git` "ref:" parameter to get back to a more
reliable version.

## Usage

TODO: Need to add content here.

## Additional information

If more GraphQL queries are added, the `builder` needs to run to generate the
code. The command to do this is:

```shell
$ dart run build_runner build --delete-conflicting-outputs
```
