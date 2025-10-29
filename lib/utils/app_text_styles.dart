import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_assets.dart';

/// Centralized text styles for Daloy app
/// All text styles use Urbanist font family by default
class AppTextStyles {
  // ==================== HEADINGS ====================
  
  /// Heading 1 - Extra Large Bold (32px)
  static TextStyle h1({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontBold,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color ?? AppColors.textPrimary,
        height: 1.2,
      );

  /// Heading 2 - Large Bold (28px)
  static TextStyle h2({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontBold,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: color ?? AppColors.textPrimary,
        height: 1.2,
      );

  /// Heading 3 - Medium Bold (24px)
  static TextStyle h3({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontBold,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color ?? AppColors.textPrimary,
        height: 1.3,
      );

  /// Heading 4 - Regular Bold (20px)
  static TextStyle h4({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontBold,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color ?? AppColors.textPrimary,
        height: 1.3,
      );

  /// Heading 5 - Small Bold (18px)
  static TextStyle h5({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontBold,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: color ?? AppColors.textPrimary,
        height: 1.4,
      );

  /// Heading 6 - Extra Small Bold (16px)
  static TextStyle h6({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontBold,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: color ?? AppColors.textPrimary,
        height: 1.4,
      );

  // ==================== BODY TEXT ====================

  /// Body Large - Regular (18px)
  static TextStyle bodyLarge({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontRegular,
        fontSize: 18,
        color: color ?? AppColors.textPrimary,
        height: 1.5,
      );

  /// Body Medium - Regular (16px) - Default body text
  static TextStyle bodyMedium({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontRegular,
        fontSize: 16,
        color: color ?? AppColors.textPrimary,
        height: 1.5,
      );

  /// Body Small - Regular (14px)
  static TextStyle bodySmall({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontRegular,
        fontSize: 14,
        color: color ?? AppColors.textPrimary,
        height: 1.5,
      );

  /// Body Extra Small - Regular (12px)
  static TextStyle bodyExtraSmall({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontRegular,
        fontSize: 12,
        color: color ?? AppColors.textPrimary,
        height: 1.5,
      );

  // ==================== MEDIUM WEIGHT ====================

  /// Subtitle Large - Medium (18px)
  static TextStyle subtitleLarge({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontMedium,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.textPrimary,
        height: 1.4,
      );

  /// Subtitle Medium - Medium (16px)
  static TextStyle subtitleMedium({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontMedium,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.textPrimary,
        height: 1.4,
      );

  /// Subtitle Small - Medium (14px)
  static TextStyle subtitleSmall({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontMedium,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.textPrimary,
        height: 1.4,
      );

  // ==================== LABELS & BUTTONS ====================

  /// Button Large - Medium (16px)
  static TextStyle buttonLarge({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontMedium,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.white,
        letterSpacing: 0.5,
      );

  /// Button Medium - Medium (14px)
  static TextStyle buttonMedium({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontMedium,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.white,
        letterSpacing: 0.5,
      );

  /// Button Small - Medium (12px)
  static TextStyle buttonSmall({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontMedium,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.white,
        letterSpacing: 0.5,
      );

  /// Label Large - Medium (14px)
  static TextStyle labelLarge({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontMedium,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.textSecondary,
      );

  /// Label Medium - Medium (12px)
  static TextStyle labelMedium({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontMedium,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.textSecondary,
      );

  /// Label Small - Medium (10px)
  static TextStyle labelSmall({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontMedium,
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.textSecondary,
      );

  // ==================== SPECIAL STYLES ====================

  /// Caption - Regular (12px) - For hints, captions
  static TextStyle caption({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontRegular,
        fontSize: 12,
        color: color ?? AppColors.textSecondary,
        height: 1.4,
      );

  /// Overline - Medium (10px) - For overline text, tags
  static TextStyle overline({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontMedium,
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.textSecondary,
        letterSpacing: 1.5,
        height: 1.6,
      );

  /// Link - Medium (14px) - For clickable links
  static TextStyle link({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontMedium,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.primary,
        decoration: TextDecoration.underline,
      );

  /// Error Text - Regular (12px)
  static TextStyle error({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontRegular,
        fontSize: 12,
        color: color ?? AppColors.error,
        height: 1.4,
      );

  // ==================== HELPER METHODS ====================

  /// Apply bold weight to any text style
  static TextStyle bold(TextStyle style) => style.copyWith(
        fontFamily: AppAssets.fontBold,
        fontWeight: FontWeight.bold,
      );

  /// Apply medium weight to any text style
  static TextStyle medium(TextStyle style) => style.copyWith(
        fontFamily: AppAssets.fontMedium,
        fontWeight: FontWeight.w500,
      );

  /// Apply regular weight to any text style
  static TextStyle regular(TextStyle style) => style.copyWith(
        fontFamily: AppAssets.fontRegular,
        fontWeight: FontWeight.normal,
      );

  /// Apply custom color to any text style
  static TextStyle withColor(TextStyle style, Color color) =>
      style.copyWith(color: color);

  /// Apply custom size to any text style
  static TextStyle withSize(TextStyle style, double size) =>
      style.copyWith(fontSize: size);
}
