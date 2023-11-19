part of 'exercise_bloc.dart';

abstract class ExerciseState {}

class ExerciseInitial extends ExerciseState {}

class ExerciseUpdated extends ExerciseState {
  final Exercise exercise;

  ExerciseUpdated(this.exercise);
}
