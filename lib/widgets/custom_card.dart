import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final VoidCallback? onTap;
  final double? elevation;

  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.onTap,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final card = Card(
      color: color ?? AppColors.surface,
      elevation: elevation ?? 2,
      child: Padding(
        padding: padding ??
            const EdgeInsets.all(AppConstants.paddingMedium),
        child: child,
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        child: card,
      );
    }

    return card;
  }
}
