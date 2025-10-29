import 'package:flutter/material.dart';
import 'utils/app_theme.dart';
import 'utils/app_constants.dart';
import 'screens/home_screen.dart';
import 'services/navigation_service.dart';

void main() {
  runApp(const DaloyApp());
}

class DaloyApp extends StatelessWidget {
  const DaloyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      navigatorKey: NavigationService().navigatorKey,
      home: const HomeScreen(),
    );
  }
}
