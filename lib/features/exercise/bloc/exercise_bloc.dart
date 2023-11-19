import 'package:equatable/equatable.dart';
import 'package:fitique/features/exercise/models/exercise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exercise_state.dart';
part 'exercise_event.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final Exercise _exercise = Exercise(
    name: '',
    description: '',
    duration: '',
    reps: 0,
    sets: 0,
    exerciseType: ExerciseType.Cardio,
  );

  ExerciseBloc() : super(ExerciseInitial()) {
    on<InitialEvent>(_onInitialEvent);
    on<UpdateExerciseType>(_onUpdateExerciseType);
    on<UpdateName>(_onUpdateName);
    on<UpdateDescription>(_onUpdateDescription);
    on<UpdateDuration>(_onUpdateDuration);
    on<UpdateReps>(_onUpdateReps);
    on<UpdateSets>(_onUpdateSets);
  }

  void _onUpdateSets(event, emit) {
    emit(ExerciseUpdated(_exercise.copyWith(sets: event.sets)));
  }

  void _onUpdateReps(event, emit) {
    emit(ExerciseUpdated(_exercise.copyWith(reps: event.reps)));
  }

  void _onUpdateDuration(event, emit) {
    emit(ExerciseUpdated(_exercise.copyWith(duration: event.duration)));
  }

  void _onUpdateDescription(event, emit) {
    emit(ExerciseUpdated(_exercise.copyWith(description: event.description)));
  }

  void _onUpdateName(event, emit) {
    emit(ExerciseUpdated(_exercise.copyWith(name: event.name)));
  }

  void _onUpdateExerciseType(event, emit) {
    emit(ExerciseUpdated(_exercise.copyWith(exerciseType: event.exerciseType)));
  }

  void _onInitialEvent(event, emit) {
    emit(ExerciseUpdated(_exercise));
  }
}
