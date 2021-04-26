import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/assets/p_chain_diagram.dart';
import 'package:transform_dot_io/assets/a_chain_diagram.dart';
import 'package:transform_dot_io/components/heading2.dart';
import 'package:transform_dot_io/components/heading3.dart';
import 'package:transform_dot_io/components/pillButtonRow.dart';
import 'package:transform_dot_io/providers/physique_screen_provider.dart';
import 'package:speed_dial/speed_dial.dart';
import 'package:transform_dot_io/screens/create_screens/workout_generator/workout_preference_screen.dart';

class PhysiqueScreen extends StatelessWidget {

  List<double> coordsXList = [];
  List<double> coordsYList = [];

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (_) => PhysiqueScreenProvider(),
      child: Consumer<PhysiqueScreenProvider>(
        builder: (context, physiqueScreenProvider, child){
          return Scaffold(
            body: Column(
              children: [
                Container(
                  height: 50,
                  child: physiqueScreenProvider.selectedMuscleList.length == 0 ? SizedBox(): Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    height: height /20,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: physiqueScreenProvider.selectedMuscleList.length,
                      itemBuilder: (context, index){

                        String value = physiqueScreenProvider.selectedMuscleList[index];//workoutProvider.disciplinesList[index];
                        Color borderColor = Colors.amber[800];
                        Color backgroundColor = Colors.black45;
                        Color fontColor = Colors.white;

                        if(value == null){
                          return SizedBox();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(left:8.0, right: 8.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.amber[800])),
                            onPressed: () {

                            },
                            color: Colors.black26,
                            textColor: Colors.white,
                            child: Text(value.toUpperCase(),
                                style: TextStyle(fontSize: 12)),
                          ),
                        );
                      },
                    ),
                  )
                ),
                Column(
                  children: [
                    Container(
                      height: physiqueScreenProvider.switched ? 50 : 0,
                    ),
                    Container(
                      child: Container(
                        height: physiqueScreenProvider.yDimension,
                        width: physiqueScreenProvider.xDimension,
                        child: Container(
                          child: GestureDetector(
                            onTapDown: (details) {
                              coordsXList.add(details.globalPosition.dx);
                              coordsYList.add(details.globalPosition.dy);
                              print(coordsXList.length);
                              if(coordsXList.length == 4){
                                print(coordsXList);
                                print(coordsYList);

                                coordsXList = [];
                                coordsYList = [];
                              }
                              physiqueScreenProvider.selectMuscle(details.globalPosition.dx, details.globalPosition.dy);
                            },
                            child: CustomPaint(
                              size: Size.square(50), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                              painter: physiqueScreenProvider.currentView,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    height: 100,

                )
              ],
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              SizedBox(width: 10,),
                FlatButton(
                    color: Colors.amber[800].withOpacity(0.8),
                    minWidth: 100,
                    onPressed: (){
                      physiqueScreenProvider.toggleView();
                    }, child: Row(
                  children: [
                    Text('Toggle View', style: GoogleFonts.montserrat(),),
                    Icon(Icons.refresh),
                  ],
                )),
                SizedBox(width: 10,),
                FlatButton(
                    color: Colors.amber[800].withOpacity(0.8),
                    onPressed: (){
                      showModalBottomSheet(isDismissible: true, context: context, builder: (BuildContext context){
                        if(physiqueScreenProvider.selectedMuscleList.length > 0){

                          return WorkoutPreferenceScreen(physiqueScreenProvider.selectedMuscleList);
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                width: 100,
                                child: Center(
                                    child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(color: Colors.amber[800])),
                                        child: Text('!', style: GoogleFonts.montserrat(fontSize: 32, color: Colors.white)))),
                              ),
                            ),
                            Text('Please choose your muscle groups!', style: GoogleFonts.montserrat(),),
                          ],
                        );
                      }
                      );
                    }, child: Text('Generate Workout', style: GoogleFonts.montserrat(),)
                ),



              ],
            ),
          );
        },
      ),
    );
  }
}
