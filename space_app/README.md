# Space App

A Flutter app for exploring the solar system, built from a Figma design.
Swipe through the Sun and the eight planets, then open a details page with an interactive 3D model,
a description and a table of data.

Practice project from the Route Mobile Diploma, Task Four. It is a UI exercise with local data
and no backend.

## Screens

| Screen | What it does |
|--------|--------------|
| **Explore** | Full-screen space image with the headline "Explore The Universe" and an Explore button that opens the planet list |
| **Home** | Header image with a gradient, and a `PageView` of the planets. Swiping or tapping the round arrow buttons changes the planet, and the bottom button reads `Explore <planet>` and follows the current one |
| **Planet details** | The planet's 3D model (touch to rotate), an About section, and a table with seven facts: distance from the Sun, length of day, orbital period, radius, mass, gravity and surface area |

## Design tokens

| Token | Value |
|-------|-------|
| Black (background) | `#0E0E0E` |
| White | `#FFFFFF` |
| Red (buttons) | `#EE403D` |
| Screen padding | 16 horizontal |

## How it is built

- **Named routes.** The three screens are registered in `main.dart`, and the home screen passes the chosen
  `Planet` to the details screen as a route argument.
- **Data-driven UI.** Each `Planet` describes its own table rows in `infoRows`, so adding a row is one line in
  the model and needs no change to the screen. The planets themselves are a list in `planets_data.dart`.
- **One widget per file.** The screens only wire widgets together, and shared pieces such as the gradient,
  the stacked app bar and the round action button are written once and reused.
- **Controller lifecycle.** The `PageController` is created in the state class and disposed in `dispose()`.
- **3D models** are shown with the [`flutter_3d_controller`](https://pub.dev/packages/flutter_3d_controller) package.

## Project structure

```
space_app/
├── lib/
│   ├── main.dart            # theme and named routes
│   ├── common/              # colors and text styles
│   ├── models/              # Planet model and the planets data
│   ├── screens/             # explore, home, planet details
│   └── widgets/             # buttons, gradient, app bar, page item, selector, 3D viewer, info table
├── assets/
│   ├── images/              # one picture per planet, used as backgrounds
│   └── models/              # .glb 3D models
├── pubspec.yaml
└── NOTES.ar.md              # my study notes (Arabic)
```

## Getting started

This folder contains only the Dart code and assets, so generate the platform folders first:

```bash
cd space_app
flutter create .
flutter pub get
flutter run
```

`flutter create .` may add a default `test/widget_test.dart` that targets the counter template.
Delete or adapt it, because this app has no counter.

Requires Flutter with Dart 3.0 or newer.

Run it on a real device or an emulator. The 3D viewer needs extra setup to work in a browser, and iOS needs
a small configuration change; see the
[package documentation](https://pub.dev/packages/flutter_3d_controller) for the platform details.

## Assets

The planet pictures and the `.glb` 3D models come from the course materials and are included here only so
the project runs as a learning exercise. They belong to their respective owners and are not covered by any
license for this repository.

- The planet pictures were resized to at most 800 px, because full-size images can run a phone out of memory.
- `assets/models/solar_system.glb` is not used by the app. Delete it if you want a smaller download.
- The `.glb` files add up to about 25 MB.

## Widgets and concepts practiced

`MaterialApp` with named routes and route arguments, `Scaffold`, `Stack` and `Positioned`, `PageView.builder`
with a `PageController` and `viewportFraction`, `LinearGradient`, `ClipRRect`, `Image.asset`,
`ElevatedButton.styleFrom`, `StatefulWidget` with `setState` and `dispose`, reusable widgets with `required`
parameters, `static const` classes for colors and text styles, and collection-if.
