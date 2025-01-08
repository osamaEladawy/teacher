part of 'students_cubit.dart';

@immutable
sealed class StudentsState {}

final class StudentsInitial extends StudentsState {}
final class ChangeColor extends StudentsState {}
final class SelectCard extends StudentsState {
  final int index;

  SelectCard({required this.index});
}
final class DisplayAnswers extends StudentsState {
  final bool isDisplay;

  DisplayAnswers({required this.isDisplay});
}
