
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:transform_dot_io/components/heading2.dart';
import 'package:transform_dot_io/components/heading3.dart';
import 'package:transform_dot_io/components/pillButtonRow.dart';
import 'package:transform_dot_io/providers/workout_preferences_provider.dart';
import 'package:transform_dot_io/providers/physique_screen_provider.dart';
import 'package:transform_dot_io/screens/create_screens/workout_generator/preview_workout_screen.dart';




class WorkoutPreferenceScreen extends StatelessWidget {

  List<String> muscleList = [];

  WorkoutPreferenceScreen(this.muscleList);


  @override
  Widget build(BuildContext context) {

//MULTIPROVIDER IS REDUNDANT
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PhysiqueScreenProvider>(create: (_) => PhysiqueScreenProvider()),
        ChangeNotifierProvider<WorkoutPreferencesProvider>(create: (_) => WorkoutPreferencesProvider()),
      ],
      child: Consumer<PhysiqueScreenProvider>(
        builder: (context, screenProvider, child){
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  thickness: 1.0,
                ),
                Heading2('Workout Preferences'),
                // Heading3('Select Muscle Groups'),
                // PillButtonRow(workoutProvider.muscleGroupList),
                Heading3('Select Discipline'),
                PillButtonRow(screenProvider.disciplinesList),
                Heading3('Select Equipment'),
                PillButtonRow(screenProvider.equipmentList),
                Heading3('Difficulty'),
                Slider(
                  value: screenProvider.sliderValue,
                  activeColor: Colors.amber[800],
                  divisions: 6,
                  min: 1,
                  max: 5,
                  onChanged: (value){
                    screenProvider.setSlider(value);
                  },
                ),
                Divider(
                  thickness: 1.0,
                ),
                Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0, bottom: 24),
                          child: RaisedButton(
                            child: Text('Go', style: GoogleFonts.montserrat(fontSize: 14)),
                            color: Colors.amber[800],
                            onPressed: (){
                              screenProvider.generateWorkout(this.muscleList);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => PreviewWorkoutScreen(screenProvider.generatedWorkout)));
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

