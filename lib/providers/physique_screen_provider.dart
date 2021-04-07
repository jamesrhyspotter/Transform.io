import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/assets/a_chain_diagram.dart';
import 'package:transform_dot_io/assets/p_chain_diagram.dart';

class PhysiqueScreenProvider with ChangeNotifier {

  //FEATURES -------------------------------------------------------------------

  List<String> selectedMuscleList = [];
  CustomPainter pChainDiagram = PosteriorChainDiagram(highlightedMuscles: []);
  CustomPainter aChainDiagram = AnteriorChainDiagram(highlightedMuscles: []);
  CustomPainter currentView = AnteriorChainDiagram(highlightedMuscles: []);
  double _xDimension = 270;
  double _yDimension = 460;
  double sizedBoxedHeight = 50;
  bool frontFacing = true;
  bool switched = false;


  //GETTERS AND SETTERS -------------------------------------------------------
  double get xDimension => _xDimension;
  double get yDimension => _yDimension;

  //METHODS -------------------------------------------------------------------

  toggleView(){
    if(switched){
      currentView = AnteriorChainDiagram(highlightedMuscles: selectedMuscleList);
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
      else if(((xCoord >=105) & (xCoord <= 165)  || ((xCoord >=95) & (xCoord <= 155))) & (yCoord >= 300) & (yCoord <=335)){
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

    if(selectedMuscleList.contains(selectedMuscle)){
      selectedMuscleList.remove(selectedMuscle);
    }else if(selectedMuscle != null){
      selectedMuscleList.add(selectedMuscle);
    }

    currentView = drawDiagram(selectedMuscleList, frontFacing);

    notifyListeners();

  }

  CustomPainter drawDiagram(List<String> selectedMuscles, bool frontFacing){
    if(frontFacing){
      return AnteriorChainDiagram(highlightedMuscles: selectedMuscles);
    }
    else{
      return PosteriorChainDiagram(highlightedMuscles: selectedMuscles);
    }
  }

}