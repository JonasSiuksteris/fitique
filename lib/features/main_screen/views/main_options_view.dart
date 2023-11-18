import 'package:fitique/features/exercise/views/create_exercise_view.dart';
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
        // Add more ListTiles for other options here
      ],
    );
  }
}
