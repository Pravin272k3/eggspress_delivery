import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../config/constants.dart';

class AuthService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Contains token and user info
      } else {
        throw Exception("Login failed");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<void> logout(String token) async {
    // Add logic to remove token or clear local session
  }
}
