part of 'exercise_bloc.dart';

abstract class ExerciseEvent extends Equatable {
  const ExerciseEvent();

  @override
  List<Object> get props => [];
}

final class InitialEvent extends ExerciseEvent {}

class UpdateName extends ExerciseEvent {
  final String name;

  const UpdateName(this.name);

  @override
  List<Object> get props => [name];
}

final class UpdateDescription extends ExerciseEvent {
  final String description;

  const UpdateDescription(this.description);

  @override
  List<Object> get props => [description];
}

final class UpdateDuration extends ExerciseEvent {
  final String duration;

  const UpdateDuration(this.duration);

  @override
  List<Object> get props => [duration];
}

final class UpdateReps extends ExerciseEvent {
  final int reps;

  const UpdateReps(this.reps);

  @override
  List<Object> get props => [reps];
}

final class UpdateSets extends ExerciseEvent {
  final int sets;

  const UpdateSets(this.sets);

  @override
  List<Object> get props => [sets];
}

final class UpdateExerciseType extends ExerciseEvent {
  final ExerciseType exerciseType;

  const UpdateExerciseType(this.exerciseType);

  @override
  List<Object> get props => [exerciseType];
}
