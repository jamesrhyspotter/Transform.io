import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/apis/training_principle_db.dart';
import 'package:transform_dot_io/models/exercise_model.dart';
import 'package:transform_dot_io/models/workout_model.dart';
import 'package:tuple/tuple.dart';




class ExerciseCardScreenProvider with ChangeNotifier {


  var workoutSetList = new Map();
  Workout workout;
  List<Exercise> exercises = [];
  Exercise currentExercise;
  List<int> setCountPerExerciseList;
  int index;

  List<TrainingPrinciple> trainingPrincipleList;
  TrainingPrinciple selectedPrinciple;
  double repsStartingValue = 8;
  double weightStartingValue = 50;
  double rpeStartingValue = 5;

  int counter = 0;
  Timer timer;
  bool timerOn = false;

  //CONSTRUCTOR ----------------------------------------------------------------

  ExerciseCardScreenProvider(this.workout, this.index){

    exercises = this.workout.outputExerciseList;

    this.currentExercise = exercises[0];
    this.setCountPerExerciseList = List.filled(this.exercises.length, 0);
    TrainingPrincipleDB tpDb = new TrainingPrincipleDB();
    this.trainingPrincipleList = tpDb.trainingPrincipleList;
    this.selectedPrinciple = this.trainingPrincipleList[0];

    for(int i = 0; i < this.exercises.length; i++){
      workoutSetList[this.exercises[i]] = [];
    }

    setCurrentExercise(exercises[index]);

  }



  //TIMER METHODS --------------------------------------------------------------

  void startTimer() {
    if (timer != null) {
      timer.cancel();
    }
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
        timerOn = true;
        counter++;
        notifyListeners();
    });
  }

  void pauseTimer(){
    timerOn = false;
    timer.cancel();
    notifyListeners();
  }

// SET PAGE METHOD --------------------------------------------------------------
  setCurrentExercise(Exercise name){
    this.currentExercise = name;

    notifyListeners();
  }

//WORKOUT METHODS --------------------------------------------------------------


  incrementSetCounter(Exercise name){
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

  setSetRepsWeightandRPE(Exercise exerciseName, String reps, int weight, int rpe){
    print(exerciseName);
    print(this.exercises.indexOf(exerciseName));
    print(reps);
    print(weight.toString());

    this.workoutSetList[exerciseName].add([reps, weight, rpe]);

    print(this.workoutSetList[exerciseName]);

  }

  void setRPE(double inputRPE){
    rpeStartingValue = inputRPE;
    notifyListeners();
  }

  //SAVE WORKOUT
  void logWorkout(Map workoutSetList){
    print(workoutSetList);
  }


  //ADVANCED TRAINING PRINCIPLE METHODS -----------------------------------------

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



}