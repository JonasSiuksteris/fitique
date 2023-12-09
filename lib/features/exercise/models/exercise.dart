import 'package:equatable/equatable.dart';

enum ExerciseType { cardio, strength, flexibility }

enum ExerciseMediaType {
  text,
  video,
}

class ExerciseInformation extends Equatable {
  final String name;
  final String description;
  final String duration;
  final int reps;
  final int sets;
  final ExerciseType exerciseType;
  final ExerciseMediaType mediaType;

  const ExerciseInformation({
    required this.name,
    required this.description,
    required this.duration,
    required this.reps,
    required this.sets,
    required this.exerciseType,
    required this.mediaType,
  });

  ExerciseInformation copyWith({
    String? name,
    String? description,
    String? duration,
    int? reps,
    int? sets,
    ExerciseType? exerciseType,
    ExerciseMediaType? mediaType,
  }) {
    return ExerciseInformation(
      name: name ?? this.name,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      reps: reps ?? this.reps,
      sets: sets ?? this.sets,
      exerciseType: exerciseType ?? this.exerciseType,
      mediaType: mediaType ?? this.mediaType,
    );
  }

  @override
  List<Object?> get props =>
      [name, description, duration, reps, sets, exerciseType, mediaType];
}
