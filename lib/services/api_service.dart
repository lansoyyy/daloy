import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/app_constants.dart';

/// Service for handling API requests
class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  final String _baseUrl = AppConstants.baseUrl;

  /// GET request
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await http
          .get(
            Uri.parse('$_baseUrl$endpoint'),
            headers: _getHeaders(),
          )
          .timeout(AppConstants.apiTimeout);

      return _handleResponse(response);
    } catch (e) {
      throw Exception('GET request failed: $e');
    }
  }

  /// POST request
  Future<dynamic> post(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl$endpoint'),
            headers: _getHeaders(),
            body: jsonEncode(body),
          )
          .timeout(AppConstants.apiTimeout);

      return _handleResponse(response);
    } catch (e) {
      throw Exception('POST request failed: $e');
    }
  }

  /// PUT request
  Future<dynamic> put(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final response = await http
          .put(
            Uri.parse('$_baseUrl$endpoint'),
            headers: _getHeaders(),
            body: jsonEncode(body),
          )
          .timeout(AppConstants.apiTimeout);

      return _handleResponse(response);
    } catch (e) {
      throw Exception('PUT request failed: $e');
    }
  }

  /// DELETE request
  Future<dynamic> delete(String endpoint) async {
    try {
      final response = await http
          .delete(
            Uri.parse('$_baseUrl$endpoint'),
            headers: _getHeaders(),
          )
          .timeout(AppConstants.apiTimeout);

      return _handleResponse(response);
    } catch (e) {
      throw Exception('DELETE request failed: $e');
    }
  }

  /// Get headers for requests
  Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  /// Handle API response
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) {
        return null;
      }
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'API Error: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }
}
