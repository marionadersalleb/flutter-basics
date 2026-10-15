# Facebook App

A three-screen Flutter replica of the Facebook mobile app, built from a Figma design:
a splash screen, a login screen with form validation, and a home screen with a tabbed feed.

Practice project from the Route Mobile Diploma, Task Two. It is a UI exercise: there is no backend,
and the feed is built from local sample data.

## Screens

| Screen | What it does |
|--------|--------------|
| **Splash** | Facebook logo in the centre and "from Meta" at the bottom, then moves to the login screen after 3 seconds |
| **Login** | Email and password fields with validation, a show/hide password toggle, a blue Login button, a "Forgotten Password?" link and a Create Account button. A valid form opens the home screen |
| **Home** | App bar with the Facebook wordmark and three round action buttons, a six-tab bar, a "What's in Your Mind?" row, a horizontal stories strip and a scrollable list of posts |

### Login validation

- **Email:** required, and must match the `example@mail.domain` format, otherwise `Invalid Email`.
- **Password:** required, at least 8 characters, and must contain an uppercase letter, a lowercase letter,
  a number and a special character. Each rule has its own error message.

The rules live in `lib/common/app_validators.dart`, separate from the screen, so they can be reused and tested alone.

### Home

- Six tabs in the app bar (home, watch, marketplace, groups, notifications, menu). Only the first one has content;
  the others show a placeholder.
- Stories and posts are built with `ListView.builder` from the lists in `lib/models/`. Adding an item to those
  lists adds it to the screen without touching any widget.

## Design tokens

| Token | Value |
|-------|-------|
| Blue | `#1877F2` |
| White | `#FFFFFF` |
| Gray | `#898F9C` |
| Black | `#242527` |
| Error | `#EE403D` |
| Screen padding | 16 horizontal |

## Project structure

One widget per file, and the screens only wire the widgets together.

```
facebook_app/
├── lib/
│   ├── main.dart
│   ├── common/        # colors, text styles, asset paths, validators
│   ├── models/        # Story and Post models with sample data
│   ├── screens/       # splash, login, home
│   └── widgets/       # buttons, text field, logos, app bar, story and post widgets
├── assets/images/     # photos used by the feed (not included, see below)
├── pubspec.yaml
└── NOTES.ar.md        # my study notes (Arabic)
```

## Getting started

This folder contains only the Dart code, so generate the platform folders first:

```bash
cd facebook_app
flutter create .
flutter pub get
flutter run
```

`flutter create .` may add a default `test/widget_test.dart` that targets the counter template.
Delete or adapt it, because this app has no counter.

Requires Flutter with Dart 3.0 or newer.

### Images

The photos and logos come from the course's Figma file, so they are **not included** in this repository.
The code expects these files in `assets/images/`:

| File | Used for |
|------|----------|
| `avatar.jpg`, `user1.jpg`, `user2.jpg` | profile pictures |
| `story1.jpg` to `story5.jpg` | story cards |
| `post1.jpg` to `post3.jpg` | feed posts |

Until you add images with those names, the image widgets cannot load them. Any JPEG works.

The Facebook and Meta logos are drawn in code, so they need no files.

## Native splash screen

The Flutter splash screen works out of the box. The Figma brief also asks for a native splash screen
(shown before Flutter starts), which uses the `flutter_native_splash` package. Its configuration is
commented out in `pubspec.yaml` because it needs exported logo images. To enable it:

1. Uncomment `flutter_native_splash` under `dev_dependencies` and the `flutter_native_splash:` block at the end of `pubspec.yaml`.
2. Export `fb_logo.png` and `meta_logo.png` into `assets/images/`.
3. Run `flutter pub get`, then `dart run flutter_native_splash:create`.

## Widgets and concepts practiced

`MaterialApp`, `Scaffold`, `AppBar` with `TabBar` in `AppBar.bottom`, `DefaultTabController`, `TabBarView`,
`PreferredSizeWidget`, `Column`, `Row`, `Stack`, `Expanded`, `Container`, `BoxDecoration`, `ClipRRect`,
`Image.asset`, `ListView.builder`, `Form` with `TextFormField` and `GlobalKey<FormState>`, `StatefulWidget`
with `setState`, `Navigator.push` and `pushReplacement`, `Future.delayed` with a `mounted` check,
custom reusable widgets with `required` parameters, and `const` models.

## Notes

- The text field defines `border`, `enabledBorder`, `focusedBorder`, `errorBorder` and `focusedErrorBorder`.
  If one is missing, Flutter falls back to its default blue outline in that state.
- `ClipRRect` is needed around images, because the `borderRadius` of a `BoxDecoration` only rounds the
  background, not the child.
- The splash screen checks `mounted` before navigating, because the delayed call can finish after the user
  has left the screen.
