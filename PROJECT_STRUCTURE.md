# Daloy - Project Structure Overview

## 📂 Complete File Structure

```
daloy/
├── lib/
│   ├── main.dart                          # App entry point
│   │
│   ├── screens/                           # All screen/page widgets
│   │   ├── home_screen.dart              # Main home screen
│   │   └── splash_screen.dart            # Loading/splash screen
│   │
│   ├── widgets/                           # Reusable custom widgets
│   │   ├── custom_button.dart            # Customizable button widget
│   │   ├── custom_card.dart              # Card wrapper widget
│   │   ├── custom_text_field.dart        # Text input field
│   │   └── loading_indicator.dart        # Loading spinner
│   │
│   ├── utils/                             # Utilities and configuration
│   │   ├── app_colors.dart               # Color palette (#1D6EAF, #5F9B39, #E5AC21, #FF4040)
│   │   ├── app_constants.dart            # App constants (spacing, sizes, durations)
│   │   ├── app_assets.dart               # Asset path references (logo, fonts)
│   │   └── app_theme.dart                # Material theme configuration
│   │
│   └── services/                          # Business logic services
│       ├── api_service.dart              # HTTP API requests (GET, POST, PUT, DELETE)
│       ├── storage_service.dart          # Local storage (SharedPreferences)
│       └── navigation_service.dart       # Navigation helper
│
├── assets/
│   ├── images/
│   │   └── logo.png                      # App logo
│   └── fonts/
│       ├── Urbanist-Regular.ttf          # Regular font weight
│       ├── Urbanist-Medium.ttf           # Medium font weight
│       └── Urbanist-Bold.ttf             # Bold font weight
│
├── pubspec.yaml                           # Dependencies and assets
├── README.md                              # Full documentation
└── PROJECT_STRUCTURE.md                   # This file

```

## 🎨 Color Scheme

| Color Name | Hex Code  | Usage                    |
|------------|-----------|--------------------------|
| Primary    | #1D6EAF   | Main brand color         |
| Secondary  | #5F9B39   | Supporting actions       |
| Accent     | #E5AC21   | Highlights & emphasis    |
| Error      | #FF4040   | Error states & warnings  |

## 🔤 Typography (Urbanist Font)

- **Regular** (`assets/fonts/Urbanist-Regular.ttf`) - Body text
- **Medium** (`assets/fonts/Urbanist-Medium.ttf`) - Labels, buttons
- **Bold** (`assets/fonts/Urbanist-Bold.ttf`) - Headings, titles

## 📦 Key Dependencies

- `font_awesome_flutter` - Icons throughout the app
- `flutter_spinkit` - Loading animations
- `http` - API requests
- `shared_preferences` - Local data storage

## 🚀 Quick Start Commands

```bash
# Install dependencies
flutter pub get

# Run on Chrome
flutter run -d chrome

# Build for production
flutter build web
```

## 📝 File Descriptions

### Utils
- **app_colors.dart**: Defines all color constants used in the app
- **app_constants.dart**: Contains spacing, font sizes, animation durations
- **app_assets.dart**: Central reference for all asset paths
- **app_theme.dart**: Complete Material theme with custom fonts and colors

### Screens
- **home_screen.dart**: Main landing page with logo and welcome message
- **splash_screen.dart**: Initial loading screen with branding

### Widgets
- **custom_button.dart**: Button with multiple styles (primary, secondary, outlined, text)
- **custom_card.dart**: Elevated card container with optional tap action
- **custom_text_field.dart**: Text input with icons and validation
- **loading_indicator.dart**: Animated loading spinner

### Services
- **api_service.dart**: Singleton service for HTTP requests
- **storage_service.dart**: Wrapper for SharedPreferences
- **navigation_service.dart**: Context-free navigation helper

## 🎯 Design Principles

1. **Separation of Concerns**: Clear separation between UI, logic, and data
2. **Reusability**: Custom widgets for consistent UI across the app
3. **Maintainability**: Centralized constants and theme configuration
4. **Scalability**: Service-based architecture for easy feature additions

## 💡 Usage Examples

### Using Colors
```dart
import 'package:daloy/utils/app_colors.dart';

Container(
  color: AppColors.primary,
  child: Text('Hello', style: TextStyle(color: AppColors.white)),
)
```

### Using Custom Widgets
```dart
import 'package:daloy/widgets/custom_button.dart';

CustomButton(
  text: 'Submit',
  onPressed: () {},
  type: ButtonType.primary,
  icon: FontAwesomeIcons.check,
)
```

### Using Services
```dart
import 'package:daloy/services/api_service.dart';

final response = await ApiService().get('/users');
```

---

**Created for Daloy Flutter Web Project** 🚀
