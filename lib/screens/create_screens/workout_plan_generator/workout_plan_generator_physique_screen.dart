
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/providers/workout_plan_generator_physique_screen_provider.dart';


class WorkoutPlanGeneratorPhysiqueScreen extends StatelessWidget {

  List<double> coordsXList = [];
  List<double> coordsYList = [];


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (_) => WorkoutPlanProvider(),
      child: Consumer<WorkoutPlanProvider>(
        builder: (context, physiqueScreenProvider, child){
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [

                      Color(0xC32F27),
                      Color(0x780116),
                      Colors.blue,
                    ],
                  )
              ),
              child: Column(
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

                            if(value == null){
                              return SizedBox();
                            }
                            return Padding(
                              padding: const EdgeInsets.only(left:8.0, right: 8.0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.blue)),
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
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: 10,),
                FlatButton(
                    color: Colors.blue.withOpacity(0.8),
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
                    color: physiqueScreenProvider.selectedMuscleList.length > 0 ? Colors.blue.withOpacity(0.8) : Colors.blue.withOpacity(0.1),
                    onPressed: ()  {

                    }, child: Text('Generate Workout Plan', style: physiqueScreenProvider.selectedMuscleList.length > 0 ? GoogleFonts.montserrat(color: Colors.white) : GoogleFonts.montserrat(color: Colors.blue),)
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

