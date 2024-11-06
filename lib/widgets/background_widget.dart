import 'package:flutter/material.dart';
import 'package:test_task/theme/app_theme.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppTheme.backgroundGradient,
      ),
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 75.0),
              child: Image.asset(
                'assets/images/background_stars.png',
                height: double.infinity,
                width: double.infinity,
              )),
          child
        ],
      ),
    );
  }
}
