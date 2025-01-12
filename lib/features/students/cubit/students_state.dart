part of 'students_cubit.dart';

@immutable
sealed class StudentsState {}

final class StudentsInitial extends StudentsState {}

final class ChangeColor extends StudentsState {}

final class SelectCard extends StudentsState {
  final int index;

  SelectCard({required this.index});
}

final class ChangeIndex extends StudentsState {
  final int index;

  ChangeIndex({required this.index});
}

final class DisplayAnswers extends StudentsState {
  final bool isDisplay;
  final int index;

  DisplayAnswers({required this.isDisplay,required this.index});
}
