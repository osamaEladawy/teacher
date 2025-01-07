import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:teacher/core/routes/routes.dart';
import 'package:teacher/features/onboard/models/onboard_model.dart';
import 'package:teacher/generated/l10n.dart';
import 'package:teacher/my_app.dart';
import 'package:teacher/shared/resources/icons_resources.dart';
import 'package:teacher/shared/resources/image_resources.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit() : super(OnboardInitial());
  static final OnboardCubit _onboardCubit =
      BlocProvider.of(navigatorKey.currentContext!);

  static OnboardCubit get instance => _onboardCubit;
  PageController controller = PageController();
  int currentIndex = 0;
  int selectType = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndex(index: currentIndex));
  }

  void selectRole(int index) {
    selectType = index;
    emit(ChangeIndex(index: selectType));
  }

  void goToHome() {
    // if (currentIndex == onBoarding.length - 1) {
    //   // PrefServices.sharedPreferences!.setBool("isOnboarding", true);
    //   Navigator.pushReplacementNamed(
    //       navigatorKey.currentContext!, Routes.initialPage);
    //   emit(ChangeIndex(index: currentIndex));
    //   return;
    // }
    currentIndex++;
    emit(ChangeIndex(index: currentIndex));
    controller.nextPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.bounceIn,
    );
  }

  List words = [
    {
      "title": S.of(navigatorKey.currentContext!).student,
      "imageUrl": IconsResources.hat
    },
    {
      "title": S.of(navigatorKey.currentContext!).teacher,
      "imageUrl": IconsResources.teacher
    },
  ];

  // String get displayTitle {
  //   if (currentIndex == onBoarding.length - 1) {
  //     return LocaleKeys.start.tr();
  //   } else {
  //     return LocaleKeys.skip.tr();
  //   }
  // }

  List<OnboardModel> onBoarding = [
    OnboardModel(
      image: ImageResources.onboard,
      id: 1,
    ),
    OnboardModel(
      image: ImageResources.onboard,
      id: 2,
    ),
    OnboardModel(
      image: ImageResources.onboard,
      id: 3,
    ),
  ];
}
