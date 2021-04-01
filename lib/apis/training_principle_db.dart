class TrainingPrincipleDB {


  // REPS
  List<TrainingPrinciple> trainingPrincipleList = [

    TrainingPrinciple('4444', ''),
    TrainingPrinciple('888', ''),
    TrainingPrinciple('5555', ''),
    TrainingPrinciple('6 x 6', ''),
    TrainingPrinciple('Tabata', ''),
    TrainingPrinciple('Negative Reps (120% 1RM)', ''),
    TrainingPrinciple('40 rep catch up', ''),
    TrainingPrinciple('21s', ''),
    TrainingPrinciple('Pause Reps', ''),
    TrainingPrinciple('Tempo Reps', ''),
    TrainingPrinciple('Pyramid Reps', ''),
    TrainingPrinciple('1.5 Reps', ''),
    TrainingPrinciple('Deadstop Reps', ''),

  ];
}

class ExercisePrincipleDB{

  //SETS

  List<ExerciseRelation> exerciseRelationsList =[
    ExerciseRelation('Superset', ''),
    ExerciseRelation('Triple set', ''),
    ExerciseRelation('Megaset', ''),
  ];

}

class ExerciseRelation {
  String name;
  String description;

  ExerciseRelation(this.name, this.description);

}

class TrainingPrinciple {

  String name;
  String description;

  TrainingPrinciple(this.name, this.description);
}