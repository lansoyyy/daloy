import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.logo,
              width: 120,
              height: 120,
            ),
            const SizedBox(height: AppConstants.paddingLarge),
            Text(
              AppConstants.appName,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.white,
                  ),
            ),
            const SizedBox(height: AppConstants.paddingExtraLarge),
            const SpinKitWave(
              color: AppColors.white,
              size: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
