import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/students/models/student_model.dart';
import 'package:teacher/my_app.dart';
import 'package:teacher/shared/resources/image_resources.dart';

part 'students_state.dart';

class StudentsCubit extends Cubit<StudentsState> {
  StudentsCubit() : super(StudentsInitial());
  static final StudentsCubit _studentsCubit =
      BlocProvider.of(navigatorKey.currentContext!);
  static StudentsCubit get instance => _studentsCubit;

  List<StudentModel> students = [
    StudentModel(
      id: 1,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 2,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
  ];
}
