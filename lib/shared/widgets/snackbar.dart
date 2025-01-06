import 'package:flutter/material.dart';
import 'package:teacher/my_app.dart';


showSnackBar(String content) {
  ScaffoldMessenger.of(navigatorKey.currentContext!)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: const TextStyle(),
        ),
      ),
    );
}
