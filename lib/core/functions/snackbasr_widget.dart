import 'package:flutter/material.dart';
import 'package:teacher/my_app.dart';


void snackBar(content) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(content),
      //backgroundColor: AppColors.blueGrey,
    ),
  );
}
