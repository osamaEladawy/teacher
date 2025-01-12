import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/my_app.dart';
import 'package:teacher/shared/resources/icons_resources.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static final ProfileCubit _profileCubit =
      BlocProvider.of(navigatorKey.currentContext!);

  static ProfileCubit get instance => _profileCubit;

  int currentIndex = 0;
  int currentDay1 = 0;
  int currentDay2 = 0;
  int displayAnswer = 0;

  void selectCard(int index) {
    currentIndex = index;
    emit(SelectCard(index: currentIndex));
    emit(ChangeColor());
  }

  void selectDay1(int index) {
    currentDay1 = index;
    emit(SelectCard(index: currentDay1));
    emit(ChangeColor());
  }

  void selectDay2(int index) {
    currentDay2 = index;
    emit(SelectCard(index: currentDay2));
    emit(ChangeColor());
  }

  List<String> days = [
    tr.sunday,
    tr.thursday,
    // tr.monday,
    // tr.tuesday,
    // tr.wednesday,
    // tr.thursday,
    // tr.friday,
    // tr.saturday,
    // tr.sunday,
  ];
  List words = [
    {"title": tr.aboutTheTeacher, "imageUrl": IconsResources.teacher},
    {"title": tr.courses, "imageUrl": IconsResources.note},
  ];
  List results = [
    {"number": 10, "title": tr.subscribers},
    {"number": 25, "title": tr.student},
    {"number": 10, "title": tr.phoneUsers},
    {"number": 15, "title": tr.computerUsers},
  ];
}
