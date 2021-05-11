import 'package:flutter/material.dart';
import 'package:transform_dot_io/assets/muscle_icons.dart';
import 'package:transform_dot_io/models/ExerciseModel.dart';
import 'dart:math';

class ExerciseDataBase {



  List<Exercise> chestExerciseList=[

    //Barbell
    Exercise('Bench Press', ['Chest', 'Shoulders', 'Triceps'], ['Barbell']),
    Exercise('Incline Bench Press', ['Chest', 'Shoulders', 'Triceps'], ['Barbell']),
    Exercise('Decline Bench Press', ['Chest', 'Shoulders', 'Triceps'], ['Barbell']),
    Exercise('Landmine Press', ['Chest', 'Shoulders', 'Triceps'], ['Barbell']),

    //Dumbbell
    Exercise('Dumbbell Bench Press', ['Chest', 'Shoulders', 'Triceps'], ['Dumbbell']),
    Exercise('Neutral Grip Dumbbell Bench Press', ['Chest', 'Shoulders', 'Triceps'], ['Dumbbell']),
    Exercise('Close Grip Dumbbell Bench Press', ['Chest', 'Shoulders', 'Triceps'], ['Dumbbell']),
    Exercise('Incline Dumbbell Press', ['Chest', 'Shoulders', 'Triceps'], ['Dumbbell']),
    Exercise('Decline Dumbbell Press', ['Chest', 'Shoulders', 'Triceps'], ['Dumbbell']),

    //Bodyweight
    Exercise('Dips', ['Chest', 'Shoulders', 'Triceps'], ['Bodyweight']),
    Exercise('Push Ups', ['Chest', 'Shoulders', 'Triceps'], ['Bodyweight']),
    Exercise('Incline Push Ups', ['Chest', 'Shoulders', 'Triceps'], ['Bodyweight']),
    Exercise('Decline Push Ups', ['Chest', 'Shoulders', 'Triceps'], ['Bodyweight']),
    Exercise('Diamond Push Ups', ['Chest', 'Shoulders', 'Triceps'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Banded Push Ups', ['Chest', 'Shoulders', 'Triceps'], ['Resistance Bands']),
    Exercise('Banded Flies', ['Chest'], ['Resistance Bands']),
    Exercise('Banded Chest Press', ['Chest', 'Triceps'],  ['Resistance Bands']),
    Exercise('Banded Cross Body Chest Press', ['Chest'],  ['Resistance Bands']),


    //Machines
    Exercise('Chest Press Machine', ['Chest', 'Shoulders', 'Triceps'], ['Machines']),
    Exercise('Smith Machine Bench Press', ['Chest', 'Shoulders', 'Triceps'], ['Machines']),
    Exercise('Smith Machine Incline Bench Press', ['Chest', 'Shoulders', 'Triceps'], ['Machines']),
    Exercise('Smith Machine Decline Bench Press', ['Chest', 'Shoulders', 'Triceps'], ['Machines']),
    Exercise('Smith Machine Bench Press', ['Chest', 'Shoulders', 'Triceps'], ['Machines']),
  ];
  List<Exercise> backExerciseList=[

    //Barbell
    Exercise('Barbell Rows', ['Back', 'Biceps'], ['Barbell']),
    Exercise('Deadlifts', ['Back', 'Hamstrings','Forearms', 'Shoulders'], ['Barbell']),
    Exercise('Rack Pulls', ['Back', 'Forearms', 'Shoulders'], ['Barbell']),
    Exercise('Landmine Rows', ['Back', 'Biceps', 'Shoulders'], ['Barbell']),
    Exercise('Pendlay Rows', ['Back', 'Biceps', 'Forearms', 'Shoulders'], ['Barbell']),
    //Dumbbell
    Exercise('Single Dumbbell Rows', ['Back', 'Biceps'], ['Dumbbell']),
    Exercise('Dumbbell Bent-Over Rows', ['Back', 'Biceps'], ['Dumbbell']),
    Exercise('Laying Dumbbell Rows', ['Back', 'Biceps'], ['Dumbbell']),
    Exercise('Dumbbell Pull Overs', ['Back', 'Chest'], ['Dumbbell']),
    Exercise('Dumbbell Deadlifts', ['Back', 'Hamstrings'], ['Dumbbell']),
    //Bodyweight
    Exercise('Pull Ups', ['Back', 'Biceps'], ['Bodyweight']),
    Exercise('Chin Ups', ['Back', 'Biceps'], ['Bodyweight']),
    Exercise('Body Rows', ['Back', 'Biceps'], ['Bodyweight']),
    Exercise('Laying Elbow Pushes', ['Back'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Banded Bent-Over Row', ['Back', 'Biceps'], ['Resistance Bands']),
    Exercise('Banded Deadlifts', ['Back', 'Hamstrings'], ['Resistance Bands']),
    Exercise('Single-Arm Banded Row', ['Back', 'Biceps'], ['Resistance Bands']),
    Exercise('Banded Lat Pull Downs', ['Back', 'Biceps'], ['Resistance Bands']),
    Exercise('Banded Straight Arm Pull Downs', ['Back'], ['Resistance Bands']),
    //Machines
    Exercise('Lat Pull Downs', ['Back', 'Biceps'],['Machines']),
    Exercise('Reverse Grip Lat Pull Downs', ['Back', 'Biceps'],['Machines']),
    Exercise('Neutral Grip Lat Pull Downs', ['Back', 'Biceps'],['Machines']),
    Exercise('Cable Straight Arm Pull Downs', ['Back', 'Biceps'],['Machines']),
    Exercise('Seated Cable Rows', ['Back', 'Biceps'],['Machines']),


  ];
  // List<Exercise> shoulderExerciseList=[
  //
  //   //Barbell
  //   Exercise('Barbell Shoulder Press', ['Shoulders', 'Triceps'], ['Barbell']),
  //   Exercise('Barbell Shoulder Cleans', ['Shoulders', 'Triceps'], ['Barbell']),
  //   Exercise('Barbell Upright Rows', ['Shoulders'], ['Barbell']),
  //   Exercise('Barbell Front Raises', ['Shoulders'], ['Barbell']),
  //
  //   //Dumbbell
  //   Exercise('Dumbbell Shoulder Press', ['Shoulders', 'Triceps'], ['Dumbbell']),
  //   Exercise('Arnold Press', ['Shoulders', 'Triceps'], ['Dumbbell']),
  //   Exercise('Dumbbell Side Raises', ['Shoulders'], ['Dumbbell']),
  //   Exercise('Dumbbell Front Raises', ['Shoulders'], ['Dumbbell']),
  //   Exercise('Dumbbell Hammer Curls to Side Raises', ['Shoulders', 'Biceps'], ['Dumbbell']),
  //
  //   //Bodyweight
  //   Exercise('Pike Push Ups', ['Shoulders', 'Triceps', 'Chest'], ['Bodyweight']),
  //   Exercise('Feet Raised Pike Push Ups', ['Shoulders', 'Triceps', 'Chest'], ['Bodyweight']),
  //   Exercise('Pike Holds', ['Shoulders', 'Triceps', 'Chest'], ['Bodyweight']),
  //   Exercise('Straight Arm Plank', ['Shoulders', 'Abs', 'Triceps', 'Chest'], ['Bodyweight']),
  //   Exercise('Handstands', ['Shoulders', 'Triceps', 'Abs'], ['Bodyweight']),
  //
  //   //Resistance Bands
  //   Exercise('Banded Shoulder Press', ['Shoulders', 'Triceps'], ['Resistance Bands']),
  //   Exercise('Seated Banded Shoulder Press', ['Shoulders', 'Triceps'], ['Resistance Bands']),
  //   Exercise('Single Arm Banded Shoulder Press', ['Shoulders', 'Triceps'], ['Resistance Bands']),
  //   Exercise('Banded Arnold Press', ['Shoulders', 'Triceps'], ['Resistance Bands']),
  //   Exercise('Banded Side Raises', ['Shoulders'], ['Resistance Bands']),
  //   Exercise('Banded Front Raises', ['Shoulders'], ['Resistance Bands']),
  //
  //   //Machines
  //   Exercise('Shoulder Press Machine', ['Shoulders', 'Triceps'], ['Machines']),
  //   Exercise('Smith Machine Shoulder Press', ['Shoulders', 'Triceps'], ['Machines']),
  //   Exercise('Shoulder Press Machine', ['Shoulders', 'Triceps'], ['Machines']),
  //   Exercise('Cable Side Raises', ['Shoulders'], ['Machines']),
  //   Exercise('Cable Front Raises', ['Shoulders'], ['Machines']),
  //   Exercise('Cable Reverse Flies', ['Shoulders'], ['Machines']),
  // ];

  List<Exercise> frontDeltsExerciseList = [
    //Barbell
    Exercise('Barbell Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Barbell']),
    Exercise('Barbell Front Raises', ['Anterior Deltoids'], ['Barbell']),

    //Dumbbell
    Exercise('Dumbbell Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Dumbbell']),
    Exercise('Arnold Press', ['Anterior Deltoids', 'Triceps'], ['Dumbbell']),
    Exercise('Dumbbell Front Raises', ['Anterior Deltoids'], ['Dumbbell']),

    //Bodyweight
    Exercise('Pike Push Ups', ['Anterior Deltoids', 'Triceps', 'Chest'], ['Bodyweight']),
    Exercise('Feet Raised Pike Push Ups', ['Anterior Deltoids', 'Triceps', 'Chest'], ['Bodyweight']),
    Exercise('Pike Holds', ['Anterior Deltoids', 'Triceps', 'Chest'], ['Bodyweight']),
    Exercise('Straight Arm Plank', ['Anterior Deltoids', 'Abs', 'Triceps', 'Chest'], ['Bodyweight']),
    Exercise('Handstands', ['Anterior Deltoids', 'Triceps', 'Abs'], ['Bodyweight']),

  //Resistance Bands
    Exercise('Banded Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Resistance Bands']),
    Exercise('Seated Banded Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Resistance Bands']),
    Exercise('Single Arm Banded Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Resistance Bands']),
    Exercise('Banded Arnold Press', ['Anterior Deltoids', 'Triceps'], ['Resistance Bands']),
    Exercise('Banded Front Raises', ['Anterior Deltoids'], ['Resistance Bands']),

    //Machines
    Exercise('Shoulder Press Machine', ['Anterior Deltoids', 'Triceps'], ['Machines']),
    Exercise('Smith Machine Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Machines']),
    Exercise('Shoulder Press Machine', ['Anterior Deltoids', 'Triceps'], ['Machines']),
    Exercise('Cable Front Raises', ['Anterior Deltoids'], ['Machines']),
  ];

  List<Exercise> sideDeltsExerciseList = [
    //Barbell
    Exercise('Barbell Shoulder Cleans', ['Lateral Deltoids', 'Triceps'], ['Barbell']),
    Exercise('Barbell Upright Rows', ['Lateral Deltoids'], ['Barbell']),
    Exercise('Barbell Side Raises', ['Lateral Deltoids'], ['Barbell']),

    //Dumbbell
    Exercise('Dumbbell Side Raises', ['Lateral Deltoids'], ['Dumbbell']),
    Exercise('Dumbbell Hammer Curls to Side Raises', ['Lateral Deltoids', 'Biceps'], ['Dumbbell']),
    Exercise('Seated Side Raises', ['Lateral Deltoids'], ['Dumbbell']),
    Exercise('Laying Around the Worlds', ['Lateral Deltoids'], ['Dumbbell']),

    //Bodyweight
    Exercise('Plank to Side Plank', ['Lateral Deltoids', 'Abs'], ['Bodyweight']),
    Exercise('Side Plank', ['Lateral Deltoids', 'Abs'], ['Bodyweight']),


    //Resistance Bands
    Exercise('Banded Side Raises', ['Lateral Deltoids'], ['Resistance Bands']),
    Exercise('Banded Hammer Curls to Side Raises', ['Lateral Deltoids', 'Biceps'], ['Resistance Bands']),

    //Machines
    Exercise('Cable Side Raises', ['Lateral Deltoids'], ['Machines']),
    Exercise('Single Cable Side Raises', ['Lateral Deltoids'], ['Machines']),
    Exercise('Single Cable Hammer Curl to Side Raise Negative', ['Lateral Deltoids'], ['Machines']),
  ];

  List<Exercise> rearDeltsExerciseList = [

    //Barbell
    Exercise('Barbell Reverse Raises', ['Rear Deltoids'], ['Barbell']),

    //Dumbbell

    //Bodyweight

    //Resistance Bands

    //Machines
    Exercise('Cable Reverse Flies', ['Shoulders'], ['Machines']),
  ];













  List<Exercise> tricepsExerciseList=[

    //Barbell
    Exercise('Close Grip Bench Press', ['Triceps', 'Chest'], ['Barbell']),
    Exercise('Barbell Skullcrushers', ['Triceps'], ['Barbell']),
    Exercise('Barbell Overhead Extensions', ['Triceps'], ['Barbell']),
    //Dumbbell
    Exercise('Close Grip Dumbbell Press', ['Triceps', 'Chest'], ['Dumbbell']),
    Exercise('Dumbbell Tricep Kick Backs', ['Triceps'], ['Dumbbell']),
    Exercise('Dumbbell Overhead Extensions', ['Triceps'], ['Dumbbell']),

    //Bodyweight
    Exercise('Narrow Dips', ['Triceps', 'Chest'], ['Bodyweight']),
    Exercise('Diamond Push Ups', ['Triceps', 'Chest'], ['Bodyweight']),
    Exercise('Tiger Push Ups', ['Triceps', 'Abs'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Banded Overhead Extension', ['Triceps'], ['Resistance Bands']),
    Exercise('Single Arm Banded Overhead Extension', ['Triceps'], ['Resistance Bands']),
    Exercise('Close Grip Banded Press', ['Triceps', 'Chest'], ['Resistance Bands']),
    Exercise('Banded Tricep Push Downs', ['Triceps'], ['Resistance Bands']),

    //Machines
    Exercise('Cable Tricep Push Downs', ['Triceps'], ['Machines']),
    Exercise('Smith Machine Close Grip Press', ['Triceps'], ['Machines']),
    Exercise('Cable Skull Crushers', ['Triceps'], ['Machines']),


  ];

  List<Exercise> bicepExerciseList=[

    //Barbell
    Exercise('Barbell Curls', ['Biceps'], ['Barbell']),
    Exercise('Reverse Grip Barbell Curls', ['Biceps'], ['Barbell']),
    Exercise('Wide Grip Barbell Curls', ['Biceps'], ['Barbell']),
    Exercise('Narrow Grip Barbell Curls', ['Biceps'], ['Barbell']),

    //Dumbbell
    Exercise('Dumbbell Curls', ['Biceps'], ['Dumbbell']),
    Exercise('Hammer Curls', ['Biceps'], ['Dumbbell']),
    Exercise('Zottman Curls', ['Biceps'], ['Dumbbell']),
    Exercise('In n Out Curls', ['Biceps'], ['Dumbbell']),

    //Bodyweight
    Exercise('Close Grip Chin Ups', ['Biceps', 'Back'], ['Bodyweight']),
    Exercise('Body Curls', ['Biceps'], ['Bodyweight']),
    Exercise('Reverse Push Ups', ['Biceps', 'Chest', 'Triceps'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Banded Curls', ['Biceps'], ['Resistance Bands']),
    Exercise('Single Arm Banded Curls', ['Biceps'], ['Resistance Bands']),
    Exercise('Single Arm Side Banded Curls', ['Biceps'], ['Resistance Bands']),
    Exercise('Banded In n Out Curls', ['Biceps'], ['Resistance Bands']),
    Exercise('Banded Concentration Curls', ['Biceps'], ['Resistance Bands']),

    //Machines
    Exercise('Cable Bicep Curls', ['Biceps'], ['Machines']),
    Exercise('Cable Hammer Curls', ['Biceps'], ['Machines']),
    Exercise('Cable Bicep Curls', ['Biceps'], ['Machines']),
    Exercise('Cable Preacher Curls', ['Biceps'], ['Machines'])


  ];
  List<Exercise> hamstringsExerciseList=[

    //Barbell
    Exercise('RDLs', ['Hamstrings', 'Back', 'Calves','Glutes'], ['Barbell']),
    Exercise('Good Mornings', ['Hamstrings', 'Glutes', 'Back'], ['Barbell']),
    Exercise('Squats', ['Hamstrings', 'Quads', 'Glutes'], ['Barbell']),
    Exercise('Barbell Lunges', ['Hamstrings', 'Quads', 'Calves', 'Glutes'], ['Barbell']),
    //Dumbbell
    Exercise('Dumbbell RDLs', ['Hamstrings', 'Back', 'Calves', 'Glutes'], ['Dumbbell']),
    Exercise('Dumbbell Single Leg RDLs', ['Hamstrings', 'Back', 'Calves', 'Glutes'], ['Dumbbell']),
    Exercise('Dumbbell Lunges', ['Hamstrings', 'Quads', 'Calves', 'Glutes'], ['Dumbbell']),
    Exercise('Dumbbell Bulgarian Split Squats', ['Hamstrings', 'Quads', 'Calves', 'Glutes'], ['Dumbbell']),
    Exercise('Dumbbell Hamstring Curls', ['Hamstrings', 'Glutes'], ['Dumbbell']),

    //Bodyweight
    Exercise('Nordic Curls', ['Hamstrings', 'Calves', 'Core', 'Glutes'], ['Bodyweight']),
    Exercise('Bodyweight Lunges', ['Hamstrings', 'Quads', 'Calves', 'Glutes'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Banded RDLs', ['Hamstrings', 'Back', 'Glutes'], ['Resistance Bands']),
    Exercise('Banded Hamstring Curls', ['Hamstrings', 'Glutes'], ['Resistance Bands']),
    Exercise('Banded Good Mornings', ['Hamstrings', 'Back', 'Glutes'], ['Resistance Bands']),
    //Machines
    Exercise('Laying Hamstring Curls', ['Hamstrings'], ['Machines']),
    Exercise('Seated Hamstring Curls', ['Hamstrings'], ['Machines']),
    Exercise('Cable Hamstring Curls', ['Hamstrings'], ['Machines']),
    Exercise('Reverse Hack Squats', ['Hamstrings', 'Quads'], ['Machines']),

  ];
  List<Exercise> quadsExerciseList=[

    //Barbell
    Exercise('Front Squats', ['Quads', 'Hamstrings', 'Glutes'], ['Barbell']),
    Exercise('Zerker Squats', ['Quads', 'Hamstrings', 'Glutes'], ['Barbell']),
    Exercise('Barbell Lunges', ['Quads', 'Hamstring', 'Glutes'], ['Barbell']),

    //Dumbbell
    Exercise('Goblet Squats', ['Quads', 'Glutes', 'Hamstrings'], ['Dumbbell']),
    Exercise('Dumbbell Hack Squats', ['Quads', 'Glutes', 'Hamstrings'], ['Dumbbell']),
    Exercise('Dumbbell Front Squats', ['Quads', 'Glutes', 'Hamstrings'], ['Dumbbell']),

    //Bodyweight
    Exercise('Bodyweight Bulgarian Split Squats', ['Quads', 'Glutes', 'Hamstrings'], ['Bodyweight']),
    Exercise('Sissy Squats', ['Quads'], ['Bodyweight']),
    Exercise('Bodyweight Leg Extensions', ['Quads', 'Hamstrings'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Banded Leg Extensions', ['Quads'], ['Resistance Bands']),
    Exercise('Banded Front Squats', ['Quads'], ['Resistance Bands']),
    Exercise('Banded Squats', ['Quads'], ['Resistance Bands']),

    //Machines
    Exercise('Leg Extensions', ['Quads'], ['Machines']),
    Exercise('Close Feet Smith Machine Squats', ['Quads'], ['Machines']),
    Exercise('Hack Squats', ['Quads', 'Hamstrings'], ['Machines']),

  ];
  List<Exercise> glutesExerciseList=[

    //Barbell
    Exercise('Barbell Hip Thrusts', ['Glutes', 'Hamstrings'], ['Barbell']),
    Exercise('Barbell Glute Bridges', ['Glutes', 'Hamstrings'], ['Barbell']),

    //Dumbbell
    Exercise('Dumbbell Hip Thrusts', ['Glutes', 'Hamstrings'], ['Barbell']),

    //Bodyweight
    Exercise('Bodyweight Hip Thrusts', ['Glutes'], ['Bodyweight']),
    Exercise('Bodyweight Single Leg Hip Thrusts', ['Glutes'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Banded Hip Thrusts', ['Glutes'], ['Resistance Bands']),
    Exercise('Banded Single Leg Hip Thrusts', ['Glutes'], ['Resistance Bands']),

    //Machines
    Exercise('Cable Kick Backs', ['Glutes'], ['Machines']),
    Exercise('Cable Leg Side Raises', ['Glutes'], ['Machines']),

  ];
  List<Exercise> calvesExerciseList=[

    //Barbell
    Exercise('Barbell Calf Raises', ['Calves'], ['Barbell']),

    //Dumbbell
    Exercise('Dumbbell Calf Raises', ['Calves'], ['Barbell']),

    //Bodyweight
    Exercise('Single Leg Calve Raises', ['Calves'], ['Bodyweight']),
    Exercise('Bodyweight Calf Raises', ['Calves'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Resistance Band Calf Raises', ['Calves'], ['Resistance Bands']),
    Exercise('Single Leg Resistance Band Calf Raises', ['Calves'], ['Resistance Bands']),

    //Machines
    Exercise('Seated Calf Raise Machine', ['Calves'], ['Machines']),
    Exercise('Smith Machine Calf Raises', ['Calves'], ['Machines']),


  ];
  List<Exercise> forearmExerciseList=[

    //Barbell
    Exercise('Barbell Wrist Flexions', ['Forearms'], ['Barbell']),

    //Dumbbell
    Exercise('Dumbbell Wrist Flexions', ['Forearms'], ['Dumbbell']),
    //Bodyweight
    Exercise('Bodyweight Hangs', ['Forearms'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Resistance Wrist Flexions', ['Forearms'], ['Resistance Bands'],),

    //Machines
    Exercise('Cable Wrist Flexions', ['Forearms'], ['Machines'],),

  ];
  List<Exercise> absExerciseList=[

    //Barbell
    Exercise('Barbell Sit Ups', ['Abs'], ['Barbell']),
    Exercise('Barbell Roll Outs', ['Abs'], ['Barbell']),
    Exercise('Barbell Rowers', ['Abs'], ['Barbell']),


    //Dumbbell
    Exercise('Dumbbell Russian Twists', ['Abs'], ['Dumbbell']),
    Exercise('Dumbbell Leg Raises', ['Abs'], ['Dumbbell']),
    Exercise('Dumbbell Knee Raises', ['Abs'], ['Dumbbell']),

    //Bodyweight
    Exercise('Russian Twists', ['Abs'], ['Bodyweight']),
    Exercise('Crunches', ['Abs'], ['Bodyweight']),
    Exercise('Sit Ups', ['Abs'], ['Bodyweight']),
    Exercise('Sit Up with Twists', ['Abs'], ['Bodyweight']),
    Exercise('Heel Taps', ['Abs'], ['Bodyweight']),
    Exercise('Deadbug Crunches', ['Abs'], ['Bodyweight']),
    Exercise('Deadbug Twists', ['Abs'], ['Bodyweight']),
    Exercise('Leg Raises', ['Abs'], ['Bodyweight']),
    Exercise('Hanging Leg Raises', ['Abs'], ['Bodyweight']),
    Exercise('Flutter Kicks', ['Abs'], ['Bodyweight']),
    Exercise('In n Outs', ['Abs'], ['Bodyweight']),
    Exercise('V Sits', ['Abs'], ['Bodyweight']),
    Exercise('Reverse Crunches', ['Abs'], ['Bodyweight']),
    Exercise('Reverse Crunches to Straight Legs', ['Abs'], ['Bodyweight']),
    Exercise('L Sits', ['Abs'], ['Bodyweight']),
    Exercise('L Sit Side-to-Sides', ['Abs'], ['Bodyweight']),
    Exercise('Plank', ['Abs'], ['Bodyweight']),
    Exercise('Plank Twists', ['Abs'], ['Bodyweight']),
    Exercise('Side Plank', ['Abs'], ['Bodyweight']),
    Exercise('Commando Plank', ['Abs'], ['Bodyweight']),
    Exercise('Tiger Plank', ['Abs'], ['Bodyweight']),
    Exercise('Mountain Climbers', ['Abs'], ['Bodyweight']),
    Exercise('Straight Arm Plank', ['Abs'], ['Bodyweight']),


    //Resistance Bands
    Exercise('Banded Cable Crunches', ['Abs'], ['Resistance Bands']),
    Exercise('Banded Straight Arm Plank', ['Abs'], ['Resistance Bands']),
    Exercise('Banded Woodchoppers', ['Abs'], ['Resistance Bands']),

    //Machines
    Exercise('Cable Crunches', ['Abs'], ['Machines']),
    Exercise('Reverse Cable Crunches', ['Abs'], ['Machines']),
    Exercise('Cable Wood Choppers', ['Abs'], ['Machines']),
  ];


  List<Exercise> trapsExerciseList = [
    //Barbell
    Exercise('Barbell Shrugs', ['Traps'], ['Barbell']),
    Exercise('Reverse Barbell Shrugs', ['Traps'], ['Barbell']),


    //Dumbbell
    Exercise('Dumbbell Shrugs', ['Traps'], ['Dumbbell']),
    Exercise('Farmer walks', ['Traps'], ['Dumbbell']),

    //Bodyweight
    Exercise('Hanging Shrugs', ['Traps'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Resistance Band Face Pulls', ['Traps'], ['Resistance Bands']),

    //Machines
    Exercise('Smith Machine Shrugs', ['Traps'], ['Machines']),
    Exercise('Cable Shrugs', ['Traps'], ['Machines']),
    Exercise('Cable Face Pulls', ['Traps'], ['Machines']),

  ];



  //METHODS --------------------------------------------------------------------

  List<Exercise> getExercises(int amount, List<String> muscleGroup, List<String> equipment){

    List<Exercise> outputList = [];

    for (int i = 0; i < muscleGroup.length; i++){

      List<Exercise> contenderExercises = [];
      List<Exercise> selectedExerciseList = [];
      String ex = muscleGroup[i].toLowerCase();

      if (ex == 'chest') {
        selectedExerciseList = chestExerciseList;
      } else if (ex == 'lats') {
        selectedExerciseList = backExerciseList;
      } else if (ex == 'front delts') {
        selectedExerciseList = frontDeltsExerciseList;
      } else if (ex == 'side delts') {
        selectedExerciseList = sideDeltsExerciseList;
      } else if (ex == 'rear delts and rhomboids') {
        selectedExerciseList = rearDeltsExerciseList;
      } else if (ex == 'biceps') {
        selectedExerciseList = bicepExerciseList;
      } else if (ex == 'triceps') {
        selectedExerciseList = tricepsExerciseList;
      } else if (ex == 'forearms') {
        selectedExerciseList = forearmExerciseList;
      } else if (ex == 'abs') {
        selectedExerciseList = absExerciseList;
      } else if (ex == 'quads') {
        selectedExerciseList = quadsExerciseList;
      } else if (ex == 'hamstrings') {
        selectedExerciseList = hamstringsExerciseList;
      } else if (ex == 'glutes') {
        selectedExerciseList = glutesExerciseList;
      } else if (ex == 'calves') {
        selectedExerciseList = calvesExerciseList;
      } else if (ex == 'traps'){
        selectedExerciseList = trapsExerciseList;
      }

      //Filter through selected exercises by equipment
      for(int j = 0; j < selectedExerciseList.length; j++){
        if(equipment.contains(selectedExerciseList[j].equipment[0])){
          contenderExercises.add(selectedExerciseList[j]);
        }
      }

      //Select N Amount of Exercises from contender exercises
      for(int k = 0; k < amount; k++){
        Random random = new Random();
        int randomIndex = random.nextInt(contenderExercises.length);
        Exercise inputExercise = contenderExercises[randomIndex];

        while(outputList.contains(inputExercise)){
          Random random = new Random();
          int randomIndex = random.nextInt(contenderExercises.length);
          inputExercise = contenderExercises[randomIndex];
        }

        outputList.add(inputExercise);
      }
    }

    return outputList;
  }



}




