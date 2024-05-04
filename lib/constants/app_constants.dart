import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static getSnackBar({required BuildContext context, required String msg}) {
    final snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static bool validateEmail(String value) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  static bool validatePassword(String password) {
    if (password.isEmpty) {
      return false;
    } else if (password.length < 8) {
      return false;
    } else {
      return true;
    }
  }
}
