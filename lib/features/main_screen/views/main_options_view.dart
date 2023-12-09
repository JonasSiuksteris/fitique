import 'package:fitique/features/exercise/models/exercise.dart';
import 'package:fitique/features/exercise/views/create_exercise_view.dart';
import 'package:fitique/features/exercise/views/view_exercise_view.dart';
import 'package:flutter/material.dart';

class MainOptionsView extends StatelessWidget {
  const MainOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: const Text('Create an Exercise'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateExerciseView()),
            );
          },
        ),
        ListTile(
          title: const Text('View Exercises'),
          onTap: () {
            // Create a list of exercises
            List<ExerciseInformation> exercises = [
              generateYoutubeExerciseInformation(),
              generateTextExerciseInformation(),
              // Add more exercises as needed
            ];

            // Navigate to ExerciseView with the list of exercises
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewExerciseView(exercises: exercises)),
            );
          },
        ),
        // Add more ListTiles for other options here
      ],
    );
  }
}

generateYoutubeExerciseInformation() {
  return ExerciseInformation(
    name: 'Youtube Exercise',
    description: 'https://www.youtube.com/watch?v=-SSYX8sIOmM',
    duration: '1',
    reps: 1,
    sets: 1,
    exerciseType: ExerciseType.cardio,
    mediaType: ExerciseMediaType.video,
  );
}

generateTextExerciseInformation() {
  return ExerciseInformation(
    name: 'Pushups',
    description: 'Regular one',
    duration: '1',
    reps: 1,
    sets: 1,
    exerciseType: ExerciseType.cardio,
    mediaType: ExerciseMediaType.text,
  );
}
