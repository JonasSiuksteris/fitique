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
      _exercise.exerciseType = event.exerciseType;
      emit(ExerciseUpdated(_exercise));
    });
    on<UpdateName>((event, emit) {
      _exercise.name = event.name;
      emit(ExerciseUpdated(_exercise));
    });
    on<UpdateDescription>((event, emit) {
      _exercise.description = event.description;
      emit(ExerciseUpdated(_exercise));
    });
    on<UpdateDuration>((event, emit) {
      _exercise.duration = event.duration;
      emit(ExerciseUpdated(_exercise));
    });
    on<UpdateReps>((event, emit) {
      _exercise.reps = event.reps;
      emit(ExerciseUpdated(_exercise));
    });
    on<UpdateSets>((event, emit) {
      _exercise.sets = event.sets;
      emit(ExerciseUpdated(_exercise));
    });
  }
}
