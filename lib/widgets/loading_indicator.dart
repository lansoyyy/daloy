import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../utils/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;
  final double size;

  const LoadingIndicator({
    super.key,
    this.color,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        color: color ?? AppColors.primary,
        size: size,
      ),
    );
  }
}
