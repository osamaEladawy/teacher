import 'package:teacher/app_injections.dart';
import 'package:teacher/features/profile/cubit/profile_cubit.dart';

void profileInjections(){
  getIt.registerFactory<ProfileCubit>(()=>ProfileCubit());
}