import 'package:flutter/material.dart';
import 'package:test_task/screens/sign_up_screen.dart';
import 'package:test_task/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: const SignUpPage(),
    );
  }
}
