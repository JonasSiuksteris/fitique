import 'package:equatable/equatable.dart';
import 'package:fitique/features/exercise/models/exercise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exercise_state.dart';
part 'exercise_event.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseInformation _exercise = const ExerciseInformation(
    name: '',
    description: '',
    duration: '',
    reps: 0,
    sets: 0,
    exerciseType: ExerciseType.cardio,
    mediaType: ExerciseMediaType.text,
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
    if (state is ExerciseUpdated) {
      final currentState = state as ExerciseUpdated;
      emit(ExerciseUpdated(currentState.exercise.copyWith(sets: event.sets)));
    }
  }

  void _onUpdateReps(event, emit) {
    if (state is ExerciseUpdated) {
      final currentState = state as ExerciseUpdated;
      emit(ExerciseUpdated(currentState.exercise.copyWith(reps: event.reps)));
    }
  }

  void _onUpdateDuration(event, emit) {
    if (state is ExerciseUpdated) {
      final currentState = state as ExerciseUpdated;
      emit(ExerciseUpdated(
          currentState.exercise.copyWith(duration: event.duration)));
    }
  }

  void _onUpdateDescription(event, emit) {
    if (state is ExerciseUpdated) {
      final currentState = state as ExerciseUpdated;
      emit(ExerciseUpdated(
          currentState.exercise.copyWith(description: event.description)));
    }
  }

  void _onUpdateName(event, emit) {
    if (state is ExerciseUpdated) {
      final currentState = state as ExerciseUpdated;
      emit(ExerciseUpdated(currentState.exercise.copyWith(name: event.name)));
    }
  }

  void _onUpdateExerciseType(event, emit) {
    if (state is ExerciseUpdated) {
      final currentState = state as ExerciseUpdated;
      emit(ExerciseUpdated(
          currentState.exercise.copyWith(exerciseType: event.exerciseType)));
    }
  }

  void _onInitialEvent(event, emit) {
    if (state is ExerciseInitial) {
      emit(ExerciseUpdated(_exercise));
    }
  }
}
