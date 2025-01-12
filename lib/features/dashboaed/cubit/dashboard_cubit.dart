import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/dashboaed/models/screen_model.dart';
import 'package:teacher/my_app.dart';
import 'package:teacher/shared/resources/icons_resources.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  static final DashboardCubit _dashboardCubit =
      BlocProvider.of(navigatorKey.currentContext!);
  static DashboardCubit get instance => _dashboardCubit;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  void selectCard(int index) {
    currentIndex = index;
    emit(SelectCard(index: currentIndex));
    emit(ChangeColor());
  }

  List<ScreenModel> widgets = [
    ScreenModel(id: 1, name: tr.home, icon: IconsResources.home),
    ScreenModel(id: 1, name: tr.statistics, icon: IconsResources.chart),
    ScreenModel(id: 1, name: tr.courses, icon: IconsResources.book),
    ScreenModel(id: 1, name: tr.students, icon: IconsResources.hatTeacher),
    ScreenModel(id: 1, name: tr.cart, icon: IconsResources.cart2),
    ScreenModel(id: 1, name: tr.profile, icon: IconsResources.profileIcon),
    ScreenModel(id: 1, name: tr.settings, icon: IconsResources.settings),
  ];
}
