import 'package:edusphere_mobile/core/theme/app_theme_data.dart';
import 'package:edusphere_mobile/features/greeting/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData().lightTheme,
      darkTheme: AppThemeData().darkTheme,
      home: const WelcomeScreen(),
    );
  }
}
