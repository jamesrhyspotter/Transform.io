import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transform_dot_io/components/action_button.dart';
import 'package:transform_dot_io/screens/create_screens/workout_generator/physique_screen.dart';

class MyLockerScreen extends StatelessWidget {
  final String title = 'My Locker';
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
                Tab(child: Text('Physique', style: GoogleFonts.montserrat())),
                Tab(child: Text('Diet', style: GoogleFonts.montserrat())),
                Tab(child: Text('Mindset', style: GoogleFonts.montserrat())),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            PhysiqueScreen(),
            ActionButton('Test', 'Test'),
            ActionButton('Test', 'Test'),
          ],
        ),
      ),
    );
  }

}
