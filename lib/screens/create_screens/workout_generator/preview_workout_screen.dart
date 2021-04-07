import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transform_dot_io/components/ScreenTitle.dart';
import 'package:transform_dot_io/components/information_modal.dart';
import 'package:transform_dot_io/models/ExerciseModel.dart';
import 'package:transform_dot_io/models/WorkoutModel.dart';
import 'my_workout_screen.dart';

// ignore: must_be_immutable
class PreviewWorkoutScreen extends StatelessWidget {


  Workout workout;
  List<Exercise> workoutExercises = [];
  List<String> exerciseNames;

  PreviewWorkoutScreen(this.workout){
    final List<Exercise> workoutExercises = this.workout.outputExerciseList;
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
        actions: [
          FlatButton(child: Icon(Icons.timer), onPressed: (){}),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: height*.78,
            decoration: new BoxDecoration(
              color: Colors.black12,
            ),
            child:

        ListView.builder(
              itemCount: this.workoutExercises.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.black12,
                    onTap: (){
                     showModalBottomSheet(
                         context: context,
                         builder: (BuildContext context){
                           // return Scaffold(
                           //   body: Padding(
                           //     padding: const EdgeInsets.all(8.0),
                           //     child: Container(
                           //       height: 500,
                           //       child: Column(
                           //         mainAxisAlignment: MainAxisAlignment.start,
                           //         children: [
                           //           Padding(
                           //             padding: const EdgeInsets.all(16.0),
                           //             child: Row(
                           //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           //               children: [
                           //                 Text(this.workoutExercises[index].name, style: GoogleFonts.montserrat(),),
                           //                 Container(
                           //                   height: 100,
                           //                   width: 100,
                           //                   decoration: BoxDecoration(
                           //                     color: Colors.black45,
                           //                     borderRadius: BorderRadius.circular(20),
                           //                   ),
                           //                   child: Center(child: Text('Image')),
                           //                 )
                           //               ],
                           //             ),
                           //           ),
                           //           Divider(thickness: 1,),
                           //           Row(
                           //             children: [
                           //               Container(
                           //                 height: 315,
                           //                 width: 395,
                           //                 child: ListView.builder(
                           //                      itemCount: this.workout.sets[index],
                           //                     itemBuilder: (BuildContext context, int index){
                           //                        return Container(
                           //                          child: ListTile(
                           //                            title: Text('Set ' + (index+1).toString(),  style: GoogleFonts.montserrat()),
                           //                            subtitle: Text('Exercise description',  style: GoogleFonts.montserrat()),
                           //                            trailing: Checkbox(value: false),
                           //                          ),
                           //                        );
                           //                     }
                           //                 ),
                           //               )
                           //             ],
                           //           ),
                           //           Divider(thickness: 1,)
                           //         ],
                           //       ),
                           //     ),
                           //   ),
                           // );
                           return InformationModal(workout, index);
                         }

                     );
                    },
                    title: Text(
                      this.workoutExercises[index].name,
                      style: TextStyle(color: Colors.amber[800]),
                    ),
                    trailing: Text(
                        this.workout.sets[index].toString() +
                            ' x ' +
                            this.workout.reps[index].toString(),
                        style: TextStyle(color: Colors.amber[800])),
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
              child: Text('SAVE WORKOUT', style: TextStyle(color: Colors.amber[800]),),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('START', style: TextStyle(color: Colors.amber[800])),
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
