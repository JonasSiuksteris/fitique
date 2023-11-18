import 'package:fitique/features/exercise/models/exercise.dart';

abstract class ExerciseState {}

class ExerciseInitial extends ExerciseState {}

class ExerciseUpdated extends ExerciseState {
  final Exercise exercise;

  ExerciseUpdated(this.exercise);
}
