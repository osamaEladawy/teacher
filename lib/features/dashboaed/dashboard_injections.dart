import 'package:teacher/app_injections.dart';
import 'package:teacher/features/dashboaed/cubit/dashboard_cubit.dart';

void dashboardInjections(){
  getIt.registerFactory<DashboardCubit>(()=>DashboardCubit());
}