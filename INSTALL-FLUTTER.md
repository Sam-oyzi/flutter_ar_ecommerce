# Installing Flutter on Windows

This guide provides step-by-step instructions for installing Flutter on Windows.

## System Requirements

- Windows 7 SP1 or later (64-bit)
- At least 1.64 GB of disk space (excluding IDE and tools)
- PowerShell 5.0 or newer / Git for Windows
- Windows PowerShell 5.0 or newer
- Git for Windows

## Installation Steps

### 1. Download Flutter SDK

1. Visit the [Flutter SDK download page](https://docs.flutter.dev/get-started/install/windows)
2. Click on the "flutter_windows_X.X.X-stable.zip" link to download the latest stable release
3. Extract the ZIP file to a location on your machine (e.g., `C:\flutter`)
   - **Important**: Do not install Flutter in a directory like `C:\Program Files\` that requires elevated privileges

### 2. Update Path Environment Variable

1. Search for "Environment Variables" in the Windows search bar
2. Click "Edit the system environment variables"
3. Click the "Environment Variables" button
4. Under "System variables", find the "Path" variable, select it, and click "Edit"
5. Click "New" and add the path to the Flutter bin directory:
   - `C:\flutter\bin` (replace with your Flutter installation path)
6. Click "OK" to save changes in all dialogs

### 3. Verify Installation

1. Close any existing PowerShell or command prompt windows
2. Open a new PowerShell or command prompt window
3. Run the following command to verify that Flutter is available:

```
flutter --version
```

4. Run Flutter doctor to check for dependencies:

```
flutter doctor
```

5. Flutter doctor will identify any issues that need to be resolved, such as:
   - Android SDK installation
   - Android Studio installation
   - VS Code or other IDE installation
   - Connected devices

### 4. Install Android Studio (for Android development)

1. Download and install [Android Studio](https://developer.android.com/studio)
2. During setup, make sure to select:
   - Android SDK
   - Android SDK Platform
   - Android Virtual Device
3. Launch Android Studio and complete the setup wizard
4. Install the Flutter and Dart plugins:
   - Go to File → Settings → Plugins
   - Search for "Flutter" and install the plugin
   - This will also install the Dart plugin

### 5. Install Xcode (for iOS development - requires macOS)

This step is only relevant if you have a Mac. Flutter iOS development cannot be done on Windows.

### 6. Configure Flutter for Web Development

Run the following command to enable web support:

```
flutter config --enable-web
```

## Troubleshooting

- If `flutter doctor` shows errors, follow the recommended steps to fix them
- If Flutter commands aren't recognized, check that you've added Flutter to your PATH correctly
- For Android Studio issues, try reinstalling the Flutter and Dart plugins
- Run `flutter doctor --android-licenses` to accept all Android licenses

## Next Steps

After installation, you can:

1. Create a new Flutter project:
   ```
   flutter create my_app
   ```

2. Navigate to your project directory:
   ```
   cd my_app
   ```

3. Run your app:
   ```
   flutter run
   ```

For more information, visit the [Flutter documentation](https://docs.flutter.dev). 