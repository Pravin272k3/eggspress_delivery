import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/routes.dart';
import 'config/theme.dart';
import 'core/providers/auth_provider.dart';
import 'core/services/auth_service.dart'; // Make sure AuthService is correctly imported

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()), // Authentication provider
        // Add other providers here if necessary
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eggspress Delivery',
      theme: AppTheme.lightTheme, // Light theme configuration
      darkTheme: AppTheme.darkTheme, // Dark theme configuration (if needed)
      themeMode: ThemeMode.system, // System-based theme
      initialRoute: '/', // Initial route
      routes: appRoutes, // Route configuration
    );
  }
}
