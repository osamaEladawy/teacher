import 'package:teacher/app_injections.dart';
import 'package:teacher/features/onboard/cubit/onboard_cubit.dart';

void onBoardInjection(){
  getIt.registerFactory<OnboardCubit>(()=>OnboardCubit());
}