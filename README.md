# Daloy

A modern Flutter web application with a clean architecture and beautiful UI.

## 🎨 Color Palette

- **Primary**: `#1D6EAF` - Main brand color
- **Secondary**: `#5F9B39` - Supporting color
- **Accent**: `#E5AC21` - Highlight color
- **Error**: `#FF4040` - Error states

## 📁 Project Structure

```
lib/
├── main.dart                 # Application entry point
├── screens/                  # Screen/Page widgets
│   ├── home_screen.dart
│   └── splash_screen.dart
├── widgets/                  # Reusable custom widgets
│   ├── custom_button.dart
│   ├── custom_card.dart
│   ├── custom_text_field.dart
│   └── loading_indicator.dart
├── utils/                    # Utilities and constants
│   ├── app_colors.dart      # Color definitions
│   ├── app_constants.dart   # App-wide constants
│   ├── app_assets.dart      # Asset path references
│   └── app_theme.dart       # Theme configuration
└── services/                 # Business logic and services
    ├── api_service.dart     # HTTP API calls
    ├── storage_service.dart # Local storage
    └── navigation_service.dart # Navigation helper
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK (included with Flutter)
- A web browser (Chrome recommended for development)

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repository-url>
   cd daloy
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run -d chrome
   ```
   Or for other browsers:
   ```bash
   flutter run -d edge
   flutter run -d web-server
   ```

### Building for Production

To build the web application for production:

```bash
flutter build web
```

The output will be in the `build/web` directory, which can be deployed to any web hosting service.

## 🎯 Features

- **Custom Theme**: Fully customized Material Design 3 theme with Urbanist font family
- **Responsive Design**: Optimized for web browsers
- **Custom Widgets**: Reusable components for consistent UI
- **Service Architecture**: Organized services for API calls, storage, and navigation
- **Font Awesome Icons**: Beautiful icons using Font Awesome Flutter package
- **Loading States**: Elegant loading indicators with Flutter SpinKit

## 🎨 Typography

The app uses the **Urbanist** font family with three weights:
- **Regular**: For body text
- **Medium**: For labels and emphasis
- **Bold**: For headings and titles

## 📦 Dependencies

- `font_awesome_flutter: ^10.7.0` - Icon library
- `flutter_spinkit: ^5.2.0` - Loading animations
- `fluttertoast: ^8.2.4` - Toast notifications
- `intl: ^0.20.2` - Internationalization
- `http: ^1.1.0` - HTTP requests
- `shared_preferences: ^2.2.2` - Local storage

## 🛠️ Development

### Adding New Screens

1. Create a new file in `lib/screens/`
2. Import necessary utilities and widgets
3. Use the custom theme and colors from `utils/`

Example:
```dart
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Screen')),
      body: const Center(child: Text('Content')),
    );
  }
}
```

### Using Custom Widgets

```dart
// Custom Button
CustomButton(
  text: 'Click Me',
  onPressed: () {},
  type: ButtonType.primary,
  icon: FontAwesomeIcons.check,
)

// Custom Text Field
CustomTextField(
  labelText: 'Email',
  hintText: 'Enter your email',
  prefixIcon: FontAwesomeIcons.envelope,
)

// Custom Card
CustomCard(
  child: Text('Card Content'),
  onTap: () {},
)
```

### Using Services

```dart
// API Service
final apiService = ApiService();
final data = await apiService.get('/endpoint');

// Storage Service
final storage = StorageService();
await storage.setString('key', 'value');
final value = storage.getString('key');

// Navigation Service
NavigationService().navigateTo('/route');
```

## 🎨 Customization

### Changing Colors

Edit `lib/utils/app_colors.dart` to modify the color palette.

### Modifying Theme

Edit `lib/utils/app_theme.dart` to customize the app theme.

### Adding Assets

1. Place assets in the `assets/` directory
2. Update `pubspec.yaml` if needed
3. Reference them in `lib/utils/app_assets.dart`

## 📱 Platform Support

Currently optimized for:
- ✅ Web (Chrome, Firefox, Safari, Edge)
- ⚠️ Android (requires testing)
- ⚠️ iOS (requires testing)
- ⚠️ Desktop (requires testing)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 👨‍💻 Author

Daloy Development Team

---

**Happy Coding! 🚀**
