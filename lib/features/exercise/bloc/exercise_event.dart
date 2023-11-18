import 'package:fitique/features/exercise/models/exercise.dart';

abstract class ExerciseEvent {}

class InitialEvent extends ExerciseEvent {}

class UpdateName extends ExerciseEvent {
  final String name;

  UpdateName(this.name);
}

class UpdateDescription extends ExerciseEvent {
  final String description;

  UpdateDescription(this.description);
}

class UpdateDuration extends ExerciseEvent {
  final String duration;

  UpdateDuration(this.duration);
}

class UpdateReps extends ExerciseEvent {
  final int reps;

  UpdateReps(this.reps);
}

class UpdateSets extends ExerciseEvent {
  final int sets;

  UpdateSets(this.sets);
}

class UpdateExerciseType extends ExerciseEvent {
  final ExerciseType exerciseType;

  UpdateExerciseType(this.exerciseType);
}
