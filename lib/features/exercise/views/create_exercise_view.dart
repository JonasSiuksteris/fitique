import 'package:flutter/material.dart';

class CreateExerciseView extends StatefulWidget {
  const CreateExerciseView({Key? key}) : super(key: key);

  @override
  _CreateExerciseViewState createState() => _CreateExerciseViewState();
}

class _CreateExerciseViewState extends State<CreateExerciseView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _durationController = TextEditingController();
  final _repsController = TextEditingController();
  final _setsController = TextEditingController();
  String dropdownValue = 'Cardio';
  String uploadedFileName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create an Exercise'),
      ),
      body: buildForm(),
    );
  }

  Widget buildForm() {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          buildNameField(),
          buildExerciseTypeDropdown(),
          buildExerciseSpecificField(),
          buildDescriptionField(),
          buildAddMediaButton(),
          buildUploadedFileName(),
          buildSubmitButton(),
          buildCancelButton(),
        ],
      ),
    );
  }

  Widget buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(labelText: 'Name'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a name';
        }
        return null;
      },
    );
  }

  Widget buildExerciseTypeDropdown() {
    return DropdownButtonFormField(
      value: dropdownValue,
      decoration: const InputDecoration(labelText: 'Exercise Type'),
      items: ['Cardio', 'Strength', 'Flexibility'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
    );
  }

  Widget buildExerciseSpecificField() {
    if (dropdownValue == 'Cardio') {
      return TextFormField(
        controller: _durationController,
        decoration: const InputDecoration(labelText: 'Duration'),
      );
    } else {
      return Column(
        children: <Widget>[
          TextFormField(
            controller: _repsController,
            decoration: const InputDecoration(labelText: 'Reps'),
          ),
          TextFormField(
            controller: _setsController,
            decoration: const InputDecoration(labelText: 'Sets'),
          ),
        ],
      );
    }
  }

  Widget buildDescriptionField() {
    return TextFormField(
      controller: _descriptionController,
      decoration: const InputDecoration(labelText: 'Description'),
    );
  }

  Widget buildAddMediaButton() {
    return ElevatedButton(
      child: const Text('Add Media'),
      onPressed: () {
        // Open file picker dialog and update uploadedFileName
      },
    );
  }

  Widget buildUploadedFileName() {
    if (uploadedFileName.isNotEmpty) {
      return Text('Uploaded file: $uploadedFileName');
    } else {
      return Container();
    }
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: const Text('Submit'),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Create the exercise
        }
      },
    );
  }

  Widget buildCancelButton() {
    return ElevatedButton(
      child: const Text('Cancel'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
