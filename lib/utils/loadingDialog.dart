import 'package:flutter/material.dart';

class LoadingDialog {
  static bool _isShow = false;
  static void show(BuildContext context, {String message = "加载中..."}) {
    if (_isShow) {
      return;
    }
    _isShow = true;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text(message),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    if (!_isShow) {
      return;
    }
    _isShow = false;
    Navigator.pop(context);
  }
}
