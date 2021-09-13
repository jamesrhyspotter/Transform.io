import 'package:flutter/material.dart';
import 'package:transform_dot_io/assets/muscle_icons.dart';
import 'package:transform_dot_io/models/exercise_model.dart';
import 'dart:math';

class ExerciseDataBase {




  List<Exercise> chestExerciseList=[

    //Barbell
    Exercise('Bench Press', ['Chest', 'Shoulders', 'Triceps'], ['Barbell'],),
    Exercise('Incline Bench Press', ['Chest', 'Shoulders', 'Triceps'], ['Barbell']),
    Exercise('Decline Bench Press', ['Chest', 'Shoulders', 'Triceps'], ['Barbell']),
    Exercise('Landmine Press', ['Chest', 'Shoulders', 'Triceps'], ['Barbell']),
    Exercise('Barbell Floor Press', ['Chest', 'Shoulders', 'Triceps'], ['Barbell']),

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
    Exercise('Resistance Band Single Arm Incline Flies', ['Chest'],  ['Resistance Bands']),


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
    Exercise('Straight Arm Plank Leans', ['Back', 'Forearms', 'Abs'], ['Bodyweight']),

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


  List<Exercise> frontDeltsExerciseList = [
    //Barbell
    Exercise('Barbell Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Barbell']),
    Exercise('Barbell Front Raises', ['Anterior Deltoids'], ['Barbell']),
    Exercise('Military Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Barbell']),
    Exercise('Deadstop Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Barbell']),
    Exercise('Barbell Landmine Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Barbell']),


    //Dumbbell
    Exercise('Dumbbell Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Dumbbell']),
    Exercise('Arnold Press', ['Anterior Deltoids', 'Triceps'], ['Dumbbell']),
    Exercise('Dumbbell Front Raises', ['Anterior Deltoids'], ['Dumbbell']),
    Exercise('Dumbbell Hammer Curls to Side Raises', ['Anterior Deltoids', 'Biceps'], ['Dumbbell']),
    Exercise('Goblet Press', ['Anterior Deltoids', 'Triceps'], ['Dumbbell']),

    //Bodyweight
    Exercise('Pike Push Ups', ['Anterior Deltoids', 'Triceps', 'Chest'], ['Bodyweight']),
    Exercise('Feet Raised Pike Push Ups', ['Anterior Deltoids', 'Triceps', 'Chest'], ['Bodyweight']),
    Exercise('Pike Holds', ['Anterior Deltoids', 'Triceps', 'Chest'], ['Bodyweight']),
    Exercise('Straight Arm Plank', ['Anterior Deltoids', 'Abs', 'Triceps', 'Chest'], ['Bodyweight']),
    Exercise('Handstands', ['Anterior Deltoids', 'Triceps', 'Abs'], ['Bodyweight']),
    Exercise('Straight Arm Plank with Shoulder Taps', ['Anterior Deltoids', 'Abs'], ['Bodyweight']),

  //Resistance Bands
    Exercise('Banded Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Resistance Bands']),
    Exercise('Seated Banded Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Resistance Bands']),
    Exercise('Single Arm Banded Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Resistance Bands']),
    Exercise('Banded Arnold Press', ['Anterior Deltoids', 'Triceps'], ['Resistance Bands']),
    Exercise('Banded Front Raises', ['Anterior Deltoids'], ['Resistance Bands']),

    //Machines
    Exercise('Shoulder Press Machine', ['Anterior Deltoids', 'Triceps'], ['Machines']),
    Exercise('Smith Machine Shoulder Press', ['Anterior Deltoids', 'Triceps'], ['Machines']),
    Exercise('Cable Front Raises', ['Anterior Deltoids'], ['Machines']),
    Exercise('Seated Side Raise Machine', ['Anterior Deltoids'], ['Machines']),
    Exercise('Shoulder Press Machine', ['Anterior Deltoids', 'Triceps'], ['Machines']),
  ];

  List<Exercise> sideDeltsExerciseList = [
    //Barbell
    Exercise('Barbell Shoulder Cleans', ['Lateral Deltoids', 'Triceps'], ['Barbell']),
    Exercise('Barbell Upright Rows', ['Lateral Deltoids'], ['Barbell']),
    Exercise('Barbell Side Raises', ['Lateral Deltoids'], ['Barbell']),
    Exercise('Leaning Barbell Side Raises', ['Lateral Deltoids'], ['Barbell']),
    Exercise('Landmine Side Raises', ['Lateral Deltoids'], ['Barbell']),


    //Dumbbell
    Exercise('Dumbbell Side Raises', ['Lateral Deltoids'], ['Dumbbell']),
    Exercise('Dumbbell Hammer Curls to Side Raises', ['Lateral Deltoids', 'Biceps'], ['Dumbbell']),
    Exercise('Seated Side Raises', ['Lateral Deltoids'], ['Dumbbell']),
    Exercise('Laying Around the Worlds', ['Lateral Deltoids'], ['Dumbbell']),
    Exercise('Inline W Raises', ['Lateral Deltoids'], ['Dumbbell']),

    //Bodyweight
    Exercise('Plank to Side Plank', ['Lateral Deltoids', 'Abs'], ['Bodyweight']),
    Exercise('Side Plank', ['Lateral Deltoids', 'Abs'], ['Bodyweight']),
    Exercise('Side Straight Arm Plank', ['Lateral Deltoids', 'Abs'], ['Bodyweight']),
    Exercise('Side Plank with Arm Raise', ['Lateral Deltoids', 'Abs'], ['Bodyweight']),
    Exercise('Plank with Lateral Arm Raises', ['Lateral Deltoids', 'Abs'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Banded Side Raises', ['Lateral Deltoids'], ['Resistance Bands']),
    Exercise('Banded Hammer Curls to Side Raises', ['Lateral Deltoids', 'Biceps'], ['Resistance Bands']),
    Exercise('Resistance Band Upright Rows', ['Lateral Deltoids'], ['Resistance Bands']),
    Exercise('Resistance Band Seated Side Raises', ['Lateral Deltoids'], ['Resistance Bands']),
    Exercise('Cross Body Resistance Band Side Raises', ['Lateral Deltoids'], ['Resistance Bands']),

    //Machines
    Exercise('Cable Side Raises', ['Lateral Deltoids'], ['Machines']),
    Exercise('Single Cable Side Raises', ['Lateral Deltoids'], ['Machines']),
    Exercise('Single Cable Hammer Curl to Side Raise Negative', ['Lateral Deltoids'], ['Machines']),
    Exercise('Behind the neck Cable Side Raises', ['Lateral Deltoids'], ['Machines']),
    Exercise('Side Raise Machine', ['Lateral Deltoids'], ['Machines']),

  ];


  List<Exercise> rearDeltsExerciseList = [

    //Barbell
    Exercise('Barbell Reverse Raises', ['Rear Deltoids'], ['Barbell']),
    Exercise('Barbell Rear Delt Row', ['Rear Deltoids'], ['Barbell']),
    Exercise('Barbell Face Pull', ['Rear Deltoids'], ['Barbell']),
    Exercise('Snatch Grip Push Press', ['Rear Deltoids', 'Triceps'], ['Barbell']),
    Exercise('Overhead Barbell Holds', ['Rear Deltoids', 'Triceps'], ['Barbell']),


    //Dumbbell
    Exercise('Seated Dumbbell Reverse Flies', ['Rear Deltoids'], ['Dumbbell']),
    Exercise('Standing Dumbbell Reverse Flies', ['Rear Deltoids'], ['Dumbbell']),
    Exercise('Incline Dumbbell Reverse Flies', ['Rear Deltoids'], ['Dumbbell']),
    Exercise('Laying Rear Delt Circles', ['Rear Deltoids'], ['Dumbbell']),
    Exercise('Incline Dumbbell Rear Delt Row', ['Rear Deltoids'], ['Dumbbell']),


    //Bodyweight
    Exercise('Wide Reverse Plank', ['Rear Deltoids'], ['Bodyweight']),
    Exercise('Wide Grip Inverted Rear Delt Row', ['Rear Deltoids'], ['Bodyweight']),
    Exercise('Wide Grip Inverted Face Pulls', ['Rear Deltoids'], ['Bodyweight']),
    Exercise('Rings Reverse Flies', ['Rear Deltoids'], ['Bodyweight']),
    Exercise('Laying Arm Lateral Holds', ['Rear Deltoids'], ['Bodyweight']),
    Exercise('Laying Arm Circles', ['Rear Deltoids'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Resistance Band Face Pull', ['Rear Deltoids'], ['Resistance Bands']),
    Exercise('Resistance Band Rear Delt Row', ['Rear Deltoids'], ['Resistance Bands']),
    Exercise('Resistance Band Reverse Flies', ['Rear Deltoids'], ['Resistance Bands']),
    Exercise('Single Arm Resistance Band Face Pull', ['Rear Deltoids'], ['Resistance Bands']),
    Exercise('Single Arm Resistance Band Reverse Flies', ['Rear Deltoids'], ['Resistance Bands']),
    Exercise('Bent Over Resistance Band Reverse Flies', ['Rear Deltoids'], ['Resistance Bands']),

    //Machines
    Exercise('Cable Reverse Flies', ['Rear Deltoids'], ['Machines']),
    Exercise('Bent Over Cable Reverse Flies', ['Rear Deltoids'], ['Machines']),
    Exercise('Single Arm Bent Over Cable Reverse Flies', ['Rear Deltoids'], ['Machines']),
    Exercise('Reverse Flies Machine', ['Rear Deltoids'], ['Machines']),
    Exercise('Standing Rope Face Pull', ['Rear Deltoids'], ['Machines']),
    Exercise('Kneeling Rope Face Pull', ['Rear Deltoids'], ['Machines']),
    Exercise('Seated Rope Face Pull', ['Rear Deltoids'], ['Machines']),

  ];






  List<Exercise> tricepsExerciseList=[

    //Barbell
    Exercise('Close Grip Bench Press', ['Triceps', 'Chest'], ['Barbell']),
    Exercise('Barbell Skullcrushers', ['Triceps'], ['Barbell']),
    Exercise('Barbell Overhead Extensions', ['Triceps'], ['Barbell']),
    Exercise('Wide Grip Barbell Skull Crushers', ['Triceps'], ['Barbell']),
    Exercise('Narrow Grip Barbell Skull Crushers', ['Triceps'], ['Barbell']),


    //Dumbbell
    Exercise('Close Grip Dumbbell Press', ['Triceps', 'Chest'], ['Dumbbell']),
    Exercise('Dumbbell Tricep Kick Backs', ['Triceps'], ['Dumbbell']),
    Exercise('Dumbbell Overhead Extensions, Single Dumbell', ['Triceps'], ['Dumbbell']),
    Exercise('Dumbbell Overhead Extensions, Dumbell either Arm', ['Triceps'], ['Dumbbell']),
    Exercise('Dumbbell Skull Crushers', ['Triceps'], ['Dumbbell']),


    //Bodyweight
    Exercise('Narrow Dips', ['Triceps', 'Chest'], ['Bodyweight']),
    Exercise('Dips', ['Triceps', 'Chest'], ['Bodyweight']),
    Exercise('Diamond Push Ups', ['Triceps', 'Chest'], ['Bodyweight']),
    Exercise('Tiger Push Ups', ['Triceps', 'Abs'], ['Bodyweight']),
    Exercise('Commando Plank', ['Triceps', 'Abs'], ['Bodyweight']),


    //Resistance Bands
    Exercise('Banded Overhead Extension', ['Triceps'], ['Resistance Bands']),
    Exercise('Single Arm Banded Overhead Extension', ['Triceps'], ['Resistance Bands']),
    Exercise('Close Grip Banded Press', ['Triceps', 'Chest'], ['Resistance Bands']),
    Exercise('Banded Tricep Push Downs', ['Triceps'], ['Resistance Bands']),
    Exercise('Single Arm Banded Tricep Push Downs', ['Triceps'], ['Resistance Bands']),


    //Machines
    Exercise('Cable Tricep Push Downs with Straight Bar', ['Triceps'], ['Machines']),
    Exercise('Cable Tricep Push Downs with Ropes', ['Triceps'], ['Machines']),
    Exercise('Smith Machine Close Grip Press', ['Triceps'], ['Machines']),
    Exercise('Cable Skull Crushers with Rope', ['Triceps'], ['Machines']),
    Exercise('Cable Skull Crushers with Straight Bar', ['Triceps'], ['Machines']),



  ];


  List<Exercise> bicepExerciseList=[

    //Barbell
    Exercise('Barbell Curls', ['Biceps'], ['Barbell']),
    Exercise('Reverse Grip Barbell Curls', ['Biceps'], ['Barbell']),
    Exercise('Wide Grip Barbell Curls', ['Biceps'], ['Barbell']),
    Exercise('Narrow Grip Barbell Curls', ['Biceps'], ['Barbell']),
    Exercise('Barbell Preacher Curls', ['Biceps'], ['Barbell']),

    //Dumbbell
    Exercise('Dumbbell Curls', ['Biceps'], ['Dumbbell']),
    Exercise('Hammer Curls', ['Biceps'], ['Dumbbell']),
    Exercise('Zottman Curls', ['Biceps'], ['Dumbbell']),
    Exercise('In n Out Curls', ['Biceps'], ['Dumbbell']),
    Exercise('Dumbbell Preacher Curls', ['Biceps'], ['Dumbbell']),

    //Bodyweight
    Exercise('Close Grip Chin Ups', ['Biceps', 'Back'], ['Bodyweight']),
    Exercise('Body Curls', ['Biceps'], ['Bodyweight']),
    Exercise('Reverse Push Ups', ['Biceps', 'Chest', 'Triceps'], ['Bodyweight']),
    Exercise('Dive Bomber Push Ups', ['Biceps', 'Chest', 'Triceps'], ['Bodyweight']),
    Exercise('Chin Up Isometric Holds', ['Biceps', 'Chest', 'Triceps'], ['Bodyweight']),

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
    Exercise('Cable Preacher Curls', ['Biceps'], ['Machines']),
    Exercise('Preacher Curl Machine', ['Biceps'], ['Machines'])


  ];

  List<Exercise> hamstringsExerciseList=[

    //Barbell
    Exercise('RDLs', ['Hamstrings', 'Back', 'Calves','Glutes'], ['Barbell']),
    Exercise('Good Mornings', ['Hamstrings', 'Glutes', 'Back'], ['Barbell']),
    Exercise('Squats', ['Hamstrings', 'Quads', 'Glutes'], ['Barbell']),
    Exercise('Barbell Lunges', ['Hamstrings', 'Quads', 'Calves', 'Glutes'], ['Barbell']),
    Exercise('Barbell Reverse Lunges', ['Hamstrings', 'Quads', 'Calves', 'Glutes'], ['Barbell']),
    //Dumbbell
    Exercise('Dumbbell RDLs', ['Hamstrings', 'Back', 'Calves', 'Glutes'], ['Dumbbell']),
    Exercise('Dumbbell Single Leg RDLs', ['Hamstrings', 'Back', 'Calves', 'Glutes'], ['Dumbbell']),
    Exercise('Dumbbell Lunges', ['Hamstrings', 'Quads', 'Calves', 'Glutes'], ['Dumbbell']),
    Exercise('Dumbbell Bulgarian Split Squats', ['Hamstrings', 'Quads', 'Calves', 'Glutes'], ['Dumbbell']),
    Exercise('Dumbbell Hamstring Curls', ['Hamstrings', 'Glutes'], ['Dumbbell']),
    Exercise('Dumbbell Step Ups', ['Hamstrings', 'Glutes', 'Quads'], ['Dumbbell']),


    //Bodyweight
    Exercise('Nordic Curls', ['Hamstrings', 'Calves', 'Core', 'Glutes'], ['Bodyweight']),
    Exercise('Bodyweight Lunges', ['Hamstrings', 'Quads', 'Calves', 'Glutes'], ['Bodyweight']),
    Exercise('Bodyweight Reverse Lunges', ['Hamstrings', 'Quads', 'Calves', 'Glutes'], ['Bodyweight']),
    Exercise('Bodyweight Step Ups', ['Hamstrings', 'Quads', 'Calves', 'Glutes'], ['Bodyweight']),
    Exercise('Bodyweight Single Leg RDLs', ['Hamstrings', 'Quads'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Banded RDLs', ['Hamstrings', 'Back', 'Glutes'], ['Resistance Bands']),
    Exercise('Banded Hamstring Curls', ['Hamstrings', 'Glutes'], ['Resistance Bands']),
    Exercise('Banded Single Leg Hamstring Curls', ['Hamstrings', 'Glutes'], ['Resistance Bands']),
    Exercise('Banded Good Mornings', ['Hamstrings', 'Back', 'Glutes'], ['Resistance Bands']),
    Exercise('Banded Single Leg RDLs', ['Hamstrings', 'Back', 'Glutes'], ['Resistance Bands']),


    //Machines
    Exercise('Laying Hamstring Curls', ['Hamstrings'], ['Machines']),
    Exercise('Seated Hamstring Curls', ['Hamstrings'], ['Machines']),
    Exercise('Cable Hamstring Curls', ['Hamstrings'], ['Machines']),
    Exercise('Leg Press with High Foot Placement', ['Hamstrings'], ['Machines']),
    Exercise('Reverse Hack Squats', ['Hamstrings', 'Quads'], ['Machines']),

  ];


  List<Exercise> quadsExerciseList=[

    //Barbell
    Exercise('Front Squats', ['Quads', 'Hamstrings', 'Glutes'], ['Barbell']),
    Exercise('Clean to Front Squat', ['Quads', 'Hamstrings', 'Glutes'], ['Barbell']),
    Exercise('Barbell Split Squats', ['Quads', 'Hamstrings', 'Glutes'], ['Barbell']),
    Exercise('Zercher Squats', ['Quads', 'Hamstrings', 'Glutes'], ['Barbell']),
    Exercise('Zercher Split Squats', ['Quads', 'Hamstrings', 'Glutes'], ['Barbell']),
    Exercise('Barbell Lunges', ['Quads', 'Hamstring', 'Glutes'], ['Barbell']),
    Exercise('Barbell Squats', ['Quads', 'Hamstring', 'Glutes'], ['Barbell']),
    Exercise('Dorian Deadlifts', ['Quads', 'Hamstring', 'Glutes'], ['Barbell']),

    //Dumbbell
    Exercise('Goblet Squats', ['Quads', 'Glutes', 'Hamstrings'], ['Dumbbell']),
    Exercise('Dumbbell Deadlifts', ['Quads', 'Glutes', 'Hamstrings'], ['Dumbbell']),
    Exercise('Dumbbell Front Squats', ['Quads', 'Glutes', 'Hamstrings'], ['Dumbbell']),
    Exercise('Dumbbell Bulgarian Split Squats', ['Quads', 'Glutes', 'Hamstrings'], ['Dumbbell']),
    Exercise('Dumbbell Split Squats', ['Quads', 'Glutes', 'Hamstrings'], ['Dumbbell']),


    //Bodyweight
    Exercise('Bodyweight Bulgarian Split Squats', ['Quads', 'Glutes', 'Hamstrings'], ['Bodyweight']),
    Exercise('Sissy Squats', ['Quads'], ['Bodyweight']),
    Exercise('Bodyweight Leg Extensions', ['Quads', 'Hamstrings'], ['Bodyweight']),
    Exercise('Bodyweight Squat', ['Quads', 'Hamstrings'], ['Bodyweight']),
    Exercise('Bodyweight Static Wall Holds', ['Quads', 'Hamstrings'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Banded Leg Extensions', ['Quads'], ['Resistance Bands']),
    Exercise('Banded Front Squats', ['Quads'], ['Resistance Bands']),
    Exercise('Banded Squats', ['Quads'], ['Resistance Bands']),
    Exercise('Spanish Squats', ['Quads'], ['Resistance Bands']),
    Exercise('Banded Split Squats', ['Quads'], ['Resistance Bands']),

    //Machines
    Exercise('Leg Extensions', ['Quads'], ['Machines']),
    Exercise('Single Leg - Leg Extensions', ['Quads'], ['Machines']),
    Exercise('Close Feet Smith Machine Squats', ['Quads'], ['Machines']),
    Exercise('Hack Squats', ['Quads', 'Hamstrings'], ['Machines']),
    Exercise('Smith Machine Hack Squats', ['Quads', 'Hamstrings'], ['Machines']),

  ];


  List<Exercise> glutesExerciseList=[

    //Barbell
    Exercise('Barbell Hip Thrusts', ['Glutes', 'Hamstrings'], ['Barbell']),
    Exercise('Barbell Glute Bridges', ['Glutes', 'Hamstrings'], ['Barbell']),
    Exercise('Sumo Bulgarian Deadlift', ['Glutes', 'Hamstrings'], ['Barbell']),
    Exercise('Barbell Sumo RDLs', ['Glutes', 'Hamstrings'], ['Barbell']),
    Exercise('Barbell Single Leg RDLs', ['Glutes', 'Hamstrings'], ['Barbell']),

    //Dumbbell
    Exercise('Dumbbell Hip Thrusts', ['Glutes', 'Hamstrings'], ['Dumbbell']),
    Exercise('Dumbbell Glute Bridges', ['Glutes', 'Hamstrings'], ['Dumbbell']),
    Exercise('Dumbbell Deficit Reverse Lunge', ['Glutes', 'Hamstrings'], ['Dumbbell']),
    Exercise('Dumbbell Single Leg RDL', ['Glutes', 'Hamstrings'], ['Dumbbell']),
    Exercise('Dumbbell Laying Side Clam', ['Glutes', 'Hamstrings'], ['Dumbbell']),
    Exercise('Dumbbell Step Up', ['Glutes', 'Hamstrings'], ['Dumbbell']),

    //Bodyweight
    Exercise('Bodyweight Hip Thrusts', ['Glutes'], ['Bodyweight']),
    Exercise('Bodyweight Single Leg Hip Thrusts', ['Glutes'], ['Bodyweight']),
    Exercise('Bodyweight Single Leg Hip Thrusts, Leg Tucked', ['Glutes'], ['Bodyweight']),
    Exercise('Supermans', ['Glutes', 'Lower Back'], ['Bodyweight']),
    Exercise('Bodyweight Donkey Kick Backs', ['Glutes'], ['Bodyweight']),
    Exercise('Laying Side Clam', ['Glutes', 'Hamstrings'], ['Bodyweight']),
    Exercise('Single Leg Bulgarian Deadlift', ['Glutes', 'Hamstrings'], ['Bodyweight']),
    Exercise('Reverse Table Up', ['Glutes', 'Hamstrings'], ['Bodyweight']),
    Exercise('Bodyweight Squat Jumps', ['Glutes', 'Hamstrings', 'Quads'], ['Bodyweight']),


    //Resistance Bands
    Exercise('Banded Hip Thrusts', ['Glutes'], ['Resistance Bands']),
    Exercise('Banded Single Leg Hip Thrusts', ['Glutes'], ['Resistance Bands']),
    Exercise('Banded Good Mornings', ['Glutes'], ['Resistance Bands']),
    Exercise('Lateral Band Walk', ['Glutes'], ['Resistance Bands']),
    Exercise('Banded Pulse Squats', ['Glutes'], ['Resistance Bands']),

    //Machines
    Exercise('Cable Kick Backs', ['Glutes'], ['Machines']),
    Exercise('Cable Leg Side Raises', ['Glutes'], ['Machines']),
    Exercise('Wide Leg Press', ['Glutes', 'Hamstrings', 'Quads'], ['Machines']),
    Exercise('Cable RDLs', ['Glutes'], ['Machines']),
    Exercise('Deficit Cable RDLs', ['Glutes'], ['Machines']),


  ];


  List<Exercise> calvesExerciseList=[

    //Barbell
    Exercise('Barbell Calf Raises', ['Calves'], ['Barbell']),
    Exercise('Barbell Reverse Calf Raises', ['Calves'], ['Barbell']),
    Exercise('Single Leg Barbell Calf Raises', ['Calves'], ['Barbell']),
    Exercise('Single Leg Barbell Reverse Calf Raises', ['Calves'], ['Barbell']),
    Exercise('Seated Barbell Calf Raises', ['Calves'], ['Barbell']),


    //Dumbbell
    Exercise('Seated Dumbbell Calf Raises, Toes In', ['Calves'], ['Barbell']),
    Exercise('Seated Dumbbell Calf Raises, Toes Neutral', ['Calves'], ['Barbell']),
    Exercise('Seated Dumbbell Calf Raises, Toes Out', ['Calves'], ['Barbell']),
    Exercise('Tip Toe Farmers Walk', ['Calves'], ['Barbell']),
    Exercise('Reverse Seated Dumbbell Calf Raises', ['Calves'], ['Barbell']),


    //Bodyweight
    Exercise('Single Leg Calve Raises', ['Calves'], ['Bodyweight']),
    Exercise('Bodyweight Calf Raises', ['Calves'], ['Bodyweight']),
    Exercise('Jumping Jacks', ['Calves'], ['Bodyweight']),
    Exercise('Step Up with Calf Raise', ['Calves', 'Quads', 'Hamstrings'], ['Bodyweight']),
    Exercise('Static Calf Holds', ['Calves'], ['Bodyweight']),

    //Resistance Bands
    Exercise('Resistance Band Calf Raises', ['Calves'], ['Resistance Bands']),
    Exercise('Single Leg Resistance Band Calf Raises', ['Calves'], ['Resistance Bands']),
    Exercise('Seated Resistance Band Calf Raises', ['Calves'], ['Resistance Bands']),
    Exercise('Seated Single Leg Resistance Band Calf Raises', ['Calves'], ['Resistance Bands']),
    Exercise('Resistance Bands Static Calf Holds', ['Calves'], ['Bodyweight']),

    //Machines
    Exercise('Seated Calf Raise Machine', ['Calves'], ['Machines']),
    Exercise('Smith Machine Calf Raises', ['Calves'], ['Machines']),
    Exercise('Single Leg Smith Machine Calf Raises', ['Calves'], ['Machines']),
    Exercise('Leg Press Calf Raises', ['Calves'], ['Machines']),
    Exercise('Single Leg Leg Press Calf Raises', ['Calves'], ['Machines']),



  ];


  List<Exercise> forearmExerciseList=[

    //Barbell
    Exercise('Barbell Wrist Curl', ['Forearms'], ['Barbell']),
    Exercise('Reverse Barbell Wrist Curl', ['Forearms'], ['Barbell']),
    Exercise('Seated Barbell Wrist Curl', ['Forearms'], ['Barbell']),
    Exercise('Seated Barbell Wrist Extension', ['Forearms'], ['Barbell']),
    Exercise('Reverse Barbell Curls', ['Forearms'], ['Barbell']),


    //Dumbbell
    Exercise('Dumbbell Wrist Curl', ['Forearms'], ['Dumbbell']),
    Exercise('Reverse Wrist Curl', ['Forearms'], ['Dumbbell']),
    Exercise('Single Arm Seated Wrist Curl', ['Forearms'], ['Dumbbell']),
    Exercise('Seated Dumbbell Wrist Curl', ['Forearms'], ['Dumbbell']),
    Exercise('Goblet Wrist Curl', ['Forearms'], ['Dumbbell']),


    //Bodyweight
    Exercise('Bodyweight Hangs', ['Forearms'], ['Bodyweight']),
    Exercise('Chaturanga', ['Forearms'], ['Bodyweight']),
    Exercise('Plank Forearm Press', ['Forearms'], ['Bodyweight']),
    Exercise('Hanging Forearm Curls', ['Forearms'], ['Bodyweight']),
    Exercise('Single Arm Hangs', ['Forearms'], ['Bodyweight']),


    //Resistance Bands
    Exercise('Resistance Band Wrist Curls', ['Forearms'], ['Resistance Bands'],),
    Exercise('Reverse Grip Resistance Band Wrist Curls', ['Forearms'], ['Resistance Bands'],),
    Exercise('Seated Resistance Band Wrist Curls', ['Forearms'], ['Resistance Bands'],),
    Exercise('Seated Reverse Grip Resistance Band Wrist Curls', ['Forearms'], ['Resistance Bands'],),
    Exercise('Single Hand Resistance Band Wrist Curls', ['Forearms'], ['Resistance Bands'],),
    Exercise('Single Hand Reverse Grip Resistance Band Wrist Curls', ['Forearms'], ['Resistance Bands'],),

    //Machines
    Exercise('Cable Wrist Curls, Overhand Grip', ['Forearms'], ['Machines'],),
    Exercise('Cable Wrist Curls, Underhand Grip', ['Forearms'], ['Machines'],),
    Exercise('Reverse Cable Curls, Underhand Grip', ['Forearms'], ['Machines'],),
    Exercise('Single Hand Cable Wrist Curls, Overhand Grip', ['Forearms'], ['Machines'],),
    Exercise('Single Hand Cable Wrist Curls, Underhand Grip', ['Forearms'], ['Machines'],),

  ];


  List<Exercise> absExerciseList=[

    //Barbell
    Exercise('Barbell Sit Up Press', ['Abs'], ['Barbell']),
    Exercise('Barbell Roll Outs', ['Abs'], ['Barbell']),
    Exercise('Barbell Rowers', ['Abs'], ['Barbell']),
    Exercise('Barbell Landmine Twist', ['Abs'], ['Barbell']),
    Exercise('Plank Lateral Roll Out', ['Abs'], ['Barbell']),
    Exercise('Barbell Overhead Walk', ['Abs'], ['Barbell']),
    Exercise('Barbell Leg Raise', ['Abs'], ['Barbell']),
    Exercise('Landmine Russian Twists', ['Abs'], ['Barbell']),


    //Dumbbell
    Exercise('Dumbbell Russian Twists', ['Abs'], ['Dumbbell']),
    Exercise('Dumbbell Leg Raises', ['Abs'], ['Dumbbell']),
    Exercise('Dumbbell Knee Raises', ['Abs'], ['Dumbbell']),
    Exercise('Dumbbell V Sits', ['Abs'], ['Dumbbell']),
    Exercise('Lying Dumbbell Leg Raises', ['Abs'], ['Dumbbell']),
    Exercise('Kneeling Wood Choppers', ['Abs'], ['Dumbbell']),
    Exercise('Side Planks with Hip Dip', ['Abs'], ['Dumbbell']),
    Exercise('Dumbbel Reverse Crunch', ['Abs'], ['Dumbbell']),

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
    Exercise('Plank Row with Band', ['Abs'], ['Resistance Bands']),
    Exercise('Resistance Band Russian Twists', ['Abs'], ['Resistance Bands']),
    Exercise('Resistance Band Leans', ['Abs'], ['Resistance Bands']),
    Exercise('Resistance Band Knee Pull Ins', ['Abs'], ['Resistance Bands']),
    Exercise('Standing Pallof Hold', ['Abs'], ['Resistance Bands']),
    Exercise('Single Knee Pallof Hold', ['Abs'], ['Resistance Bands']),
    Exercise('Kneeling Pallof Hold', ['Abs'], ['Resistance Bands']),


    //Machines
    Exercise('Cable Crunches', ['Abs'], ['Machines']),
    Exercise('Single Arm Cable Crunches', ['Abs'], ['Machines']),
    Exercise('Reverse Cable Crunches', ['Abs'], ['Machines']),
    Exercise('Cable Wood Choppers', ['Abs'], ['Machines']),
    Exercise('Cable In n Outs', ['Abs'], ['Machines']),

  ];


  List<Exercise> trapsExerciseList = [
    //Barbell
    Exercise('Barbell Shrugs', ['Traps'], ['Barbell']),
    Exercise('Reverse Barbell Shrugs', ['Traps'], ['Barbell']),
    Exercise('Rack Pull', ['Traps'], ['Barbell']),
    Exercise('Overhead Barbell Shrug', ['Traps'], ['Barbell']),
    Exercise('Snatch Grip Barbell High Pull', ['Traps'], ['Barbell']),


    //Dumbbell
    Exercise('Dumbbell Shrugs', ['Traps'], ['Dumbbell']),
    Exercise('Farmer walks', ['Traps'], ['Dumbbell']),
    Exercise('Dumbbell Snatch', ['Traps'], ['Dumbbell']),
    Exercise('Y Raise', ['Traps'], ['Dumbbell']),
    Exercise('Incline Dumbbell Shrug', ['Traps'], ['Dumbbell']),
    Exercise('Dumbbell Overhead Carry', ['Traps'], ['Dumbbell']),

    //Bodyweight
    Exercise('Hanging Shrugs', ['Traps'], ['Bodyweight']),
    Exercise('Shoulder Blade Squeeze', ['Traps'], ['Bodyweight']),
    Exercise('Bodyweight Shrug', ['Traps'], ['Bodyweight']),
    Exercise('Straight Arm Shoulder Circles', ['Traps'], ['Bodyweight']),
    Exercise('Bodyweight Incline Y Raise', ['Traps'], ['Bodyweight']),


    //Resistance Bands
    Exercise('Resistance Band Face Pulls', ['Traps'], ['Resistance Bands']),
    Exercise('Resistance Band Shrugs', ['Traps'], ['Resistance Bands']),
    Exercise('Reverse Resistance Band Shrugs', ['Traps'], ['Resistance Bands']),
    Exercise('Resistance Band Face Pulls', ['Traps'], ['Resistance Bands']),
    Exercise('Resistance Band Reverse Raises', ['Traps'], ['Resistance Bands']),
    Exercise('Resistance Band Face Pulls', ['Traps'], ['Resistance Bands']),
    Exercise('Resistance Band Y Raise', ['Traps'], ['Resistance Bands']),

    //Machines
    Exercise('Smith Machine Shrugs', ['Traps'], ['Machines']),
    Exercise('Smith Machine Reverse Shrugs', ['Traps'], ['Machines']),
    Exercise('Cable Shrugs', ['Traps'], ['Machines']),
    Exercise('Cable Face Pulls', ['Traps'], ['Machines']),
    Exercise('Shrug Machine', ['Traps'], ['Machines']),

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

    setExerciseImage(outputList);

    return outputList;
  }

  List<Exercise> getAllExercises(String ex){
    List<Exercise> selectedExerciseList;

    ex = ex.toLowerCase();

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
    setExerciseImage(selectedExerciseList);
    return selectedExerciseList;
  }

  setExerciseImage(List<Exercise> inputList){
    String path = ' ';

    for(int i = 0; i < inputList.length; i++){

      String targetMuscle = inputList[i].targetMuscles[0].toLowerCase();

      if(targetMuscle == 'chest'){
        path =  'lib/assets/prometheus_white_orange/chest.png';
      }else if(targetMuscle == 'anterior deltoids'){
        path = 'lib/assets/prometheus_white_orange/front_delts.png';
      }else if(targetMuscle == 'lateral deltoids'){
        path = 'lib/assets/prometheus_white_orange/side_delts.png';
      }else if(targetMuscle == 'rear deltoids'){
        path = 'lib/assets/prometheus_white_orange/reardeltsandrhomboids.png';
      }else if(targetMuscle == 'abs'){
        path = 'lib/assets/prometheus_white_orange/abs.png';
      }else if(targetMuscle == 'obliques'){
        path = 'lib/assets/prometheus_white_orange/obliques.png';
      }else if(targetMuscle == 'quads'){
        path = 'lib/assets/prometheus_white_orange/quads.png';
      }else if(targetMuscle == 'biceps'){
        path = 'lib/assets/prometheus_white_orange/biceps.png';
      }else if(targetMuscle == 'forearms'){
        path = 'lib/assets/prometheus_white_orange/forearms.png';
      }else if(targetMuscle == 'traps'){
        path = 'lib/assets/prometheus_white_orange/traps.png';
      }else if(targetMuscle == 'lats'){
        path = 'lib/assets/prometheus_white_orange/lats.png';
      }else if(targetMuscle == 'triceps'){
        path = 'lib/assets/prometheus_white_orange/triceps.png';
      }else if(targetMuscle == 'lower back'){
        path = 'lib/assets/prometheus_white_orange/lower_back.png';
      }else if(targetMuscle == 'glutes'){
        path = 'lib/assets/prometheus_white_orange/glutes.png';
      }else if(targetMuscle == 'hamstrings'){
        path = 'lib/assets/prometheus_white_orange/hamstrings.png';
      }else if(targetMuscle == 'calves'){
        path = 'lib/assets/prometheus_white_orange/calves.png';
      }


      inputList[i].setImage(path);
    }

  }
}




