import 'package:flutter/material.dart';
import 'package:transform_dot_io/apis/exercise_db.dart';
import 'package:transform_dot_io/models/exercise_model.dart';
import 'package:transform_dot_io/models/workout_model.dart';

class SetWorkoutProvider extends ChangeNotifier {

  Workout workout;
  List<Exercise> optionExercises =[];

  SetWorkoutProvider(Workout inputWorkout){
    this.workout = inputWorkout;

    ExerciseDataBase eDb = new ExerciseDataBase();

    for (int j = 0; j < this.workout.targetMuscles.length; j++){
      print(this.workout.targetMuscles);
      print(eDb.getAllExercises(this.workout.targetMuscles[j]));
      for(int k = 0; k < eDb.getAllExercises(this.workout.targetMuscles[j]).length; k++){
        optionExercises.add(eDb.getAllExercises(this.workout.targetMuscles[j])[k]);
      }
    }

  }

  void addExerciseToWorkout(Exercise inputExercise){
    if(!workout.outputExerciseList.contains(inputExercise)){
      this.workout.outputExerciseList.add(inputExercise);
    }
    notifyListeners();
  }

  void removeExerciseFromWorkout(Exercise inputExercise){
    if(workout.outputExerciseList.contains(inputExercise)){
      this.workout.outputExerciseList.remove(inputExercise);
    }
    notifyListeners();
  }

}