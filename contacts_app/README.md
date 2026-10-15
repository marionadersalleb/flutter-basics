# Contacts App

A Flutter app for managing a small list of contacts, built from a Figma design.
Add a contact from a bottom sheet with a live preview, see the contacts in a grid, and delete them.

Practice project from the Route Mobile Diploma, Task Three. All data lives in memory (nothing is saved
between runs), and there is no backend.

## Features

| Feature | How it works |
|---------|--------------|
| **Splash screen** | Route logo on a dark blue screen, then moves to the home screen after 3 seconds |
| **Empty state** | A Lottie animation with the text "There is No Contacts Added Here" |
| **Add a contact** | The gold `+` button opens a modal bottom sheet. It returns the new `Contact` to the home screen when the form is valid |
| **Live preview** | A card at the top of the sheet updates on every keystroke, using listeners on the three text controllers |
| **Profile photo** | Tapping the placeholder animation opens the gallery with `image_picker`, and the chosen photo shows in the preview and the card |
| **Validation** | Name and phone are required, and the email must be a valid address (`Invalid Email`). Invalid fields get a red border |
| **Contacts grid** | Two columns, each card shows the photo, name, email, phone and a red Delete button |
| **Delete** | Each card deletes itself, and a red floating button deletes the last contact. The red button only appears when the list is not empty |
| **Limit** | At 6 contacts the add button disappears |

## Design tokens

| Token | Value |
|-------|-------|
| Dark blue (background) | `#29384D` |
| White | `#FFFFFF` |
| Light blue (hints) | `#E2F4F6` |
| Gold (text, buttons) | `#FFF1D4` |
| Red (errors, delete) | `#EE403D` |
| Screen padding | 16 horizontal |

## Project structure

```
contacts_app/
├── lib/
│   ├── main.dart              # theme and named routes
│   ├── common/                # colors, text styles, asset paths
│   ├── models/
│   │   └── contact.dart       # the Contact model
│   ├── screens/
│   │   ├── splash_screen.dart
│   │   └── home_screen.dart   # empty state, grid, and the two floating buttons
│   └── widgets/
│       ├── add_contact_sheet.dart   # the bottom sheet with the form and live preview
│       ├── contact_card.dart        # grid card and preview card
│       └── shared_widgets.dart      # logo, button and text field
├── assets/
│   ├── animations/            # Lottie JSON files
│   └── images/                # optional exported logo
├── pubspec.yaml
└── NOTES.ar.md                # my study notes (Arabic)
```

## Getting started

This folder contains only the Dart code and assets, so generate the platform folders first:

```bash
cd contacts_app
flutter create .
flutter pub get
flutter run
```

`flutter create .` may add a default `test/widget_test.dart` that targets the counter template.
Delete or adapt it, because this app has no counter.

Requires Flutter with Dart 3.0 or newer. Run it on a real device or an emulator, because
`image_picker` needs a gallery.

Depends on [`lottie`](https://pub.dev/packages/lottie) and [`image_picker`](https://pub.dev/packages/image_picker).
Depending on the platform, `image_picker` may need extra configuration (for example, permission
descriptions on iOS); see its documentation.

## Assets

- `empty_list.json` is the "Message" animation by Simon D Sopkov, from LottieFiles.
- `image_picker.json` is also from LottieFiles, and its author is not recorded in the file.

Both animations belong to their authors and are not covered by any license for this repository.

The Route logo is drawn as text in `shared_widgets.dart`. To use an exported image instead, put
`route_logo.png` in `assets/images/` and set `useImageLogo = true` in `RouteLogo`.

## Notes

- The bottom sheet uses `isScrollControlled: true` so it can grow past half the screen, and pads itself with
  `MediaQuery.of(context).viewInsets.bottom` so the keyboard does not hide the fields.
- The photo is read with `Image.file`, not `Image.asset`, because it comes from the device storage and
  not from the app's assets.
- Each floating button has its own `heroTag`. With more than one `FloatingActionButton` on a screen,
  Flutter throws an error if they share the default tag.
- The three text controllers are disposed in `dispose()` to avoid memory leaks.
- The splash screen checks `mounted` before navigating, because the delayed call can finish after the
  user has left the screen.

## Widgets and concepts practiced

`MaterialApp` with named routes, `Scaffold`, `FloatingActionButton`, `showModalBottomSheet`, `GridView.builder`
with `SliverGridDelegateWithFixedCrossAxisCount`, `Form` with `TextFormField` and validators,
`TextEditingController` with listeners, `StatefulWidget` with `setState` and `dispose`, `InkWell`,
`ClipRRect`, `Image.file`, collection-if, reusable widgets with `required` parameters, and `Future.delayed`
with a `mounted` check.
