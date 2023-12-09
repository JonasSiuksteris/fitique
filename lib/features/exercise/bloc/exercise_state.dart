part of 'exercise_bloc.dart';

abstract class ExerciseState extends Equatable {
  @override
  List<Object> get props => [];
}

class ExerciseInitial extends ExerciseState {}

class ExerciseUpdated extends ExerciseState {
  final ExerciseInformation exercise;

  ExerciseUpdated(this.exercise);

  @override
  List<Object> get props => [exercise];
}
