# Flutter AR E-Commerce App

A cross-platform Flutter application that displays 3D product models using AR with the `<model-viewer>` element, supporting Android, iOS, and Web.

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 2.10.0 or later)
- For Android: Android Studio with SDK 21 or higher
- For iOS: Xcode 12 or higher, iOS device with ARKit support
- For Web: Chrome or Safari with WebXR support

## Installation

1. Install Flutter by following the [official instructions](https://docs.flutter.dev/get-started/install)
2. Clone this repository
3. Run `flutter pub get` to install dependencies

## Configuration

### Android

The app is configured with:
- `android:usesCleartextTraffic="true"` in AndroidManifest.xml
- `minSdkVersion 21` in build.gradle

### iOS

The app includes:
- `io.flutter.embedded_views_preview = true` in Info.plist
- Camera usage description for AR functionality

### Web

The web configuration includes:
- Model-viewer script loaded in index.html

## Running the App

- Android: `flutter run`
- iOS: `flutter run -d ios` (physical device required for AR)
- Web: `flutter run -d chrome`

## Features

- 3D model viewing with rotation and zoom
- AR mode to place models in real-world environment
- Support for multiple models with selection interface
- Cross-platform compatibility

## Troubleshooting

- If AR doesn't work on Android, ensure your device supports ARCore
- For iOS, check that the device supports ARKit
- For web, ensure you're using a browser with WebXR support

## Dependencies

- model_viewer_plus: ^1.9.3
- webview_flutter: ^4.0.0

## License

MIT

## Credits

This project uses Google's [Model Viewer](https://modelviewer.dev/) for AR functionality. 