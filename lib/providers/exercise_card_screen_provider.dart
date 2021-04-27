import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/models/ExerciseModel.dart';
import 'package:transform_dot_io/models/WorkoutModel.dart';


class ExerciseCardScreenProvider with ChangeNotifier {

  Workout workout;
  List<String> exercises = [];
  String currentExercise;
  List<int> setList;

  ExerciseCardScreenProvider(this.exercises){
    this.currentExercise = exercises[0];
    this.setList = List.filled(this.exercises.length, 0);

  }


  setCurrentExercise(String name){
    print('Current exercise is now: ' + name);
    this.currentExercise = name;
    notifyListeners();
  }

  addSet(String name){
    print('Adding a set for: ' + this.currentExercise);
    int index = this.exercises.indexOf(this.currentExercise);
    setList[index]++;
    print(setList);
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