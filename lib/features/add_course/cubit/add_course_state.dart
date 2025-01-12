part of 'add_course_cubit.dart';

@immutable
sealed class AddCourseState {}

final class AddCourseInitial extends AddCourseState {}

final class SetIndex extends AddCourseState {
  final int index;

  SetIndex({required this.index});
}
