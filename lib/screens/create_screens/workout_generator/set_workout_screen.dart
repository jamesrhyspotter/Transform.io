import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transform_dot_io/apis/muscle_icons.dart';
import 'package:transform_dot_io/models/exercise_model.dart';
import 'package:transform_dot_io/models/workout_model.dart';

import 'exercise_card_screen.dart';

class SetWorkoutScreen extends StatelessWidget {

  Workout workout;
  List<Exercise> workoutExercises;
  List<String> exerciseNames;
  List<String> buttonOptions;


  SetWorkoutScreen(Workout inputWorkout){
    this.workout = inputWorkout;
    final List<Exercise> workoutExercises = this.workout.outputExerciseList;
    this.workoutExercises = workoutExercises;

    this.exerciseNames = new List(this.workoutExercises.length);

    for (int i = 0; i < this.workoutExercises.length; i++) {
      this.exerciseNames[i] = this.workoutExercises[i].name;
      print(this.exerciseNames[i]);
    }

    this.buttonOptions = this.workout.targetMuscles;
  }

  MuscleIcons mIcons = new MuscleIcons();

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    final List<String> _items = this.exerciseNames;

    return Scaffold(
      appBar: AppBar(
        title: Text('Set Your Workout', style: GoogleFonts.montserrat()),
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
                          leading: CircleAvatar(maxRadius: 25, child: Image(image: AssetImage('lib/assets/prometheus_white_orange/full_body_white.png')), backgroundColor: Colors.black12,),
                          title: Text((index + 1).toString() + '. ${_items[index]}', style: GoogleFonts.montserrat()),
                          subtitle: Row(
                            children: [
                              Icon(Icons.star_border, color: Colors.amber[800],),
                              Icon(Icons.star_border, color: Colors.amber[800]),
                              Icon(Icons.star_border, color: Colors.amber[800]),
                              Icon(Icons.star_border, color: Colors.amber[800]),
                              Icon(Icons.star_border, color: Colors.amber[800]),
                              Icon(Icons.star, color: Colors.amber[800]),
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
                                    Icon(Icons.refresh),
                                    Icon(Icons.remove),
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
                                            child: Text(_items[index], style: GoogleFonts.montserrat(fontSize: 16)),
                                          ),
                                          Divider(thickness: 1.0,),
                                          Container(
                                            height: height*0.2,
                                            child: ListView.builder(

                                                itemCount: options.length,
                                                itemBuilder: (BuildContext context, int index){
                                                    return Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: RaisedButton(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(18.0),
                                                            side: BorderSide(color: Colors.amber[800])),
                                                          onPressed: (){},
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(options[index]),
                                                              iconList[index],
                                                            ],
                                                          ),
                                                          color: Colors.black12,


                                                      ),
                                                    );
                                                }
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
                  // setState(() {
                  //   if (oldIndex < newIndex) {
                  //     newIndex -= 1;
                  //   }
                  //   final int item = _items.removeAt(oldIndex);
                  //   _items.insert(newIndex, item);
                  // });
                },
              ),
            ),
            Container(
              height: height * .08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(onPressed: (){}, child: Text('Refresh All', style: GoogleFonts.montserrat()), color: Colors.amber[800],),
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
                                      itemCount: 5,
                                      itemBuilder: (BuildContext context, int index2){
                                        return Card(
                                          key: Key('$index2'),
                                          child:  ListTile(
                                            key: Key('$index2'),
                                            leading: CircleAvatar(child: Icon(Icons.account_circle_sharp, color: Colors.white,), backgroundColor: Colors.amber[800],),
                                            title: Text((index2 + 1).toString() + '. Exercise ${_items[index2]}', style: GoogleFonts.montserrat()),
                                            subtitle: Row(
                                              children: [
                                                Icon(Icons.star_border, color: Colors.amber[800],),
                                                Icon(Icons.star_border, color: Colors.amber[800]),
                                                Icon(Icons.star_border, color: Colors.amber[800]),
                                                Icon(Icons.star_border, color: Colors.amber[800]),
                                                Icon(Icons.star_border, color: Colors.amber[800]),
                                                Icon(Icons.star, color: Colors.amber[800]),
                                              ],
                                            ),
                                            trailing: FlatButton(
                                              child: Icon(Icons.add, color: Colors.white),
                                              onPressed: (){
                                                final snackBar = SnackBar(
                                                  content: Text('Yay! ' + ' Exercise ${_items[index2]} added!', style: GoogleFonts.montserrat(color: Colors.amber[800]),),
                                                  action: SnackBarAction(
                                                    label: 'Undo',
                                                    onPressed: () {
                                                      // Some code to undo the change.
                                                    },
                                                  ),
                                                );

                                                // Find the ScaffoldMessenger in the widget tree
                                                // and use it to show a SnackBar.
                                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                              },
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
                            builder: (context) => ExerciseCardScreen(this.workout)));
                  }, child: Text('Go', style: GoogleFonts.montserrat()), color: Colors.amber[800]),

                ],
              ),
            ),
          ],
        ),
    );
  }

}
