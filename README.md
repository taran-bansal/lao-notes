# Flutter Notes App

A modern, feature-rich notes application built with Flutter, featuring a custom splash screen and material design.

## 🌟 Features

- 📝 Rich text editing with Flutter Quill
- 🎨 Custom splash screen with dynamic generation
- 🌙 Dark mode support
- 🔄 State management with GetX
- 💾 Local storage with SQLite
- 🎯 Material Design UI
- 🌍 Multi-language support
- ⚡ Fast and responsive

## 📱 Screenshots

[Screenshots will be added soon]

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.5.3)
- Dart SDK (^3.5.3)
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository
```bash
git clone https://github.com/taran-bansal/flutter-notes-app.git
```

2. Navigate to the project directory
```bash
cd flutter-notes-app
```

3. Install dependencies
```bash
flutter pub get
```

4. Generate and set up the splash screen
```bash
flutter run lib/splash_generator.dart
flutter run lib/copy_splash.dart
```

5. Run the app
```bash
flutter run
```

## 📂 Project Structure

```
lib/
├── common/              # Shared components, constants, and utilities
├── module/             # Feature modules
│   ├── dashboard/      # Dashboard feature
│   ├── home/          # Home screen
│   ├── login/         # Authentication
│   ├── notes/         # Notes management
│   └── settings/      # App settings
├── translations/       # Internationalization
├── ui_kit/            # Reusable UI components
└── main.dart          # Entry point
```

## 🛠️ Built With

- [Flutter](https://flutter.dev/) - UI framework
- [GetX](https://pub.dev/packages/get) - State management
- [Flutter Quill](https://pub.dev/packages/flutter_quill) - Rich text editor
- [SQLite](https://pub.dev/packages/sqflite) - Local database
- [Flutter Native Splash](https://pub.dev/packages/flutter_native_splash) - Splash screen
- [Google Fonts](https://pub.dev/packages/google_fonts) - Typography
- [Flutter SVG](https://pub.dev/packages/flutter_svg) - SVG support

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  google_fonts: ^6.2.1
  font_awesome_flutter: ^10.7.0
  get: ^4.6.6
  flutter_quill: [latest]
  hugeicons: ^0.0.7
  flutter_svg: ^2.0.16
  sqflite: ^2.4.1
  flutter_native_splash: ^2.4.4
```

## 🔧 Configuration

### Splash Screen

The splash screen can be configured in `pubspec.yaml`:

```yaml
flutter_native_splash:
  color: "#ffffff"
  image: assets/images/splash_logo.jpeg
  android: true
  android_12:
    image: assets/images/splash_logo.jpeg
    icon_background_color: "#ffffff"
```

## 🤝 Contributing

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## 👤 Author

Taran Bansal - [https://github.com/taran-bansal](https://github.com/taran-bansal)

## ✨ Acknowledgments

- Flutter team for the amazing framework
- All the package authors used in this project
- The Flutter community for their continuous support
