import 'package:flutter/material.dart';

/// Service for navigation without context
class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;
  NavigationService._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Get current context
  BuildContext? get context => navigatorKey.currentContext;

  /// Navigate to a route
  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Replace current route
  Future<dynamic> replaceTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Navigate and remove all previous routes
  Future<dynamic> navigateAndRemoveUntil(String routeName,
      {Object? arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  /// Go back
  void goBack({dynamic result}) {
    return navigatorKey.currentState!.pop(result);
  }

  /// Check if can go back
  bool canGoBack() {
    return navigatorKey.currentState!.canPop();
  }
}
