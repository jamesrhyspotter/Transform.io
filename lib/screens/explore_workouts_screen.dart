import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transform_dot_io/components/action_button.dart';
import 'package:transform_dot_io/screens/workout_library.dart';

class ExploreWorkoutsScreen extends StatelessWidget {

  String title = 'Workout Library';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: AppBar(
            bottom: TabBar(
              labelColor: Colors.amber[800],
              indicatorColor: Colors.amber[800],
              tabs: [
                Tab(child: Text('Workout Library', style: GoogleFonts.montserrat())),
                Tab(child: Text('My Workouts', style: GoogleFonts.montserrat())),
                Tab(child: Text('Coach\'s Picks', style: GoogleFonts.montserrat())),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            WorkoutLibrary(),
            ActionButton('Test', 'Test'),
            ActionButton('Test', 'Test'),
          ],
        ),
      ),
    );
  }
}
