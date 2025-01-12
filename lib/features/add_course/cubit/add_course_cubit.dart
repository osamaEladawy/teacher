import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/add_course/models/add_test_model.dart';
import 'package:teacher/features/add_course/models/course_model.dart';
import 'package:teacher/my_app.dart';
import 'package:teacher/shared/resources/image_resources.dart';

part 'add_course_state.dart';

class AddCourseCubit extends Cubit<AddCourseState> {
  AddCourseCubit() : super(AddCourseInitial());
  static final AddCourseCubit _addCourseCubit =
      BlocProvider.of(navigatorKey.currentContext!);
  static AddCourseCubit get instance => _addCourseCubit;
  int currentIndex = 0;
  int addTestIndex = 0;
  final PageController _controller = PageController();
  PageController get instanceController => _controller;

  void setIndex(int index) {
    currentIndex = index;
    emit(SetIndex(index: currentIndex));
  }
  void setIndexAddTest(int index) {
    addTestIndex = index;
    emit(SetIndex(index: addTestIndex));
  }

  void setController(int index) {
    instanceController.nextPage(
      duration: const Duration(milliseconds: 5000),
      curve: Curves.easeOutBack,
    );
  }
  void setControllerAddTest(int index) {
    instanceController.nextPage(
      duration: const Duration(milliseconds: 5000),
      curve: Curves.easeOutBack,
    );
  }

  void nextPage() {
    currentIndex++;
    if (currentIndex > courses.length - 1) {
    } else {
      instanceController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 3000),
        curve: Curves.easeOutBack,
      );
    }
  }

  void nextPageAddText() {
    addTestIndex++;
    if (addTestIndex > tests.length - 1) {
    } else {
      instanceController.animateToPage(
        addTestIndex,
        duration: const Duration(milliseconds: 3000),
        curve: Curves.easeOutBack,
      );
    }
  }

  void backToPage() {
    if (currentIndex > 0) {
      currentIndex--;
      instanceController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 5000),
        curve: Curves.easeOutBack,
      );
    } else {}
  }
  void backToPageAddTest() {
    if (addTestIndex > 0) {
      addTestIndex--;
      instanceController.animateToPage(
        addTestIndex,
        duration: const Duration(milliseconds: 5000),
        curve: Curves.easeOutBack,
      );
    } else {}
  }

  List<AddCourseModel> courses = [
    AddCourseModel(
      title: tr.enterCourseContent,
      subtitle: tr.numberOfLectures,
      image: ImageResources.content,
    ),
    AddCourseModel(
      title: tr.enterCourseContent,
      subtitle: tr.numberOfLectures,
      image: ImageResources.video,
    ),
    AddCourseModel(
      title: tr.enterCourseContent,
      subtitle: tr.numberOfLectures,
      image: ImageResources.content,
    ),
  ];
  List<AddTestModel> tests = [
    AddTestModel(
      title: tr.enterCourseContent,
      subtitle: tr.numberOfTests,
      image: ImageResources.addTest,
    ),
    AddTestModel(
      title: tr.enterCourseContent,
      subtitle: tr.numberOfTests,
      image: ImageResources.addPic,
    ),
    AddTestModel(
      title: tr.enterCourseContent,
      subtitle: tr.numberOfTests,
      image: ImageResources.addTest,
    ),
    AddTestModel(
      title: tr.enterCourseContent,
      subtitle: tr.numberOfTests,
      image: ImageResources.addTest,
    ),
  ];
}
