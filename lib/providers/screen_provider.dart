
import 'dart:core';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/screens/create_screens/create_screen.dart';
import 'package:transform_dot_io/screens/locker_screens/my_locker_screen.dart';
import 'package:transform_dot_io/screens/workout_library_screen.dart';
//
//
// class ScreenProvider with ChangeNotifier{
//
//   //LIST OF SCREENS ------------------------------------------------------------
//
//   List _screens = [

//   ];
//
  //LIST OF SUBSCREENS ------------------------------------------------------------

  List<String> _workoutLibrarySubScreens = [
    'Preset Workouts',
    'Coach set Workouts',
  ];

  List<String> _createSubScreens = [
    'Workout',
    'Workout Plan',
    'Meal',
    'Meal Plan',
  ];

  List<String> _myLockerSubScreens = [
    'My Workouts',
    'My Meals',
    'My Progress',
    'Achievements',
  ];
//
// //LIST OF GETTERS ------------------------------------------------------------
//
//   List<String> get screens => _screens;
//   List<String> get workoutLibraryScreens => _workoutLibrarySubScreens;
//   List<String> get createSubScreens => _createSubScreens;
//   List<String> get myLockerSubScreens => _myLockerSubScreens;
//

class ScreenProvider with ChangeNotifier{

  //FIELDS -------------------------------------------------------------------

  int currentPageIndex = 1;

  final List<Widget> _screens = [
    WorkoutLibraryScreen(),
    CreateScreen(),
    MyLockerScreen(),
  ];

  final List<String> screenTitles = [
    'Workout Library',
    'Create',
    'My Locker'
  ];

  final List<BottomNavigationBarItem> bottomNaivgationBarItems = [
  BottomNavigationBarItem(
  icon: Icon(Icons.add_to_home_screen),
  label: 'Explore Workouts',
  ),
  BottomNavigationBarItem(
  icon: Icon(Icons.add_circle),
  label: 'Create',
  ),
  BottomNavigationBarItem(
  icon: Icon(Icons.book_outlined),
  label: 'Locker',
  ),
  ];



  //METHODS -------------------------------------------------------------------

  void changePage(int page){
    currentPageIndex = page;
    notifyListeners();
  }

  Widget currentPage(){
    return _screens[currentPageIndex];
  }

  String currentTitle(){
    return screenTitles[currentPageIndex];
  }


}
