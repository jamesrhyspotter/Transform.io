class TrainingPrincipleDB {


  // REPS
  List<TrainingPrinciple> trainingPrincipleList = [

    TrainingPrinciple('4444', '4 reps, 15s rest x 4'),
    TrainingPrinciple('888', '8 reps half rep hold, 8 reps normal speed, final rep 8 seconds down'),
    TrainingPrinciple('5555', '5 reps at tempo 5s up, 5s down, 5 reps normal speed x 2'),
    TrainingPrinciple('6 x 6', '6 reps, 10 seconds rest x 6'),
    TrainingPrinciple('Tabata', '20s work, 10s rest x 8'),
    TrainingPrinciple('Negative Reps (120% 1RM)', '120% of 1RM, assisted concentric, solo eccentric'),
    TrainingPrinciple('40 rep catch up', 'Rep out until failure, rest 1 min for a total of 40 reps'),
    TrainingPrinciple('21s', '7 reps bottom half of the movement, 7 reps top half of the movement, 7 full reps'),
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