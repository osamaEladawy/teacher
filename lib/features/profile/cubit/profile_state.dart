part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ChangeColor extends ProfileState {}

final class SelectCard extends ProfileState {
  final int index;

  SelectCard({required this.index});
}
