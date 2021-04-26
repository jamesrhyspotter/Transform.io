import 'package:transform_dot_io/apis/exercise_db.dart';
import 'package:transform_dot_io/apis/training_principle_db.dart';
import 'dart:math';
import 'ExerciseModel.dart';

class Workout {

  String name;
  DateTime dateTime;
  List<String> targetMuscles;
  List<String> disciplines;
  List<String> equipment;
  List<Exercise> outputExerciseList;
  List<int> sets;
  List<int> reps;
  List<int> rest;
  int length;

  double intensity;


  Workout(this.targetMuscles, this.disciplines, this.equipment, this.intensity){
    print(this.targetMuscles);
    print(this.disciplines);
    print(this.equipment);
    print(this.intensity);
    getExercises();
  }


  List<Exercise> getExercises(){
    //Filter Exercises by muscle group
    ExerciseDataBase exerciseDb = new ExerciseDataBase();

    outputExerciseList = exerciseDb.getExercises(this.intensity.round(), this.targetMuscles, this.equipment);


  }



//   Workout(this.targetMuscles, this.disciplines, this.equipment, this.intensity){
//    setWorkout(this.targetMuscles, this.equipment, this.intensity);
//    setSetsAndReps(this.disciplines, this.outputExerciseList.length);
//
//   }
//
//
//
//   setWorkout(List<String> targetMuscles, List<String> equipment, double intensity) {
//     outputExerciseList = [];
//
//     List<Exercise> filteredExercises = filterExercises(getContenderExercises(targetMuscles), equipment);
//
//     int amountOfEx = (intensity.toInt()+1)*targetMuscles.length;
//     print(intensity.toInt()+1);
//     outputExerciseList = selectRandom(filteredExercises, amountOfEx);
//
//     }
//
//   setSetsAndReps(List disciplines, int length){
//     print(disciplines);
//     int startSets = 0;
//     int startReps = 0;
//
//     sets = List(length);
//     reps = List(length);
//     rest = List(length);
//
//     if(disciplines.contains('Strength')){
//       startSets = 3;
//       startReps = 5;
//     }
//
//     if(disciplines.contains('Hypertrophy')){
//       startSets = 3;
//       startReps = 8;
//     }
//
//     if(disciplines.contains('Endurance')){
//       startSets = 4;
//       startReps = 15;
//     }
//
//     for (int i = 0; i < length; i++ ){
//         sets[i] = startSets;
//         reps[i] = startReps;
//         rest[i] = 60;
//      }
//   }
//
//
//
//   List<Exercise> getContenderExercises(List<String> targetMuscles) {
//
//     ExerciseDataBase exerciseDb = new ExerciseDataBase();
//     List<Exercise> contenderExercises = [];
//
//     for (int i = 0; i < targetMuscles.length; i++) {
//       String ex = targetMuscles[i].toLowerCase();
//
//       if (ex == 'chest') {
//         contenderExercises.addAll(exerciseDb.chestExerciseList);
//       } else if (ex == 'back') {
//         contenderExercises.addAll(exerciseDb.backExerciseList);
//       } else if (ex == 'front delts') {
//         contenderExercises.addAll(exerciseDb.frontDeltsExerciseList);
//       } else if (ex == 'side delts') {
//         contenderExercises.addAll(exerciseDb.sideDeltsExerciseList);
//       } else if (ex == 'rear delts and rhomboids') {
//         contenderExercises.addAll(exerciseDb.rearDeltsExerciseList);
//       } else if (ex == 'biceps') {
//         contenderExercises.addAll(exerciseDb.bicepExerciseList);
//       } else if (ex == 'triceps') {
//         contenderExercises.addAll(exerciseDb.tricepsExerciseList);
//       } else if (ex == 'forearms') {
//         contenderExercises.addAll(exerciseDb.forearmExerciseList);
//       } else if (ex == 'abs') {
//         contenderExercises.addAll(exerciseDb.absExerciseList);
//       } else if (ex == 'quads') {
//         contenderExercises.addAll(exerciseDb.quadsExerciseList);
//       } else if (ex == 'hamstrings') {
//         contenderExercises.addAll(exerciseDb.hamstringsExerciseList);
//       } else if (ex == 'glutes') {
//         contenderExercises.addAll(exerciseDb.glutesExerciseList);
//       } else if (ex == 'calves') {
//         contenderExercises.addAll(exerciseDb.calvesExerciseList);
//       }
//     }
//     return contenderExercises;
//   }
//
//
//   List<Exercise> filterExercises(List<Exercise> contenderExercises, List<String> equipment){
//
//     List<Exercise> filteredExercises = [];
//
//     for(int i = 0; i < equipment.length; i++){
//       for(int j = 0; j < contenderExercises.length; j++){
//         if(contenderExercises[j].equipment.contains(equipment[i])){
//           filteredExercises.add(contenderExercises[j]);
//         }
//       }
//     }
//     return filteredExercises;
//   }
//
//   List<Exercise> selectRandom(List<Exercise> inputExercises, int n){
//     List<Exercise> setExercises = [];
//
//
//     int count = 0;
//
//     while(count < n){
//       Random random = new Random();
//       int randomIndex = random.nextInt(inputExercises.length - 1);
//
//
//       TrainingPrincipleDB trainingPrincipleDB = new TrainingPrincipleDB();
//       List tPrinciples = trainingPrincipleDB.trainingPrincipleList;
//       Random random2 = new Random();
//       int randomIndex2 = random2.nextInt(tPrinciples.length - 1);
//
//
//       if(!setExercises.contains(inputExercises[randomIndex])){
//
//
//         inputExercises[randomIndex].setAdvancedTrainingPrinciple(tPrinciples[randomIndex2]);
//         setExercises.insert(count, inputExercises[randomIndex]);
//         count += 1;
//       }
//     }
//     return setExercises;
//   }
    }


