/// App-wide constants for Daloy
class AppConstants {
  // App Info
  static const String appName = 'Daloy';
  static const String appVersion = '1.0.0';

  // Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingExtraLarge = 32.0;

  // Border Radius
  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 12.0;
  static const double radiusExtraLarge = 16.0;

  // Font Sizes
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 14.0;
  static const double fontSizeRegular = 16.0;
  static const double fontSizeLarge = 18.0;
  static const double fontSizeExtraLarge = 24.0;
  static const double fontSizeHeading = 32.0;

  // Animation Durations
  static const Duration animationShort = Duration(milliseconds: 200);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationLong = Duration(milliseconds: 500);

  // API (if needed in the future)
  static const String baseUrl = '';
  static const Duration apiTimeout = Duration(seconds: 30);
}
