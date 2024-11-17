import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _token = '';
  bool _isAuthenticated = false;

  String get token => _token;
  bool get isAuthenticated => _isAuthenticated;

  // Example method to authenticate the user
  void authenticate(String token) {
    _token = token;
    _isAuthenticated = true;
    notifyListeners(); // Notify listeners when authentication changes
  }

  // Example method to log out
  void logout() {
    _token = '';
    _isAuthenticated = false;
    notifyListeners(); // Notify listeners when the user logs out
  }
}
