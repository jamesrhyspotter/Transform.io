import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/apis/training_principle_db.dart';
import 'package:transform_dot_io/models/ExerciseModel.dart';
import 'package:transform_dot_io/models/WorkoutModel.dart';
import 'package:tuple/tuple.dart';




class ExerciseCardScreenProvider with ChangeNotifier {


  var workoutSetList = new Map();
  Workout workout;
  List<String> exercises = [];
  String currentExercise;
  List<int> setCountPerExerciseList;

  List<TrainingPrinciple> trainingPrincipleList;
  TrainingPrinciple selectedPrinciple;
  double repsStartingValue = 8;
  double weightStartingValue = 50;
  double rpeStartingValue = 5;


  ExerciseCardScreenProvider(this.exercises){
    this.currentExercise = exercises[0];
    this.setCountPerExerciseList = List.filled(this.exercises.length, 0);
    TrainingPrincipleDB tpDb = new TrainingPrincipleDB();
    this.trainingPrincipleList = tpDb.trainingPrincipleList;
    this.selectedPrinciple = this.trainingPrincipleList[0];

    for(int i = 0; i < this.exercises.length; i++){
      workoutSetList[this.exercises[i]] = [];
    }

  }


  setCurrentExercise(String name){
    this.currentExercise = name;
    notifyListeners();
  }

  incrementSetCounter(String name){
    int index = this.exercises.indexOf(this.currentExercise);
    setCountPerExerciseList[index]++;

    print(setCountPerExerciseList);
    notifyListeners();
  }

  setRepsStartingValue(double value){
    this.repsStartingValue = value;
    notifyListeners();
  }

  setWeightStartingValue(double value){
    this.weightStartingValue = value;
    notifyListeners();
  }

  setSetRepsAndWeight(String exerciseName, String reps, int weight){
    print(exerciseName);
    print(this.exercises.indexOf(exerciseName));
    print(reps);
    print(weight.toString());

    this.workoutSetList[exerciseName].add([reps, weight]);

    print(this.workoutSetList[exerciseName]);

  }

  void setRPE(double inputRPE){
    rpeStartingValue = inputRPE;
    notifyListeners();
  }

  isChecked(TrainingPrinciple inputPrinciple){
    if(this.selectedPrinciple.name == inputPrinciple.name){
      return true;
    }else{
      return false;
    }
  }

  changeTrainingPrinciple(TrainingPrinciple inputPrinciple){
    if(this.selectedPrinciple != inputPrinciple){
      this.selectedPrinciple = inputPrinciple;
    }

    print('Current Principle is: ');
    print(this.selectedPrinciple.name);

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