import 'package:flutter/material.dart';

class Toast {
  static bool _isShowing = false;
  static void showToast(BuildContext context, String message) {
    if (_isShowing) {
      return;
    }
    Toast._isShowing = true;
    Future.delayed(Duration(seconds: 3), () {
      _isShowing = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 180,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(40),
        ),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        content: Text(message, textAlign: TextAlign.center),
      ),
    );
  }
}
