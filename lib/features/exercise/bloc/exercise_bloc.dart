import 'package:fitique/features/exercise/bloc/exercise_event.dart';
import 'package:fitique/features/exercise/bloc/exercise_state.dart';
import 'package:fitique/features/exercise/models/exercise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    on<InitialEvent>((event, emit) {
      emit(ExerciseUpdated(_exercise));
    });
    on<UpdateExerciseType>((event, emit) {
      emit(ExerciseUpdated(
          _exercise.copyWith(exerciseType: event.exerciseType)));
    });
    on<UpdateName>((event, emit) {
      emit(ExerciseUpdated(_exercise.copyWith(name: event.name)));
    });
    on<UpdateDescription>((event, emit) {
      emit(ExerciseUpdated(_exercise.copyWith(description: event.description)));
    });
    on<UpdateDuration>((event, emit) {
      emit(ExerciseUpdated(_exercise.copyWith(duration: event.duration)));
    });
    on<UpdateReps>((event, emit) {
      emit(ExerciseUpdated(_exercise.copyWith(reps: event.reps)));
    });
    on<UpdateSets>((event, emit) {
      emit(ExerciseUpdated(_exercise.copyWith(sets: event.sets)));
    });
  }
}
