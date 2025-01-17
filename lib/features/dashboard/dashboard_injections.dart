import 'package:teacher/app_injections.dart';
import 'package:teacher/features/dashboard/cubit/dashboard_cubit.dart';

void dashboardInjections(){
  getIt.registerFactory<DashboardCubit>(()=>DashboardCubit());
}