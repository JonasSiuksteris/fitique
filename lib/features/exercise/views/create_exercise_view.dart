import 'package:fitique/features/exercise/bloc/exercise_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/exercise.dart';

const appBarTitle = 'Create an Exercise';

class CreateExerciseView extends StatelessWidget {
  const CreateExerciseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(appBarTitle),
        ),
        body: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) => buildForm(context, state),
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context, ExerciseState state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              buildNameField(context),
              buildExerciseTypeDropdown(context),
              buildExerciseSpecificField(context),
              buildDescriptionField(context),
              buildAddMediaButton(context),
              buildUploadedFileName(context),
              buildSubmitButton(context),
              buildCancelButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNameField(BuildContext context) {
    final bloc = BlocProvider.of<ExerciseBloc>(context);
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        final exercise = (state is ExerciseUpdated) ? state.exercise : null;
        return TextFormField(
          initialValue: exercise?.name,
          decoration: const InputDecoration(labelText: 'Name'),
          onChanged: (value) => bloc.add(UpdateName(value)),
        );
      },
    );
  }

  Widget buildExerciseTypeDropdown(BuildContext context) {
    final bloc = BlocProvider.of<ExerciseBloc>(context);
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        final exercise = (state is ExerciseUpdated) ? state.exercise : null;
        return DropdownButtonFormField<ExerciseType>(
          value: exercise?.exerciseType,
          decoration: const InputDecoration(labelText: 'Exercise Type'),
          items: ExerciseType.values.map((ExerciseType value) {
            return DropdownMenuItem<ExerciseType>(
              value: value,
              child: Text(value.toString().split('.').last),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              bloc.add(UpdateExerciseType(value));
            }
          },
        );
      },
    );
  }
}

Widget buildExerciseSpecificField(BuildContext context) {
  final bloc = BlocProvider.of<ExerciseBloc>(context);
  return BlocBuilder<ExerciseBloc, ExerciseState>(
    builder: (context, state) {
      if (state is ExerciseUpdated) {
        if (state.exercise.exerciseType == ExerciseType.Cardio) {
          return buildDurationField(context, bloc, state.exercise);
        } else {
          return buildSetAndRepsField(context, bloc, state.exercise);
        }
      } else {
        return Container(); // Or some default widget for initial state
      }
    },
  );
}

Widget buildDurationField(
    BuildContext context, ExerciseBloc bloc, Exercise? exercise) {
  return TextFormField(
    initialValue: exercise?.duration.toString() ?? '',
    decoration: const InputDecoration(labelText: 'Duration (in minutes)'),
    keyboardType: TextInputType.number,
    onChanged: (value) => bloc.add(UpdateDuration(value)),
  );
}

Widget buildSetAndRepsField(
    BuildContext context, ExerciseBloc bloc, Exercise? exercise) {
  return Column(
    children: [
      TextFormField(
        initialValue: exercise?.sets.toString() ?? '',
        decoration: const InputDecoration(labelText: 'Sets'),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          final intValue = int.tryParse(value) ?? 0;
          bloc.add(UpdateSets(intValue));
        },
      ),
      TextFormField(
        initialValue: exercise?.reps.toString() ?? '',
        decoration: const InputDecoration(labelText: 'Reps'),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          final intValue = int.tryParse(value) ?? 0;
          bloc.add(UpdateReps(intValue));
        },
      ),
    ],
  );
}

Widget buildDescriptionField(BuildContext context) {
  final bloc = BlocProvider.of<ExerciseBloc>(context);
  return BlocBuilder<ExerciseBloc, ExerciseState>(
    builder: (context, state) {
      final exercise = (state is ExerciseUpdated) ? state.exercise : null;
      return TextFormField(
        initialValue: exercise?.description,
        decoration: const InputDecoration(labelText: 'Description'),
        onChanged: (value) => bloc.add(UpdateDescription(value)),
      );
    },
  );
}

Widget buildAddMediaButton(BuildContext context) {
  // Replace this with your actual implementation
  return ElevatedButton(
    child: const Text('Add Media'),
    onPressed: () {
      // Handle media addition
    },
  );
}

Widget buildUploadedFileName(BuildContext context) {
  return const Text('Uploaded file: filename');
}

Widget buildSubmitButton(BuildContext context) {
  return ElevatedButton(
    child: const Text('Submit'),
    onPressed: () {
      //bloc.add(SubmitExercise()); // Uncomment this line when you implement the SubmitExercise event
    },
  );
}

Widget buildCancelButton(BuildContext context) {
  return ElevatedButton(
    child: const Text('Cancel'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
}
