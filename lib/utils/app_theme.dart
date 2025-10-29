import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_constants.dart';
import 'app_assets.dart';
import 'app_text_styles.dart';

/// App theme configuration for Daloy
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      
      // Set default font family for ALL text widgets
      fontFamily: AppAssets.fontRegular,
      
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
        surface: AppColors.surface,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onError: AppColors.white,
        onSurface: AppColors.textPrimary,
      ),
      
      // Text Theme with custom fonts - using AppTextStyles
      textTheme: TextTheme(
        // Display styles (largest)
        displayLarge: AppTextStyles.h1(),
        displayMedium: AppTextStyles.h2(),
        displaySmall: AppTextStyles.h3(),
        
        // Headline styles
        headlineLarge: AppTextStyles.h3(),
        headlineMedium: AppTextStyles.h4(),
        headlineSmall: AppTextStyles.h5(),
        
        // Title styles
        titleLarge: AppTextStyles.h5(),
        titleMedium: AppTextStyles.h6(),
        titleSmall: AppTextStyles.subtitleMedium(),
        
        // Body styles (most common)
        bodyLarge: AppTextStyles.bodyLarge(),
        bodyMedium: AppTextStyles.bodyMedium(),
        bodySmall: AppTextStyles.bodySmall(),
        
        // Label styles
        labelLarge: AppTextStyles.labelLarge(),
        labelMedium: AppTextStyles.labelMedium(),
        labelSmall: AppTextStyles.labelSmall(),
      ),
      
      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: AppAssets.fontBold,
          fontSize: AppConstants.fontSizeLarge,
          color: AppColors.white,
        ),
      ),
      
      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingLarge,
            vertical: AppConstants.paddingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          ),
          textStyle: TextStyle(
            fontFamily: AppAssets.fontMedium,
            fontSize: AppConstants.fontSizeMedium,
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingLarge,
            vertical: AppConstants.paddingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          ),
          textStyle: TextStyle(
            fontFamily: AppAssets.fontMedium,
            fontSize: AppConstants.fontSizeMedium,
          ),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: TextStyle(
            fontFamily: AppAssets.fontMedium,
            fontSize: AppConstants.fontSizeMedium,
          ),
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConstants.paddingMedium,
          vertical: AppConstants.paddingMedium,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          borderSide: const BorderSide(color: AppColors.lightGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          borderSide: const BorderSide(color: AppColors.lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        labelStyle: TextStyle(
          fontFamily: AppAssets.fontRegular,
          color: AppColors.textSecondary,
        ),
        hintStyle: TextStyle(
          fontFamily: AppAssets.fontRegular,
          color: AppColors.grey,
        ),
      ),
      
      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        ),
      ),
    );
  }
}
