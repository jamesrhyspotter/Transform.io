import 'package:flutter/material.dart';
import 'package:transform_dot_io/apis/exercise_db.dart';
import 'package:transform_dot_io/models/exercise_model.dart';
import 'package:transform_dot_io/models/workout_model.dart';

class SetWorkoutProvider extends ChangeNotifier {

  Workout workout;
  List<Exercise> optionExercises =[];
  List<int> setsPerExercise;
  List<bool> isSuperset;

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

    setsPerExercise = new List(this.workout.outputExerciseList.length);

    this.isSuperset = List.filled(this.workout.outputExerciseList.length, false);

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

      this.isSuperset.remove(this.workout.outputExerciseList.indexOf(inputExercise));
    }
    notifyListeners();
  }


  void reorderWorkout(int oldIndex, int newIndex){
    if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final Exercise item = this.workout.outputExerciseList.removeAt(oldIndex);
        this.workout.outputExerciseList.insert(newIndex, item);

        notifyListeners();
  }

  void setSuperSet(Exercise inputExercise){
    int index = this.workout.outputExerciseList.indexOf(inputExercise);

    if(index == this.workout.outputExerciseList.length - 1){
      return null;
    }

    if(this.isSuperset[index] == true){
      this.isSuperset[index] = false;
      this.isSuperset[index + 1] = false;
    }else{
      this.isSuperset[index] = true;
      this.isSuperset[index + 1] = true;
    }

    print(this.isSuperset);

    notifyListeners();



  }

}