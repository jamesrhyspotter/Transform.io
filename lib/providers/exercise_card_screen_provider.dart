import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/apis/training_principle_db.dart';
import 'package:transform_dot_io/models/ExerciseModel.dart';
import 'package:transform_dot_io/models/WorkoutModel.dart';
import 'package:tuple/tuple.dart';




class ExerciseCardScreenProvider with ChangeNotifier {

  //Tuple for exercise name / rep # + weight
  Tuple2 currentSet = Tuple2<String, int>('a', 10);
  //List of tuples for each exercise

  Workout workout;
  List<String> exercises = [];
  String currentExercise;
  List<int> setCountPerExerciseList;
  List<List<Tuple2<String, int>>> workoutSetlist;
  List<TrainingPrinciple> trainingPrincipleList;
  TrainingPrinciple selectedPrinciple;
  double repsStartingValue = 8;
  double weightStartingValue = 50;


  ExerciseCardScreenProvider(this.exercises){
    this.currentExercise = exercises[0];
    this.setCountPerExerciseList = List.filled(this.exercises.length, 0);
    TrainingPrincipleDB tpDb = new TrainingPrincipleDB();
    this.trainingPrincipleList = tpDb.trainingPrincipleList;
    this.selectedPrinciple = this.trainingPrincipleList[0];

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

  setSetRepsAndWeight(String exerciseName, int setNumber, String reps, int weight){
    print(exerciseName);
    print(setNumber.toString());
    print(reps);
    print(weight.toString());
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