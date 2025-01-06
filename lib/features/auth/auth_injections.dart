import 'package:teacher/app_injections.dart';
import 'package:teacher/features/auth/cubit/auth_cubit.dart';

void authInjections(){
  getIt.registerFactory<AuthCubit>(()=>AuthCubit());
}