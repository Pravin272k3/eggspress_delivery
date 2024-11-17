import 'package:flutter/material.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/owner/screens/dashboard_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginScreen(), // Initial screen
  '/dashboard': (context) => DashboardScreen(), // Owner dashboard
  // Add other routes here
};
