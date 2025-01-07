import 'package:teacher/app_injections.dart';
import 'package:teacher/features/home/cubit/home_cubit.dart';

void homeInjections(){
  getIt.registerFactory<HomeCubit>(()=>HomeCubit());
}