import 'package:teacher/app_injections.dart';
import 'package:teacher/features/courses/cubit/books_cubit.dart';

void coursesInjections(){
  getIt.registerFactory<CoursesCubit>(()=>CoursesCubit());
}