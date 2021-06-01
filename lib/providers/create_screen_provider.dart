
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CreateScreenProvider with ChangeNotifier{


  List<Color> colors = [
    Colors.amber[800],
    Colors.blue,
    Color(0x780116),
    Color(0x080357)
  ];

  Color currentColor;

  Color getTabColor(String pageName){

      if(pageName == 'workout'){
        currentColor = colors[0];
      }
      if(pageName == 'plan'){
        currentColor = colors[1];
      }
      if(pageName == 'meal'){
        currentColor = colors[2];
      }
      if(pageName == 'mealplan'){
        currentColor = colors[3];
    }

     notifyListeners();
      return currentColor;
  }



}