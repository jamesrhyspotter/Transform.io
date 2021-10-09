import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/apis/training_principle_db.dart';
import 'package:transform_dot_io/components/heading2.dart';
import 'package:transform_dot_io/components/heading3.dart';
import 'package:transform_dot_io/models/exercise_model.dart';
import 'package:transform_dot_io/models/workout_model.dart';
import 'package:transform_dot_io/providers/account_provider.dart';
import 'package:transform_dot_io/providers/exercise_card_screen_provider.dart';
import 'package:transform_dot_io/screens/create_screens/workout_generator/physique_screen.dart';

// ignore: must_be_immutable
class ExerciseCardScreen extends StatelessWidget {
  Workout workout;
  List<Exercise> workoutExercises = [];
  List<String> exerciseNames;
  List<TrainingPrinciple> trainingPrincipleList;
  int startIndex;
  int buttonIndex = 0;

  ExerciseCardScreen(this.workout, this.startIndex) {
    final List<Exercise> workoutExercises = this.workout.outputExerciseList;
    this.workoutExercises = workoutExercises;

    this.exerciseNames = new List(this.workoutExercises.length);

    for (int i = 0; i < this.workoutExercises.length; i++) {
      this.exerciseNames[i] = this.workoutExercises[i].name;
      print(this.exerciseNames[i]);
    }

    TrainingPrincipleDB tpDb = new TrainingPrincipleDB();
    trainingPrincipleList = tpDb.trainingPrincipleList;

    this.startIndex = startIndex;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider<ExerciseCardScreenProvider>(create: (_) =>
      ExerciseCardScreenProvider(this.workout, this.startIndex),
      child: Consumer<ExerciseCardScreenProvider>(
        builder: (context, exerciseScreenProvider, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text('Workout Time: ' + (exerciseScreenProvider.counter/60).toString().substring(0, 1) + 'm ' + (exerciseScreenProvider.counter%60).toString() + 's ',
                  style: GoogleFonts.montserrat(fontSize: 14)),
              actions: [
                FlatButton(child: Icon(Icons.timer), onPressed: () {
                  if(!exerciseScreenProvider.timerOn){
                    exerciseScreenProvider.startTimer();
                  }else{
                    exerciseScreenProvider.pauseTimer();
                  }
                }),
              ],
            ),
            body: Column(
              children: [
                Container(
                  height: height * 0.728,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.black12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.amber[800], width: 2)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    exerciseScreenProvider.currentExercise.name,
                                    style:
                                    GoogleFonts.montserrat(fontSize: 18)),
                                CircleAvatar(
                                  backgroundColor: Colors.black54,
                                  child: exerciseScreenProvider.currentExercise.image,

                                  // child: Image(image: AssetImage(exerciseScreenProvider.getIcon())),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 20,
                                width: 155,
                                child: ListView.builder(

                                    scrollDirection: Axis.horizontal,
                                    itemCount: exerciseScreenProvider
                                        .setCountPerExerciseList[
                                    exerciseScreenProvider.exercises
                                        .indexOf(exerciseScreenProvider
                                        .currentExercise)],
                                    itemBuilder: (BuildContext context, int index){

                                      List<Color> colorList = [
                                        Colors.amber[400],
                                        Colors.amber[500],
                                        Colors.amber[600],
                                        Colors.amber[700],
                                        Colors.amber[800],
                                        Colors.amber[900],
                                      ];

                                      int colorIndex = 0;

                                      List<Icon> iconList = [
                                        Icon(Icons.looks_one_rounded, color: colorList[colorIndex],),
                                        Icon(Icons.looks_two_rounded, color: colorList[colorIndex + 1]),
                                        Icon(Icons.looks_3_rounded, color: colorList[colorIndex + 2]),
                                        Icon(Icons.looks_4_rounded, color: colorList[colorIndex + 3]),
                                        Icon(Icons.looks_5_rounded, color: colorList[colorIndex + 4]),
                                        Icon(Icons.looks_6_rounded, color: colorList[colorIndex + 5]),
                                      ];





                                      return iconList[index];
                                    }
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: height * .3,
                            child: exerciseScreenProvider.currentExercise.image,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 16.0),
                            child: Container(
                              height: height * .23,
                              //TODO: should have card that allows user to mark workout as complete
                              child: ListView.builder(
                                  itemCount: exerciseScreenProvider
                                              .setCountPerExerciseList[
                                          exerciseScreenProvider.exercises
                                              .indexOf(exerciseScreenProvider
                                                  .currentExercise)] +
                                      1,
                                  itemBuilder:
                                      (BuildContext context, int index) {

                                    if (index == this.buttonIndex) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RaisedButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Container(
                                                      height: height*0.48,
                                                      color: Colors.black12,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 16.0,
                                                                    right: 16.0,
                                                                    bottom:
                                                                        12.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Heading2(
                                                                    exerciseScreenProvider
                                                                        .currentExercise.name),
                                                                Heading3('Set ' +
                                                                    (1 + exerciseScreenProvider.setCountPerExerciseList[exerciseScreenProvider.exercises.indexOf(exerciseScreenProvider.currentExercise)])
                                                                        .toString()),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text('Reps', style: GoogleFonts.montserrat()),
                                                                  Container(
                                                                    width: 100,
                                                                    child:
                                                                        SpinBox(
                                                                      min: 0,
                                                                      max: 20,
                                                                      value: exerciseScreenProvider
                                                                          .repsStartingValue,
                                                                      spacing:
                                                                          24,
                                                                      direction:
                                                                          Axis.vertical,
                                                                      textStyle:
                                                                          TextStyle(
                                                                              fontSize: 24),
                                                                      incrementIcon: Icon(
                                                                          Icons
                                                                              .keyboard_arrow_up,
                                                                          size:
                                                                              32),
                                                                      decrementIcon: Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down,
                                                                          size:
                                                                              32),
                                                                      decoration:
                                                                          InputDecoration(
                                                                        border:
                                                                            OutlineInputBorder(),
                                                                        contentPadding:
                                                                            const EdgeInsets.all(24),
                                                                      ),
                                                                      onChanged:
                                                                          (value) {
                                                                        exerciseScreenProvider
                                                                            .setRepsStartingValue(value);
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text('Weight', style: GoogleFonts.montserrat()),
                                                                  Container(
                                                                    width: 100,
                                                                    child:
                                                                        SpinBox(
                                                                      onChanged:
                                                                          (value) {
                                                                        exerciseScreenProvider
                                                                            .setWeightStartingValue(value);
                                                                      },
                                                                      min: 0,
                                                                      max: 300,
                                                                      value: exerciseScreenProvider
                                                                          .weightStartingValue,
                                                                      spacing:
                                                                          24,
                                                                      direction:
                                                                          Axis.vertical,
                                                                      textStyle:
                                                                          TextStyle(
                                                                              fontSize: 24),
                                                                      incrementIcon: Icon(
                                                                          Icons
                                                                              .keyboard_arrow_up,
                                                                          size:
                                                                              32),
                                                                      decrementIcon: Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down,
                                                                          size:
                                                                              32),
                                                                      decoration:
                                                                          InputDecoration(
                                                                        border:
                                                                            OutlineInputBorder(),
                                                                        contentPadding:
                                                                            const EdgeInsets.all(24),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Text('RPE', style: GoogleFonts.montserrat()),
                                                                  Container(
                                                                    width: 100,
                                                                    child:
                                                                    SpinBox(
                                                                      onChanged:
                                                                          (value) {
                                                                        exerciseScreenProvider
                                                                            .setRPE(value);
                                                                      },
                                                                      min: 1,
                                                                      max: 10,
                                                                      value: exerciseScreenProvider
                                                                          .rpeStartingValue,
                                                                      spacing:
                                                                      24,
                                                                      direction:
                                                                      Axis.vertical,
                                                                      textStyle:
                                                                      TextStyle(
                                                                          fontSize: 24),
                                                                      incrementIcon: Icon(
                                                                          Icons
                                                                              .keyboard_arrow_up,
                                                                          size:
                                                                          32),
                                                                      decrementIcon: Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down,
                                                                          size:
                                                                          32),
                                                                      decoration:
                                                                      InputDecoration(
                                                                        border:
                                                                        OutlineInputBorder(),
                                                                        contentPadding:
                                                                        const EdgeInsets.all(24),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        16.0),
                                                                child:
                                                                    FlatButton(
                                                                        color: Colors.amber[
                                                                            800],
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child: Text(
                                                                            'Close',
                                                                            style:
                                                                                GoogleFonts.montserrat(fontSize: 14))),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        16.0),
                                                                child:
                                                                    FlatButton(
                                                                        color: Colors.amber[
                                                                            800],
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          exerciseScreenProvider
                                                                              .incrementSetCounter(exerciseScreenProvider.currentExercise);
                                                                          exerciseScreenProvider.setSetRepsWeightandRPE(
                                                                              exerciseScreenProvider.currentExercise,
                                                                              exerciseScreenProvider.repsStartingValue.toString(),
                                                                              exerciseScreenProvider.weightStartingValue.toInt(), exerciseScreenProvider.rpeStartingValue.toInt());

                                                                        },
                                                                        child: Text(
                                                                            'Save Entry',
                                                                            style:
                                                                                GoogleFonts.montserrat(fontSize: 14))),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.add),
                                                Text('Add Standard Set', style: GoogleFonts.montserrat()),
                                              ],
                                            ),
                                            color: Colors.black45,
                                            textColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color: Colors.amber[800])),
                                          ),
                                          RaisedButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Container(
                                                      height: 450,
                                                      color: Colors.black12,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 16.0,
                                                                    right: 16.0,
                                                                    bottom:
                                                                        12.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Heading2(
                                                                    exerciseScreenProvider
                                                                        .currentExercise.name),
                                                                Heading3('Set ' +
                                                                    (1 + exerciseScreenProvider.setCountPerExerciseList[exerciseScreenProvider.exercises.indexOf(exerciseScreenProvider.currentExercise)])
                                                                        .toString()),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                  width: 20),
                                                              Heading3(
                                                                  'Please select your training principle'),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 32.0,
                                                                    right: 32),
                                                            child: Container(
                                                              height: 200,
                                                              child: ListView
                                                                  .builder(
                                                                itemCount:
                                                                    trainingPrincipleList
                                                                        .length,
                                                                itemBuilder:
                                                                    (BuildContext
                                                                            context,
                                                                        int index) {
                                                                  return ListTile(
                                                                    leading: Text(
                                                                        trainingPrincipleList[index]
                                                                            .name),
                                                                    subtitle: Text(
                                                                        trainingPrincipleList[index]
                                                                            .description),
                                                                    trailing:
                                                                        Checkbox(
                                                                      value: exerciseScreenProvider
                                                                          .isChecked(
                                                                              trainingPrincipleList[index]),
                                                                      onChanged:
                                                                          (value) {
                                                                        exerciseScreenProvider
                                                                            .changeTrainingPrinciple(trainingPrincipleList[index]);
                                                                      },
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        16.0),
                                                                child:
                                                                    FlatButton(
                                                                        color: Colors.amber[
                                                                            800],
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child: Text(
                                                                            'Close',
                                                                            style:
                                                                                GoogleFonts.montserrat(fontSize: 14))),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        16.0),
                                                                child:
                                                                    FlatButton(
                                                                        color: Colors.amber[
                                                                            800],
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          exerciseScreenProvider
                                                                              .incrementSetCounter(
                                                                            exerciseScreenProvider.currentExercise,
                                                                          );
                                                                          exerciseScreenProvider.setSetRepsWeightandRPE(
                                                                              exerciseScreenProvider.currentExercise,
                                                                              exerciseScreenProvider.selectedPrinciple.name,
                                                                              exerciseScreenProvider.weightStartingValue.toInt(), 0);
                                                                        },
                                                                        child: Text(
                                                                            'Save Entry',
                                                                            style:
                                                                                GoogleFonts.montserrat(fontSize: 14))),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.add),
                                                Text('Add Advanced Set', style: GoogleFonts.montserrat()),
                                              ],
                                            ),
                                            color: Colors.black45,
                                            textColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color: Colors.amber[800])),
                                          ),
                                        ],
                                      );
                                    }

                                    return RaisedButton(

                                      onPressed: () {
                                        //exerciseScreenProvider.addSet(exerciseScreenProvider.currentExercise);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Set ' + index.toString(), style: GoogleFonts.montserrat()),
                                          Text('Reps: ' + exerciseScreenProvider.workoutSetList[exerciseScreenProvider.currentExercise][index - 1][0].substring(0, exerciseScreenProvider.workoutSetList[exerciseScreenProvider.currentExercise][index - 1][0].length - 2), style: GoogleFonts.montserrat()),
                                          Text('Weight: ' + exerciseScreenProvider.workoutSetList[exerciseScreenProvider.currentExercise][index - 1][1].toString() + ' kg', style: GoogleFonts.montserrat()),
                                          Text('RPE: ' + exerciseScreenProvider.workoutSetList[exerciseScreenProvider.currentExercise][index - 1][2].toString() + ' / 10', style: GoogleFonts.montserrat()),


                                        ],
                                      ),
                                      color: Colors.amber[800],
                                      textColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Colors.amber[800])),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height * .06,
                  decoration: new BoxDecoration(
                    color: Colors.black12,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: this.workoutExercises.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.amber[800])),
                          onPressed: () {
                            exerciseScreenProvider.setCurrentExercise(
                                this.workoutExercises[index]);
                          },
                          color: exerciseScreenProvider.currentExercise.name !=
                                  this.workoutExercises[index].name
                              ? Colors.black26
                              : Colors.amber[800],
                          textColor: Colors.white,
                          child: Text(
                              this.workoutExercises[index].name.toUpperCase(),
                              style: GoogleFonts.montserrat(fontSize: 12)),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: RaisedButton(
                      color: Colors.black26,
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(18.0),
                             side: BorderSide(color: Colors.amber[800])),
                         //TODO save workout should push workout to library, asks if want to mark as complete
                         child: Text('Log Workout', style: GoogleFonts.montserrat(),),
                         onPressed: (){
                            // exerciseScreenProvider.logWorkout(exerciseScreenProvider.workoutSetList);
                            //
                            // Navigator.of(context).pop();
                            // Navigator.of(context).pop();

                           showDialog<String>(
                             context: context,
                             builder: (BuildContext context) => AlertDialog(
                               title: const Text('Log and Exit'),
                               content: const Text('Do you want to save your stats and exit?'),
                               actions: <Widget>[
                                 TextButton(
                                   onPressed: () => Navigator.pop(context, 'Cancel'),
                                   child: Text('Cancel', style: GoogleFonts.montserrat(color: Colors.amber.shade900),),
                                 ),
                                 TextButton(
                                   onPressed: (){
                                     exerciseScreenProvider.logWorkout(exerciseScreenProvider.workoutSetList);
                                     Navigator.of(context).pop();
                                     Navigator.of(context).pop();
                                     Navigator.of(context).pop();
                                   },
                                   child: Text('Yes', style: GoogleFonts.montserrat(color: Colors.amber.shade900)),
                                 ),
                               ],
                             ),
                           );
                         },
                       ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
