enum ExerciseType { Cardio, Strength, Flexibility }

class Exercise {
  String name;
  String description;
  String duration;
  int reps;
  int sets;
  ExerciseType exerciseType;

  Exercise({
    required this.name,
    required this.description,
    required this.duration,
    required this.reps,
    required this.sets,
    required this.exerciseType,
  });
}
