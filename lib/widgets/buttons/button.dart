import 'package:flutter/material.dart';
import 'package:test_task/theme/app_theme.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 240,
        height: 48,
        decoration: BoxDecoration(
          gradient: AppTheme.buttonGradient,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge,
        )),
      ),
    );
  }
}
