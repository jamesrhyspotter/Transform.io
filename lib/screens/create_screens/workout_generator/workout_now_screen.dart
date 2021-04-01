
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:transform_dot_io/components/heading2.dart';
import 'package:transform_dot_io/components/heading3.dart';
import 'package:transform_dot_io/components/pillButtonRow.dart';
import 'package:transform_dot_io/providers/create_workout_provider.dart';
import 'package:transform_dot_io/screens/create_screens/workout_generator/preview_workout_screen.dart';




class WorkoutNowScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
        create: (_) => WorkoutScreenProvider(),
      child: Consumer<WorkoutScreenProvider>(
        builder: (context, workoutProvider, child){
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                thickness: 1.0,
              ),
              Heading2('Workout Now'),
              Heading3('Select Muscle Groups'),
              PillButtonRow(workoutProvider.muscleGroupList),
              Heading3('Select Discipline'),
              PillButtonRow(workoutProvider.disciplinesList),
              Heading3('Select Equipment'),
              PillButtonRow(workoutProvider.equipmentList),
              Heading3('Difficulty'),
              Slider(
                value: workoutProvider.sliderValue,
                activeColor: Colors.amber[800],
                divisions: 6,
                min: 1,
                max: 5,
                onChanged: (value){
                  workoutProvider.setSlider(value);
              },
              ),
              Divider(
                thickness: 1.0,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RaisedButton(
                          child: Text('Generate Workout', style: GoogleFonts.montserrat(fontSize: 14)),
                          color: Colors.amber[800],
                          onPressed: (){
                          if(workoutProvider.selectedMuscleList.isNotEmpty || workoutProvider.disciplinesList.isNotEmpty || workoutProvider.equipmentList.isNotEmpty){
                            workoutProvider.createWorkout();
                            Navigator.push(context, PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => PreviewWorkoutScreen(workoutProvider.generatedWorkout),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                var begin = Offset(0.0, 1.0);
                                var end = Offset.zero;
                                var curve = Curves.easeInBack;

                                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                              //
                            )
                            );
                          }
                        },
                        ),
                  ),
              ],
            ),
            ]
          );
        },
      ),
    );
  }

}

