import 'package:teacher/app_injections.dart';
import 'package:teacher/features/students/cubit/students_cubit.dart';

void studentsInjections(){
  getIt.registerFactory<StudentsCubit>(()=>StudentsCubit());
}