import 'package:flutter/material.dart';
import 'package:transform_dot_io/models/exercise_model.dart';
import 'package:transform_dot_io/models/workout_model.dart';

class AccountProvider with ChangeNotifier {

  List<String> trainedMuscleGroups;
  Map muscleGroupFrequency;
  Map muscleLevels;
  List<Workout> workoutHistory;
  List<Exercise> exerciseHistory;
  Color primaryColor;
  Workout currentWorkout;
  String _email;
  String _password;

  AccountProvider();

  void logWorkout(Map workoutSetList){
    print(workoutSetList);
  }


}