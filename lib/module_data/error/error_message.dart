import 'package:flutter/material.dart';

class ErrorMessage {
  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if (text == null) {
      return null;
    }

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );
  }
}
