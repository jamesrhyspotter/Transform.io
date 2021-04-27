import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/models/ExerciseModel.dart';
import 'package:transform_dot_io/models/WorkoutModel.dart';


class ExerciseCardScreenProvider with ChangeNotifier {

  Workout workout;
  List<String> exercises = [];
  String currentExercise;

  ExerciseCardScreenProvider(this.exercises){
    this.currentExercise = exercises[0];
  }


  setCurrentExercise(String name){
    print('Current exercise is now: ' + name);
    this.currentExercise = name;
    notifyListeners();
  }

  //WORKOUT
  //CURRENT EXERCISE BEING VIEWED
  //WORKOUT DURATION
  //REST
  //SETS PER EXERCISE
  //WEIGHT PER EXERCISE
  //ATPs
  //NOTES PER EXERCISE

}