import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teacher/app_injections.dart';
import 'package:teacher/core/classes/set_up_logger.dart';
import 'package:teacher/core/storage/pref_services.dart';
import 'package:teacher/core/storage/secure_storage_service.dart';
import 'package:teacher/my_app.dart';
import 'package:teacher/shared/cubits/bloc_observer.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefServices.instance.init();
  await SecureStorageService.instance.init();
  SetUpLogger.instance.initLogger();
  Bloc.observer = MyBlocObserver();
  await appInjections();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}
