import 'package:flutter/material.dart';
import 'package:teacher/features/books/screens/books_screen.dart';
import 'package:teacher/features/home/screens/home_screen.dart';
import 'package:teacher/features/students/screens/students_screen.dart';

Widget displayWidgets(int index) {
  switch (index) {
    case 0:
      return HomeScreen();
    case 1:
      return Center(child: Text('statistics'));
    case 2:
      return BooksScreen();
    case 3:
      return StudentsScreen();
    case 4:
      return Center(child: Text('cart'));
    case 5:
      return Center(child: Text('profile'));
    case 6:
      return Center(child: Text('settings'));
    default:
      return HomeScreen();
  }
}
