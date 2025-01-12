import 'package:teacher/app_injections.dart';
import 'package:teacher/features/add_course/cubit/add_course_cubit.dart';

void addCourseInjections(){
  getIt.registerFactory<AddCourseCubit>(()=>AddCourseCubit());
}