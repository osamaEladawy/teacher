part of 'statistics_cubit.dart';

@immutable
sealed class StatisticsState {}

final class StatisticsInitial extends StatisticsState {}
final class ChangeColor extends StatisticsState {}

final class SelectCard extends StatisticsState {
  final int index;

  SelectCard({required this.index});
}
