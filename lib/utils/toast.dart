import 'package:flutter/material.dart';

class Toast {
  static void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 120,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(40),
        ),
        duration: Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        content: Text(message, textAlign: TextAlign.center),
      ),
    );
  }
}
