import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: textColor,
      textTheme: const TextTheme(
        displayLarge: _titleTextStyle,
        bodyLarge: _inputTextStyle,
        bodyMedium: _textStyle,
        labelLarge: _buttonTextStyle,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: focusColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: errorColor, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: errorColor, width: 1.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.white,
        secondary: buttonGradient.colors.first,
        error: errorColor,
      ),
    );
  }

  static const TextStyle focusedHintTextStyle = TextStyle(
    color: textColor,
    fontSize: 16,
  );

  static const TextStyle unfocusedHintTextStyle = TextStyle(
    color: hintColor,
    fontSize: 16,
  );

  static const TextStyle errorHintTextStyle = TextStyle(
    color: errorColor,
    fontSize: 16,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF4F9FF), Color(0xFFE0EDFB)],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF70C3FF), Color(0xFF4B65FF)],
  );

  static const Color successColor = Color(0xFF27b274);
  static const Color errorColor = Color(0xFFFF8080);
  static const Color errorInputBackgroundColor = Color(0xFFFDEFEE);
  static const Color focusColor = Color(0xFF6F91BC);
  static const Color hintColor = Color(0xFF6F91BC);
  static const Color textColor = Color(0xFF4A4E71);
  static const Color whiteColor = Colors.white;


  static const TextStyle _titleTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1,
    color: textColor,
  );

  static const TextStyle _inputTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.21,
    color: textColor,
  );

  static const TextStyle _textStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.38,
    color: textColor,
  );

  static const TextStyle _buttonTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1,
    color: Colors.white,
  );
}

extension CustomThemeColors on ThemeData {
  Color get textColor => AppTheme.textColor;
  Color get successColor => AppTheme.successColor;
  Color get errorColor => AppTheme.errorColor;
  Color get errorInputBackgroundColor => AppTheme.errorInputBackgroundColor;
  Color get whiteColor => AppTheme.whiteColor;
}
