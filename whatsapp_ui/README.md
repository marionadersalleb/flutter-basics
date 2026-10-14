# WhatsApp UI

A Flutter replica of a WhatsApp chat screen in dark mode, built from a Figma design.
It is a static UI exercise (no state and no backend) focused on layout and the core widgets.

Practice project from the Route Mobile Diploma, Task One.

## What is on the screen

| Area | What it contains |
|------|------------------|
| **App bar** | Back button, circular profile placeholder, contact name in bold green (14), call, video call and more-options icons |
| **Body** | Dark `#181818` background with a faint repeating icon pattern, and a scrollable list of five messages: incoming (left, green), outgoing (right, grey) and one image message |
| **Input bar** | Rounded text field with a green 1px outline, camera icon (prefix), send icon (suffix), hint text, and a circular green mic button |

### Design tokens

| Token | Value |
|-------|-------|
| Green | `#168C4B` |
| Background | `#181818` |
| Outgoing bubble | `#232D36` |
| Text | `#FFFFFF` |
| Screen padding | 16 horizontal |
| Bubble radius | 16, with a square top corner pointing at the sender |

## Project structure

```
whatsapp_ui/
├── lib/
│   ├── main.dart          # MaterialApp and entry point
│   └── chat_screen.dart   # the whole chat screen
├── assets/images/         # optional exported Figma images (see below)
├── pubspec.yaml
└── NOTES.ar.md            # my study notes (Arabic)
```

## Getting started

This folder contains only the Dart code, so generate the platform folders first:

```bash
cd whatsapp_ui
flutter create .
flutter pub get
flutter run
```

`flutter create .` may add a default `test/widget_test.dart` that targets the counter template.
Delete or adapt it, because this app has no counter.

Requires Flutter with Dart 3.0 or newer.

## Widgets practiced

`MaterialApp`, `Scaffold`, `AppBar`, `Column`, `Row`, `Stack`, `Expanded`, `Container`,
`BoxDecoration` with `BorderRadius.only`, `Align`, `Padding`, `SingleChildScrollView`,
`IconButton`, and `TextFormField` with `InputDecoration` and `OutlineInputBorder`.

## Notes

- The text field sets `border`, `enabledBorder` and `focusedBorder` to the same value,
  otherwise the outline turns blue when the field is focused.
- `Expanded` around the `SingleChildScrollView` is required, because a `Column` inside a
  `Column` has no bounded height otherwise.
- The background pattern is drawn with transparent icons. To use the exported Figma tile instead,
  add it under `assets/images/`, uncomment `assets:` in `pubspec.yaml`, and swap the pattern
  `Column` for `Image.asset(..., repeat: ImageRepeat.repeat)`.
- The logo and profile picture are placeholders and can be replaced with exported images the same way.
