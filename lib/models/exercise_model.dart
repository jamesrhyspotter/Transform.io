

import 'package:flutter/material.dart';
import 'package:transform_dot_io/apis/training_principle_db.dart';

class Exercise {

  String name;
  List<String> targetMuscles;
  bool isCompound;
  String teachingPoints;
  List<String> equipment;
  int level = 0;
  double exerciseExperiencePoints;
  TrainingPrinciple _advancedTrainingPrinciple;
  Widget icon;


  TrainingPrinciple get advancedTrainingPrinciple => _advancedTrainingPrinciple;

  void setAdvancedTrainingPrinciple(TrainingPrinciple value) {
    _advancedTrainingPrinciple = value;
  }



  Exercise(String name, List<String> targetMuscles, List<String> equipment){
    this.name = name;
    this.targetMuscles = targetMuscles;
    this.equipment = equipment;
  }



}