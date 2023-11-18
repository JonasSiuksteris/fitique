enum ExerciseType { Cardio, Strength, Flexibility }

class Exercise {
  final String name;
  final String description;
  final String duration;
  final int reps;
  final int sets;
  final ExerciseType exerciseType;

  Exercise({
    required this.name,
    required this.description,
    required this.duration,
    required this.reps,
    required this.sets,
    required this.exerciseType,
  });

  Exercise copyWith({
    String? name,
    String? description,
    String? duration,
    int? reps,
    int? sets,
    ExerciseType? exerciseType,
  }) {
    return Exercise(
      name: name ?? this.name,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      reps: reps ?? this.reps,
      sets: sets ?? this.sets,
      exerciseType: exerciseType ?? this.exerciseType,
    );
  }
}
