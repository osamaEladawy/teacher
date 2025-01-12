import 'package:teacher/app_injections.dart';
import 'package:teacher/features/statistics/cubit/statistics_cubit.dart';

void statisticsInjections(){
  getIt.registerFactory<StatisticsCubit>(()=>StatisticsCubit());
}