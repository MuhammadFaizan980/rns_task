import 'package:flutter/material.dart';

class Utils {
  static void pushReplacement(context, targetScreen) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => targetScreen,
      ),
    );
  }

  static void displayMessage(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }
}
