# Flutter Basics

Small Flutter apps I built while learning the framework in the **Flutter & Dart Bootcamp**
(Route Academy). Each folder is a standalone Flutter project with its own README.

## Projects

| Project | What it is | Core ideas |
|---------|------------|------------|
| [`whatsapp_ui`](whatsapp_ui/) | WhatsApp chat screen in dark mode, replicated from Figma | Layout widgets, `Stack`, `BoxDecoration`, `TextFormField` |
| [`facebook_app`](facebook_app/) | Facebook app with splash, login with validation, and a tabbed home feed | `TabBar`, `Form` validation, `ListView.builder`, navigation, reusable widgets |

More projects will be added here as the course goes on.

## Running a project

Install [Flutter](https://docs.flutter.dev/get-started/install), then pick a project folder (`whatsapp_ui` or `facebook_app`):

```bash
cd facebook_app
flutter create .   # generates the platform folders
flutter pub get
flutter run
```

## Related

- [dart-fundamentals](https://github.com/marionadersalleb/dart-fundamentals): the Dart exercises that come before this course stage.
