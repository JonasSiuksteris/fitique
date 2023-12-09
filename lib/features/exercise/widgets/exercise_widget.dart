import 'package:fitique/features/exercise/models/exercise.dart';
import 'package:flutter/material.dart';

class ExerciseWidget extends StatelessWidget {
  final ExerciseInformation exercise;

  const ExerciseWidget({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(exercise.name),
      subtitle: Text(exercise.description),
    );
  }
}
