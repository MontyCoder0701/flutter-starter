# Flutter Starter

This is a simple starter repository for Flutter projects.  
Use it for hackathons or external projects as a boilerplate — clone and customize as needed.

## What's Included

### State Management

- [**Riverpod**](https://riverpod.dev/) for basic state management
- Applied to theme and locale

### Router

- [**go_router**](https://pub.dev/packages/go_router) for navigation
- Applied shell router to bottom navigation bar

### Translations

- Using Flutter's localizations and intl:

> Change `lib/l10n/app_en.arb` and run `flutter gen-l10n` to just generate translation

### Local Storage

- [**shared_preferences**](https://pub.dev/packages/shared_preferences) for local storage
- Applied to theme persistance

### Maintenance

- **Release Please**: automated release management
- **Dependabot**: automatic dependency updates
- **Dependabot Validation**: automatic build check for dependabot PRs
- **CI**: basic continuous integration for lint checks
- [**Upgrader**](https://pub.dev/packages/upgrader): alerts users when update is published in
  application store

### Design

- Component: Material(Google)
- Layout: includes bottom navigation bar
- Theme: light, dark with state management and local storage
- Supported OS: iOS, Android
- App icon:

> Change `assets/icon/icon.png` and run `flutter pub run flutter_launcher_icons`

## Preview

<!-- markdownlint-disable MD033 -->

### iOS

<img width="300" alt="Screenshot 2025-05-25 at 1 24 47 PM" src="https://github.com/user-attachments/assets/d038ce8b-a4e7-4956-88d9-a15d2c5fc828" />

<img width="300" alt="Screenshot 2025-05-25 at 1 24 47 PM" src="https://github.com/user-attachments/assets/034419d1-1075-4610-97cc-121e4b16c293" />

### Android

<img width="300" alt="Screenshot 2025-05-25 at 1 24 47 PM" src="https://github.com/user-attachments/assets/36dca49c-e37f-432f-b93d-461fad5a6ae7" />

<img width="300" alt="Screenshot 2025-05-25 at 1 24 47 PM" src="https://github.com/user-attachments/assets/79d4995a-a774-44c8-9918-798a28c30b14" />

## Notice

- If you're using Dependabot, ensure the following setting is enabled:

> **Settings → Actions → General → Allow GitHub Actions to create and approve pull requests**

- This assumes you are using Java 21 (Bundled with Android Studio Meerkat). If you are having
  trouble building the Android project, adjust your settings to use Java 21 JDK.
