import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_task/theme/app_theme.dart';

class PopupDialogs {
  static void showToast(context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Theme.of(context).successColor,
      textColor: Theme.of(context).whiteColor,
      fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
    );
  }
}
