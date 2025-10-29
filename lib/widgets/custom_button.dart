import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';

enum ButtonType { primary, secondary, outlined, text }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final IconData? icon;
  final bool isLoading;
  final bool isFullWidth;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget buttonChild = isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                FaIcon(icon, size: 16),
                const SizedBox(width: AppConstants.paddingSmall),
              ],
              Text(text),
            ],
          );

    Widget button;
    switch (type) {
      case ButtonType.primary:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          child: buttonChild,
        );
        break;
      case ButtonType.secondary:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondary,
          ),
          child: buttonChild,
        );
        break;
      case ButtonType.outlined:
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          child: buttonChild,
        );
        break;
      case ButtonType.text:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          child: buttonChild,
        );
        break;
    }

    return isFullWidth
        ? SizedBox(
            width: double.infinity,
            child: button,
          )
        : button;
  }
}
