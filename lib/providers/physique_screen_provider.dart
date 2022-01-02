import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/assets/a_chain_diagram.dart';
import 'package:transform_dot_io/assets/p_chain_diagram.dart';
import 'package:transform_dot_io/models/workout_model.dart';

class PhysiqueScreenProvider with ChangeNotifier {
  //SCREEN STATES
  static List<int> states = [0, 1, 2, 3];
  int currentStateIndex = 0;
  int currentState;

  // TITLES
  static List titles = [
    'Select Target Muscle(s)',
    'Pull Down to Load workout',
    'Pull Down to Start',
    'Pull Down To End'
  ];
  String currentTitle = titles[0];

  setState() {
    print(states[currentStateIndex].toString());
    if (currentStateIndex == states.length) {
      currentStateIndex = 0;
    }

    currentState = states[currentStateIndex];
    currentTitle = titles[currentStateIndex];
    currentStateIndex += 1;

    notifyListeners();
  }

  //IMAGE PATHS  ---------------------------------------------------------------
  List<String> imagePaths = [
    'lib/assets/prometheus_white_orange/chest.png',
    'lib/assets/prometheus_white_orange/front_delts.png',
    'lib/assets/prometheus_white_orange/side_delts.png',
    'lib/assets/prometheus_white_orange/abs.png',
    'lib/assets/prometheus_white_orange/obliques.png',
    'lib/assets/prometheus_white_orange/quads.png',
    'lib/assets/prometheus_white_orange/biceps.png',
    'lib/assets/prometheus_white_orange/forearms.png',
    'lib/assets/prometheus_white_orange/traps.png',
    'lib/assets/prometheus_white_orange/lats.png',
    'lib/assets/prometheus_white_orange/reardeltsandrhomboids.png',
    'lib/assets/prometheus_white_orange/triceps.png',
    'lib/assets/prometheus_white_orange/lower_back.png',
    'lib/assets/prometheus_white_orange/glutes.png',
    'lib/assets/prometheus_white_orange/hamstrings.png',
    'lib/assets/prometheus_white_orange/calves.png',
    //
  ];

  //IMAGE LIST -----------------------------------------------------------------
  List<String> muscles = [
    'Chest',
    'Front Delts',
    'Side Delts',
    'Abs',
    'Obliques',
    'Quads',
    'Biceps',
    'Forearms',
    'Traps',
    'Lats',
    'Rear Delts and Rhomboids',
    'Triceps',
    'Lower Back',
    'Glutes',
    'Hamstrings',
    'Calves',
  ];

  // ANTERIOR CHAIN ------------------------------------------------------------
  List<String> aMuscles = [
    'Chest',
    'Front Delts',
    'Side Delts',
    'Abs',
    'Obliques',
    'Quads',
    'Biceps',
    'Forearms',
  ];

  //FEATURES -------------------------------------------------------------------

  //Variables for Physique Screen
  List<String> _selectedMuscleList = [];
  Color physiqueColor = Colors.white;
  Color selectedColor = Colors.amber[800];
  CustomPainter pChainDiagram = PosteriorChainDiagram(highlightedMuscles: []);
  CustomPainter aChainDiagram = AnteriorChainDiagram(
      highlightedMuscles: [],
      color: Colors.white,
      selectedColor: Colors.amber[800]);
  CustomPainter currentView = AnteriorChainDiagram(
      highlightedMuscles: [],
      color: Colors.white,
      selectedColor: Colors.amber[800]);
  double _xDimension = 270;
  double _yDimension = 460;
  double sizedBoxedHeight = 50;
  bool frontFacing = true;
  bool switched = false;
  List<String> preferences = [];
  Workout generatedWorkout;
  bool loaded = false;

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
    Colors.amber[800],
    Colors.black12,
    Colors.white
  ];

  //RESET

  reset() {
    _selectedButtons = [];
    _selectedMuscleList = [];
  }

  //GETTERS AND SETTERS -------------------------------------------------------
  double get xDimension => _xDimension;
  double get yDimension => _yDimension;

  List<String> get selectedMuscleList => _selectedMuscleList;

  //METHODS FOR VIEWING DIAGRAM -------------------------------------------------------------------

  toggleView() {
    if (switched) {
      currentView = AnteriorChainDiagram(
          highlightedMuscles: selectedMuscleList,
          color: physiqueColor,
          selectedColor: selectedColor);
      frontFacing = true;
      _xDimension = 270;
      _yDimension = 500;
      sizedBoxedHeight = 50;
    } else {
      currentView =
          PosteriorChainDiagram(highlightedMuscles: selectedMuscleList);
      frontFacing = false;
      _xDimension = 270;
      _yDimension = 460;
      sizedBoxedHeight = 100;
    }
    switched = !switched;

    notifyListeners();
  }

  selectMuscle(double xCoord, double yCoord) {
    String selectedMuscle;

    if (!frontFacing) {
      if ((xCoord >= 165) &
          (xCoord <= 275) &
          (yCoord >= 265) &
          (yCoord <= 330)) {
        selectedMuscle = 'Traps';
      } else if ((xCoord >= 150) &
          (xCoord <= 290) &
          (yCoord >= 250) &
          (yCoord <= 400)) {
        selectedMuscle = 'Lats';
      } else if ((xCoord >= 186) &
          (xCoord <= 262) &
          (yCoord >= 405) &
          (yCoord <= 430)) {
        selectedMuscle = 'Lower Back';
      } else if ((xCoord >= 155) &
          (xCoord <= 283) &
          (yCoord >= 433) &
          (yCoord <= 483)) {
        selectedMuscle = 'Glutes';
      } else if ((xCoord >= 150) &
          (xCoord <= 288) &
          (yCoord >= 490) &
          (yCoord <= 570)) {
        selectedMuscle = 'Hamstrings';
      } else if ((xCoord >= 150) &
          (xCoord <= 290) &
          (yCoord >= 590) &
          (yCoord <= 650)) {
        selectedMuscle = 'Calves';
      } else if (((xCoord >= 295) & (xCoord <= 340) ||
              ((xCoord >= 95) & (xCoord <= 140))) &
          (yCoord >= 335) &
          (yCoord <= 375)) {
        selectedMuscle = 'Triceps';
      } else if (((xCoord >= 120) & (xCoord <= 170) ||
              ((xCoord >= 295) & (xCoord <= 340))) &
          (yCoord >= 290) &
          (yCoord <= 330)) {
        selectedMuscle = 'Rear Delts and Rhomboids';
      }
    } else {
      if ((xCoord >= 195) &
          (xCoord <= 245) &
          (yCoord >= 360) &
          (yCoord <= 445)) {
        selectedMuscle = 'Abs';
      } else if (((xCoord >= 280) & (xCoord <= 330) ||
              ((xCoord >= 110) & (xCoord <= 160))) &
          (yCoord >= 340) &
          (yCoord <= 380)) {
        selectedMuscle = 'Biceps';
      } else if (((xCoord >= 160) & (xCoord <= 190) ||
              ((xCoord >= 250) & (xCoord <= 280))) &
          (yCoord >= 376) &
          (yCoord <= 435)) {
        selectedMuscle = 'Obliques';
      } else if (((xCoord >= 160) & (xCoord <= 215) ||
              ((xCoord >= 225) & (xCoord <= 280))) &
          (yCoord >= 310) &
          (yCoord <= 345)) {
        selectedMuscle = 'Chest';
      } else if ((xCoord >= 150) &
          (xCoord <= 280) &
          (yCoord >= 460) &
          (yCoord <= 560)) {
        selectedMuscle = 'Quads';
      } else if (((xCoord >= 95) & (xCoord <= 140) ||
              ((xCoord >= 310) & (xCoord <= 350))) &
          (yCoord >= 390) &
          (yCoord <= 460)) {
        selectedMuscle = 'Forearms';
      } else if (((xCoord >= 265) & (xCoord <= 300) ||
              ((xCoord >= 145) & (xCoord <= 180))) &
          (yCoord >= 290) &
          (yCoord <= 325)) {
        selectedMuscle = 'Front Delts';
      } else if (((xCoord >= 300) & (xCoord <= 330) ||
              ((xCoord >= 110) & (xCoord <= 140))) &
          (yCoord >= 290) &
          (yCoord <= 340)) {
        selectedMuscle = 'Side Delts';
      } else if ((xCoord >= 185) &
          (xCoord <= 260) &
          (yCoord >= 600) &
          (yCoord <= 650)) {
        selectedMuscle = 'Calves';
      } else if ((xCoord >= 150) &
          (xCoord <= 280) &
          (yCoord >= 275) &
          (yCoord <= 300)) {
        selectedMuscle = 'Traps';
      }
    }

    print(selectedMuscle);

    if (selectedMuscleList.contains(selectedMuscle)) {
      selectedMuscleList.remove(selectedMuscle);
    } else if (selectedMuscle != null) {
      selectedMuscleList.add(selectedMuscle);
    }

    print(selectedMuscleList);

    currentView = drawDiagram(selectedMuscleList, frontFacing);

    notifyListeners();
  }

  CustomPainter drawDiagram(List<String> selectedMuscles, bool frontFacing) {
    if (frontFacing) {
      return AnteriorChainDiagram(
          highlightedMuscles: selectedMuscles,
          color: physiqueColor,
          selectedColor: selectedColor);
    } else {
      return PosteriorChainDiagram(highlightedMuscles: selectedMuscles);
    }
  }

  //METHODS FOR BODY PART BUTTONS ----------------------------------------------
  handleMusclePress(int index) {
    String selectedMuscle = ' ';
    loaded = false;

    selectedMuscle = this.muscles[index];

    if (selectedMuscleList.contains(selectedMuscle)) {
      selectedMuscleList.remove(selectedMuscle);
    } else if (selectedMuscle != null) {
      selectedMuscleList.add(selectedMuscle);
    }

    if (aMuscles.contains(selectedMuscle)) {
      frontFacing = true;
    } else {
      frontFacing = false;
    }
    currentView = drawDiagram(selectedMuscleList, frontFacing);
    print(selectedMuscle);

    notifyListeners();
  }

  //GET COLOR

  Color getBackGroundColor(int index) {
    if (selectedMuscleList.contains(this.muscles[index])) {
      return Colors.amber[800];
    }

    return Colors.white12;
  }

  //METHODS FOR PREFERENCES ----------------------------------------------------
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

  void savePreferences() {
    print('Saving preferences');
    print(_selectedButtons);
    preferences.addAll(_selectedButtons);
    print(preferences);
  }

  //METHODS FOR GENERATING WORKOUT

  void generateWorkout(List<String> muscleList) {
    List<String> bufferEquipmentList = [];
    List<String> bufferDisciplineList = [];

    for (int i = 0; i < _selectedButtons.length; i++) {
      if (this.equipmentList.contains(_selectedButtons[i])) {
        bufferEquipmentList.add(_selectedButtons[i]);
      }

      if (this.disciplinesList.contains(_selectedButtons[i])) {
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

    generatedWorkout = new Workout(
        muscleList, bufferDisciplineList, bufferEquipmentList, sliderValue);
  }

  // GENERATING WORKOUT WITH REFRESH -----------------------------

  Future loadWorkout() async {
    setState();

    if (selectedMuscleList.length > 0) {
      print(loaded);
      await Future.delayed(Duration(seconds: 1));

      List<String> bufferEquipmentList = ['Barbell', 'Dumbbells'];
      List<String> bufferDisciplineList = ['Hypertrophy'];

      generatedWorkout = new Workout(selectedMuscleList, bufferDisciplineList,
          bufferEquipmentList, sliderValue);
      loaded = true;
      notifyListeners();
    }
  }
}
