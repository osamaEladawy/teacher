import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/home/models/course_model.dart';
import 'package:teacher/my_app.dart';
import 'package:teacher/shared/resources/image_resources.dart';

part 'books_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitial());

  static final CoursesCubit _booksCubit= BlocProvider.of(navigatorKey.currentContext!);
  static CoursesCubit get instance => _booksCubit;

  List<CourseModel> courses = [
    CourseModel(
      id: 1,
      title: tr.capabilities,
      description: '4 ${tr.lectures}',
      imageUrl: ImageResources.profile,
      students: 10,
      hours: 1,
    ),
    CourseModel(
      id: 2,
      title: tr.achievement,
      description: '4 ${tr.lectures}',
      imageUrl: ImageResources.profile,
      students: 10,
      hours: 1,
    ),
  ];
}
