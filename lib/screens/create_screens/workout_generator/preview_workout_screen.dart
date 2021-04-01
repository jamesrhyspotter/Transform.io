import 'package:flutter/material.dart';
import 'package:transform_dot_io/models/ExerciseModel.dart';
import 'package:transform_dot_io/models/WorkoutModel.dart';
import 'my_workout_screen.dart';

// ignore: must_be_immutable
class PreviewWorkoutScreen extends StatelessWidget {


  Workout workout;
  List<Exercise> workoutExercises = [];
  List<String> exerciseNames;

  PreviewWorkoutScreen(inputWorkout){
    final Workout workout = inputWorkout;
    this.workout = workout;
    final List<Exercise> workoutExercises = inputWorkout.outputExerciseList;
    this.workoutExercises = workoutExercises;

    this.exerciseNames = new List(this.workoutExercises.length);

    for (int i = 0; i < this.workoutExercises.length; i++){
      this.exerciseNames[i] = this.workoutExercises[i].name;
    }

  }


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [
          Container(
            height: height*.78,
            decoration: new BoxDecoration(
              color: Colors.blue,
            ),
            child:

        ListView.builder(
              itemCount: this.workoutExercises.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.black26,

                    title: Text(
                      this.workoutExercises[index].name,
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Text(
                        this.workout.sets[index].toString() +
                            ' x ' +
                            this.workout.reps[index].toString(),
                        style: TextStyle(color: Colors.white)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: height * 0.10,
        color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
              child: Text('SAVE WORKOUT', style: TextStyle(color: Colors.blue),),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('START', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyWorkoutScreen()));
              },
            )
          ],
        ),
      ),
    );

  }


}
