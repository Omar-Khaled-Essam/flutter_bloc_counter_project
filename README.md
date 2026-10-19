# Flutter BLoC Counter Mini Project

A small Flutter application demonstrating `flutter_bloc`, event-based BLoC, Cubit, `BlocProvider`, `context.read`, `BlocBuilder`, `BlocListener`, and `BlocConsumer`.

## Features

- **Phase 1:** `CounterBloc` increments/decrements an integer; `ThemeBloc` toggles light/dark mode.
- **Phase 2:** `BlocListener` shows a SnackBar at `5` or `-5`; `BlocBuilder` updates the counter UI; `BlocConsumer` combines rebuilding and SnackBar side effects at `10` or `-10`.
- **Phase 3:** `CounterCubit` has increment/decrement methods; a dialog appears when the counter crosses below zero; `BlocConsumer` shows SnackBars at `10` and `-10`.
- Separate files for each BLoC/Cubit and each screen.

## Run the project

1. Install Flutter and confirm `flutter doctor` has no blocking issues.
2. From the project root, run:

   ```bash
   flutter create .
   flutter pub get
   dart format .
   flutter run
   ```

   If `flutter create .` asks to overwrite existing files, keep the existing `lib/`, `pubspec.yaml`, and `README.md`; generate only the platform folders if needed.
3. To build an Android APK:

   ```bash
   flutter build apk --release
   ```

## Important Gradle setting

The file `android/gradle.properties` includes:

```properties
kotlin.incremental=false
```

This disables Kotlin incremental compilation, as requested. If you generate the Android platform folder after downloading this project, make sure this setting remains in `android/gradle.properties`.

## Screenshots for submission

Run the app and capture:
1. Phase 1 screen showing `CounterBloc` and `ThemeBloc`.
2. Phase 2 screen with the SnackBar at `5` or `-5`.
3. Phase 2 counter value changing through `BlocBuilder`.
4. Phase 3 screen showing the negative-value dialog and the `10` / `-10` SnackBar.

## GitHub

Create a **public** GitHub repository, then from this project folder:

```bash
git init
git add .
git commit -m "Build Flutter BLoC counter mini project"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git
git push -u origin main
```

Replace `YOUR_USERNAME` and `YOUR_REPOSITORY` with your actual GitHub details.
