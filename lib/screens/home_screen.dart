import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.logo,
              height: 32,
            ),
            const SizedBox(width: AppConstants.paddingSmall),
            const Text(AppConstants.appName),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.water,
              size: 64,
              color: AppColors.primary,
            ),
            const SizedBox(height: AppConstants.paddingLarge),
            Text(
              'Welcome to ${AppConstants.appName}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: AppConstants.paddingMedium),
            Text(
              'Your Flutter web application',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
            const SizedBox(height: AppConstants.paddingExtraLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.rocket, size: 16),
                  label: const Text('Get Started'),
                ),
                const SizedBox(width: AppConstants.paddingMedium),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.circleInfo, size: 16),
                  label: const Text('Learn More'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
