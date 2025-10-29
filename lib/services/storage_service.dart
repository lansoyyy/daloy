import 'package:shared_preferences/shared_preferences.dart';

/// Service for local storage operations
class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  SharedPreferences? _prefs;

  /// Initialize storage
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save string value
  Future<bool> setString(String key, String value) async {
    if (_prefs == null) await init();
    return await _prefs!.setString(key, value);
  }

  /// Get string value
  String? getString(String key) {
    return _prefs?.getString(key);
  }

  /// Save int value
  Future<bool> setInt(String key, int value) async {
    if (_prefs == null) await init();
    return await _prefs!.setInt(key, value);
  }

  /// Get int value
  int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  /// Save bool value
  Future<bool> setBool(String key, bool value) async {
    if (_prefs == null) await init();
    return await _prefs!.setBool(key, value);
  }

  /// Get bool value
  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  /// Save double value
  Future<bool> setDouble(String key, double value) async {
    if (_prefs == null) await init();
    return await _prefs!.setDouble(key, value);
  }

  /// Get double value
  double? getDouble(String key) {
    return _prefs?.getDouble(key);
  }

  /// Save list of strings
  Future<bool> setStringList(String key, List<String> value) async {
    if (_prefs == null) await init();
    return await _prefs!.setStringList(key, value);
  }

  /// Get list of strings
  List<String>? getStringList(String key) {
    return _prefs?.getStringList(key);
  }

  /// Remove a key
  Future<bool> remove(String key) async {
    if (_prefs == null) await init();
    return await _prefs!.remove(key);
  }

  /// Clear all data
  Future<bool> clear() async {
    if (_prefs == null) await init();
    return await _prefs!.clear();
  }

  /// Check if key exists
  bool containsKey(String key) {
    return _prefs?.containsKey(key) ?? false;
  }
}
