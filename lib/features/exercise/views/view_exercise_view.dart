import 'package:fitique/features/exercise/models/exercise.dart';
import 'package:fitique/features/exercise/widgets/youtube_player_widget.dart';
import 'package:flutter/material.dart';

const appBarTitle = 'View Exercise';

class ViewExerciseView extends StatefulWidget {
  final List<ExerciseInformation> exercises;

  const ViewExerciseView({Key? key, required this.exercises}) : super(key: key);

  @override
  _ExerciseViewState createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ViewExerciseView> {
  int currentExerciseIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Exercises'), // Optional: You can customize the AppBar
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: _buildExerciseContent(
                  widget.exercises[currentExerciseIndex])),
          _buildNavigationControls(),
        ],
      ),
    );
  }

  Widget _buildExerciseContent(ExerciseInformation exercise) {
    switch (exercise.mediaType) {
      case ExerciseMediaType.video:
        return YoutubePlayerWidget(
          videoUrl: exercise.description,
          onVideoEnd: _goToNextExercise,
        ); // This is a custom widget for YouTube videos
      case ExerciseMediaType.text:
        return Text(exercise.description); // Just an example
      // Handle other types of content
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildNavigationControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.skip_previous),
          onPressed: _goToPreviousExercise,
        ),
        Text(
          '${currentExerciseIndex + 1}/${widget.exercises.length}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.skip_next),
          onPressed: _goToNextExercise,
        ),
      ],
    );
  }

  void _goToNextExercise() {
    if (currentExerciseIndex < widget.exercises.length - 1) {
      setState(() {
        currentExerciseIndex++;
      });
    }
  }

  void _goToPreviousExercise() {
    if (currentExerciseIndex > 0) {
      setState(() {
        currentExerciseIndex--;
      });
    }
  }
}
