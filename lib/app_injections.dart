import 'package:get_it/get_it.dart';
import 'package:teacher/features/auth/auth_injections.dart';
import 'package:teacher/features/books/books_injections.dart';
import 'package:teacher/features/dashboaed/dashboard_injections.dart';
import 'package:teacher/features/home/home_injections.dart';
import 'package:teacher/features/onboard/onboard_injections.dart';
import 'package:teacher/features/students/students_injections.dart';

GetIt getIt = GetIt.instance;

Future<void> appInjections() async {
  authInjections();
  onBoardInjection();
  homeInjections();
  dashboardInjections();
  booksInjections();
  studentsInjections();
}
