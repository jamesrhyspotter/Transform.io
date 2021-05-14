import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/assets/a_chain_diagram.dart';
import 'package:transform_dot_io/assets/p_chain_diagram.dart';
import 'package:transform_dot_io/models/workout_model.dart';


class WorkoutPlanProvider with ChangeNotifier {


  //FEATURES -------------------------------------------------------------------

  //Variables for Physique Screen
  List<String> _selectedMuscleList = [];
  Color physiqueColor = Colors.white;
  Color selectedColor = Colors.blue;
  CustomPainter pChainDiagram = PosteriorChainDiagram(highlightedMuscles: []);
  CustomPainter aChainDiagram = AnteriorChainDiagram(highlightedMuscles: [], color: Colors.white, selectedColor: Colors.blue);
  CustomPainter currentView = AnteriorChainDiagram(highlightedMuscles: [], color: Colors.white, selectedColor: Colors.blue);
  double _xDimension = 270;
  double _yDimension = 460;
  double sizedBoxedHeight = 50;
  bool frontFacing = true;
  bool switched = false;
  List<String> preferences = [];
  Workout generatedWorkout;


  //Variables for Preference Screen
  final List<String> disciplinesList = [
    'Strength',
    'Hypertrophy',
    'Endurance',
  ];

  final List<String> equipmentList = [
    'Bodyweight',
    'Dumbbell',
    'Barbell',
    'Resistance Bands',
    'Machines',
  ];

  double sliderValue = 3;

  //MUTABLE LISTS
  List<String> _selectedButtons = [];

  //COLORS
  List<Color> unselectedButtonColors = [
    Colors.blue.withOpacity(0.05),
    Colors.black.withOpacity(0.05),
    Colors.white10
  ];
  List<Color> selectedButtonColors = [
    Colors.blue,
    Colors.black12,
    Colors.white
  ];


  //GETTERS AND SETTERS -------------------------------------------------------
  double get xDimension => _xDimension;
  double get yDimension => _yDimension;

  List<String> get selectedMuscleList => _selectedMuscleList;

  //METHODS FOR VIEWING DIAGRAM -------------------------------------------------------------------

  toggleView(){
    if(switched){
      currentView = AnteriorChainDiagram(highlightedMuscles: selectedMuscleList, color: physiqueColor, selectedColor: selectedColor);
      frontFacing = true;
      _xDimension = 270;
      _yDimension = 460;
      sizedBoxedHeight = 50;
    }else{
      currentView = PosteriorChainDiagram(highlightedMuscles: selectedMuscleList);
      frontFacing = false;
      _xDimension = 220;
      _yDimension = 400;
      sizedBoxedHeight = 100;
    }
    switched = !switched;

    notifyListeners();
  }

  selectMuscle(double xCoord, double yCoord){

    String selectedMuscle;

    if(!frontFacing){

      if((xCoord >=165) & (xCoord <= 275) & (yCoord >= 265) & (yCoord <=330)){
        selectedMuscle = 'Traps';
      }
      else if((xCoord >=150) & (xCoord <= 290) & (yCoord >= 250) & (yCoord <=400)){
        selectedMuscle = 'Lats';
      }
      else if((xCoord >=186) & (xCoord <= 262) & (yCoord >= 405) & (yCoord <=430)){
        selectedMuscle = 'Lower Back';
      }
      else if((xCoord >=155) & (xCoord <= 283) & (yCoord >= 433) & (yCoord <=483)){
        selectedMuscle = 'Glutes';
      }
      else if((xCoord >=150) & (xCoord <= 288) & (yCoord >= 490) & (yCoord <=570)){
        selectedMuscle = 'Hamstrings';
      }
      else if((xCoord >=150) & (xCoord <= 290) & (yCoord >= 590) & (yCoord <=650)){
        selectedMuscle = 'Calves';
      }
      else if(((xCoord >=295) & (xCoord <= 340)  || ((xCoord >=95) & (xCoord <= 140))) & (yCoord >= 335) & (yCoord <=375)) {
        selectedMuscle = 'Triceps';
      }
      else if(((xCoord >=120) & (xCoord <= 170)  || ((xCoord >=295) & (xCoord <= 340))) & (yCoord >= 290) & (yCoord <=330)){
        selectedMuscle = 'Rear Delts and Rhomboids';
      }
    }

    else{
      if((xCoord >=195) & (xCoord <= 245) & (yCoord >= 360) & (yCoord <=445)){
        selectedMuscle = 'Abs';
      }
      else if(((xCoord >=280) & (xCoord <= 330)  || ((xCoord >=110) & (xCoord <= 160))) & (yCoord >= 340) & (yCoord <=380)){
        selectedMuscle = 'Biceps';
      }
      else if(((xCoord >=160) & (xCoord <= 190)  || ((xCoord >=250) & (xCoord <= 280))) & (yCoord >= 376) & (yCoord <=435)){
        selectedMuscle = 'Obliques';
      }
      else if(((xCoord >=160) & (xCoord <= 215)  || ((xCoord >=225) & (xCoord <= 280))) & (yCoord >= 310) & (yCoord <=345)){
        selectedMuscle = 'Chest';
      }
      else if((xCoord >=150) & (xCoord <= 280) & (yCoord >= 460) & (yCoord <=560)){
        selectedMuscle = 'Quads';
      }
      else if(((xCoord >=95) & (xCoord <= 140)  || ((xCoord >=310) & (xCoord <= 350))) & (yCoord >= 390) & (yCoord <=460)){
        selectedMuscle = 'Forearms';
      }
      else if(((xCoord >=265) & (xCoord <= 300)  || ((xCoord >=145) & (xCoord <= 180))) & (yCoord >= 290) & (yCoord <=325)){
        selectedMuscle = 'Front Delts';
      }
      else if(((xCoord >=300) & (xCoord <= 330)  || ((xCoord >=110) & (xCoord <= 140))) & (yCoord >= 290) & (yCoord <=340)){
        selectedMuscle = 'Side Delts';
      }
      else if((xCoord >=185) & (xCoord <= 260) & (yCoord >= 600) & (yCoord <=650)){
        selectedMuscle = 'Calves';
      }
      else if((xCoord >=150) & (xCoord <= 280) & (yCoord >= 275) & (yCoord <=300)){
        selectedMuscle = 'Traps';
      }
    }


    print(selectedMuscle);

    if(selectedMuscleList.contains(selectedMuscle)){
      selectedMuscleList.remove(selectedMuscle);
    }else if(selectedMuscle != null){
      selectedMuscleList.add(selectedMuscle);
    }

    print(selectedMuscleList);

    currentView = drawDiagram(selectedMuscleList, frontFacing);

    notifyListeners();

  }

  CustomPainter drawDiagram(List<String> selectedMuscles, bool frontFacing){
    if(frontFacing){
      return AnteriorChainDiagram(highlightedMuscles: selectedMuscles, color: physiqueColor, selectedColor: selectedColor);
    }
    else{
      return PosteriorChainDiagram(highlightedMuscles: selectedMuscles);
    }
  }

  //METHODS FOR PREFERENCES
  void setSlider(double value) {
    sliderValue = value;
    notifyListeners();
  }

  void handleButtonTap(String value) {

    if (_selectedButtons.contains(value)) {
      _selectedButtons.remove(value);
    } else {
      _selectedButtons.add(value);
    }
    print(_selectedButtons);
    notifyListeners();
  }

  List<Color> getColor(String value) {
    if (!_selectedButtons.contains(value)) {
      return unselectedButtonColors;
    } else {
      return selectedButtonColors;
    }

  }


  void savePreferences(){
    print('Saving preferences');
    print(_selectedButtons);
    preferences.addAll(_selectedButtons);
    print(preferences);
  }

  //METHODS FOR GENERATING WORKOUT

  void generateWorkout(List<String> muscleList){


    List<String> bufferEquipmentList = [];
    List<String> bufferDisciplineList = [];

    for(int i=0; i < _selectedButtons.length; i++){
      if(this.equipmentList.contains(_selectedButtons[i])){
        bufferEquipmentList.add(_selectedButtons[i]);
      }

      if(this.disciplinesList.contains(_selectedButtons[i])){
        bufferDisciplineList.add(_selectedButtons[i]);
      }
    }

    print('Generating workout');
    print('Muscles: ');
    print(muscleList);
    print('Disciplines: ');
    print(bufferDisciplineList);
    print('Equipment: ');
    print(bufferEquipmentList);

    generatedWorkout = new Workout(muscleList, bufferDisciplineList, bufferEquipmentList, sliderValue);


  }



}