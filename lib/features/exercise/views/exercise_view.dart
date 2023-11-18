import 'package:fitique/features/exercise/models/exercise.dart';
import 'package:fitique/features/exercise/widgets/exercise_widget.dart';
import 'package:flutter/material.dart';

class ExerciseView extends StatelessWidget {
  final List<Exercise> exercises;

  const ExerciseView({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        return ExerciseWidget(exercise: exercises[index]);
      },
    );
  }
}
