import 'package:flutter/material.dart';
import 'package:transform_dot_io/models/WorkoutModel.dart';

class WorkoutPreferencesProvider with ChangeNotifier {


  //WORKOUT OBJECT
  Workout workout;

  //Generated Workout
  Workout generatedWorkout;

  //COLORS
  List<Color> unselectedButtonColors = [
    Colors.blue.withOpacity(0.05),
    Colors.black.withOpacity(0.05),
    Colors.white10
  ];
  List<Color> selectedButtonColors = [
    Colors.amber[800],
    Colors.black12,
    Colors.white
  ];

  //LISTS TO USE
  final List<String> muscleGroupList = [
    'chest',
    'back',
    'shoulders',
    'biceps',
    'Triceps',
    'forearms',
    'abs',
    'quads',
    'hamstrings',
    'glutes',
    'calves',
  ];

  final List<String> disciplinesList = [
    'Strength',
    'Hypertrophy',
    'Endurance',
  ];

  final List<String> equipmentList = [
    'Bodyweight',
    'Dumbbell',
    'Barbell',
    'Resistance Bands',
    'Machines',
  ];

  //MUTABLE LISTS
  List<String> _selectedButtons = [];
  List<String> selectedMuscleList = [];

  double sliderValue = 3;

  //SETTING MUTABLE LISTS
  void setSlider(double value) {
    sliderValue = value;
    notifyListeners();
  }

  void handleButtonTap(String value) {
    if (_selectedButtons.contains(value)) {
      _selectedButtons.remove(value);
    } else {
      _selectedButtons.add(value);
    }
    notifyListeners();
  }

  void handleMuscleSelection(String value) {
    if (!selectedMuscleList.contains(value)) {
      print(value + ' added');
      selectedMuscleList.add(value);
    } else if (selectedMuscleList.contains(value)) {
      print(value + ' removed');
      selectedMuscleList.remove(value);
    }
    notifyListeners();
  }

  List<Color> getColor(String value) {
    if (!_selectedButtons.contains(value)) {
      return unselectedButtonColors;
    } else {
      return selectedButtonColors;
    }
  }


  void createWorkout() {
    List<String> selectedMuscles = [];
    List<String> selectedDiscipline = [];
    List<String> selectedEquipment = [];

    for (int i = 0; i < _selectedButtons.length; i++) {
      if (muscleGroupList.contains(_selectedButtons[i])) {
        selectedMuscles.add(
            muscleGroupList[muscleGroupList.indexOf(_selectedButtons[i])]);
      } else if (equipmentList.contains(_selectedButtons[i])) {
        selectedEquipment.add(
            equipmentList[equipmentList.indexOf(_selectedButtons[i])]);
      } else if (disciplinesList.contains(_selectedButtons[i])) {
        selectedDiscipline.add(
            disciplinesList[disciplinesList.indexOf(_selectedButtons[i])]);
      }
    }

    workout = new Workout(
        selectedMuscles, selectedDiscipline, selectedEquipment, sliderValue);

    generatedWorkout = workout;
  }

}