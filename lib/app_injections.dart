import 'package:get_it/get_it.dart';
import 'package:teacher/features/auth/auth_injections.dart';

GetIt getIt = GetIt.instance;

Future<void> appInjections() async {
  authInjections();
}
