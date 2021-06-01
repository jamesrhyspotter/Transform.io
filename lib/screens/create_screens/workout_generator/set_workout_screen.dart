import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/apis/exercise_db.dart';
import 'package:transform_dot_io/apis/muscle_icons.dart';
import 'package:transform_dot_io/models/exercise_model.dart';
import 'package:transform_dot_io/models/workout_model.dart';
import 'package:transform_dot_io/providers/exercise_card_screen_provider.dart';
import 'package:transform_dot_io/providers/set_workout_provider.dart';

import 'exercise_card_screen.dart';

class SetWorkoutScreen extends StatelessWidget {

  Workout workout;
  List<Exercise> workoutExercises;
  List<String> exerciseNames;
  List<String> buttonOptions;
  List<Exercise> optionExercises = [];


  SetWorkoutScreen(Workout inputWorkout){
    this.workout = inputWorkout;
    final List<Exercise> workoutExercises = this.workout.outputExerciseList;
    this.workoutExercises = workoutExercises;

    this.exerciseNames = new List(this.workoutExercises.length);

    this.buttonOptions = this.workout.targetMuscles;

    ExerciseDataBase eDb = new ExerciseDataBase();

    for (int j = 0; j < this.workout.targetMuscles.length; j++){
      print(this.workout.targetMuscles);
      print(eDb.getAllExercises(this.workout.targetMuscles[j]));
      for(int k = 0; k < eDb.getAllExercises(this.workout.targetMuscles[j]).length; k++){
        optionExercises.add(eDb.getAllExercises(this.workout.targetMuscles[j])[k]);
      }
    }

  }

  MuscleIcons mIcons = new MuscleIcons();

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    final List<Exercise> _items = this.workout.outputExerciseList;

    //CREATE PROVIDER TO SET WORKOUT CHANGES
    return ChangeNotifierProvider(
      create: (_) => SetWorkoutProvider(this.workout),
      child: Consumer<SetWorkoutProvider>(
        builder: (context, setWorkoutProvider, child){
          return Scaffold(
            appBar: AppBar(
              title: Text('Your Workout', style: GoogleFonts.montserrat()),
            ),
            body: Column(
              children: [
                Container(
                  height: height*0.75,
                  child: ReorderableListView(
                    children: <Widget>[
                      for (int index = 0; index < _items.length; index++)
                        Padding(
                          key: Key('$index'),
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.black12,
                            key: Key('$index'),
                            child: ListTile(
                                key: Key('$index'),
                               // leading: CircleAvatar(maxRadius: 25, child: _items[index].image, backgroundColor: Colors.black12,),
                                title: Text((index + 1).toString() + '. ${_items[index].name}', style: GoogleFonts.montserrat(fontSize: 16)),
                                leading: _items[index].image,
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Icon(Icons.looks_one_rounded, color: Colors.amber[500],),
                                    // Icon(Icons.looks_two_rounded, color: Colors.amber[600],),
                                    // Icon(Icons.looks_3_rounded, color: Colors.amber[700]),
                                    // Icon(Icons.looks_4_rounded, color: Colors.amber[800]),
                                    // Icon(Icons.looks_5_rounded, color: Colors.amber[900]),
                                    Text(_items[index].targetMuscles.toString(), style: GoogleFonts.montserrat(fontSize: 12, color: Colors.grey)),
                                  ],
                                ),
                                trailing: FlatButton(
                                    child: Icon(Icons.more_horiz),
                                    onPressed: () {
                                      // This is the type used by the popup menu below.
                                      showModalBottomSheet(context: context, builder: (BuildContext context){

                                        List<String> options = [
                                          'Refresh Exercise',
                                          'Remove This Exercise',
                                          'Set Superset with Following Exercise',
                                        ];

                                        List<Icon> iconList = [
                                          Icon(Icons.remove),
                                          Icon(Icons.refresh),
                                          Icon(Icons.arrow_circle_down),
                                        ];

                                        return Container(
                                          height: height * 0.3,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(_items[index].name, style: GoogleFonts.montserrat(fontSize: 16)),
                                                ),
                                                Divider(thickness: 1.0,),
                                                Container(
                                                  height: height*0.2,
                                                  child: Column(
                                                    children: [
                                                      RaisedButton(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(18.0),
                                                            side: BorderSide(color: Colors.amber[800])),
                                                        onPressed: (){
                                                          //setWorkoutProvider.removeExerciseFromWorkout(_items[index]);
                                                          //TODO - push exercise card screen just for this exercise
                                                          Navigator.of(context).pop();
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => ExerciseCardScreen(this.workout, index))
                                                          );
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text('Input Sets'),
                                                            Icon(Icons.arrow_forward),
                                                          ],
                                                        ),
                                                        color: Colors.black12,


                                                      ),

                                                      RaisedButton(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(18.0),
                                                            side: BorderSide(color: Colors.amber[800])),
                                                        onPressed: (){
                                                          //setWorkoutProvider.removeExerciseFromWorkout(_items[index]);
                                                          Navigator.of(context).pop();

                                                        },
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(options[2]),
                                                            iconList[2],
                                                          ],
                                                        ),
                                                        color: Colors.black12,


                                                      ),
                                                      RaisedButton(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(18.0),
                                                            side: BorderSide(color: Colors.amber[800])),
                                                        onPressed: (){
                                                          setWorkoutProvider.removeExerciseFromWorkout(_items[index]);
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(options[1]),
                                                            iconList[0],
                                                          ],
                                                        ),
                                                        color: Colors.black12,


                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                        );
                                      });
                                    }
                                )
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.amber[800], width: 2)),
                          ),
                        )
                    ],
                    onReorder: (int oldIndex, int newIndex) {
                      setWorkoutProvider.reorderWorkout(oldIndex, newIndex);
                    },
                  ),
                ),
                Container(
                  height: height * .08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(onPressed: (){}, child: Text('Save & Exit', style: GoogleFonts.montserrat()), color: Colors.amber[800],),
                      FloatingActionButton(
                        child: Icon(Icons.add, color: Colors.white,),
                        backgroundColor: Colors.amber[800],
                        onPressed: (){
                          showModalBottomSheet(context: context, builder: (BuildContext context){
                            return Scaffold(
                              body: Container(
                                height: height*.6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: height * 0.05,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: this.buttonOptions.length,
                                            itemBuilder: (BuildContext context, int index){
                                              return Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: RaisedButton(
                                                  color: Colors.black12,
                                                  child: Text(this.buttonOptions[index]),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(18.0),
                                                      side: BorderSide(color: Colors.amber[800])),
                                                  onPressed: (){

                                                  },
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                    Divider(thickness: 1.0,),
                                    Container(
                                      height: height * 0.4,
                                      child: ListView.builder(
                                          itemCount: optionExercises.length,
                                          itemBuilder: (BuildContext context, int index2){
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Card(
                                                color: Colors.black12,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(18.0),
                                                    side: BorderSide(color: Colors.amber[800], width: 2)),
                                                key: Key('$index2'),
                                                child:  ListTile(
                                                  key: Key('$index2'),
                                                  leading: optionExercises[index2].image,
                                                  title: Text('${optionExercises[index2].name}', style: GoogleFonts.montserrat()),
                                                  subtitle: Row(
                                                    children: [
                                                      Text(optionExercises[index2].targetMuscles.toString()),
                                                    ],
                                                  ),
                                                  trailing: FlatButton(
                                                    child: (!setWorkoutProvider.workout.outputExerciseList.contains(optionExercises[index2]) ? Icon(Icons.add, color: Colors.white) : Icon(Icons.check, color: Colors.white)),
                                                    onPressed: (){
                                                      Navigator.of(context).pop();

                                                      setWorkoutProvider.addExerciseToWorkout(optionExercises[index2]);

                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                    Divider(thickness: 1.0,),
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                      ),
                      FlatButton(onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExerciseCardScreen(this.workout, 0)));
                      }, child: Text('Card View', style: GoogleFonts.montserrat()), color: Colors.amber[800]),

                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}
