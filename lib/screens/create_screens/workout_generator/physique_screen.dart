import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/providers/physique_screen_provider.dart';
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
            appBar: AppBar(
              title: Text(physiqueScreenProvider.currentTitle, style: GoogleFonts.montserrat(fontWeight: FontWeight.w200, fontSize: 12),),
            ),
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [

                      Color(0xC32F27),
                      Color(0x780116),
                      Colors.amber[800],
                    ],
                  )
              ),

              child: Column(
                children: [
                  Container(
                    height: height*0.075,
                    child: physiqueScreenProvider.selectedMuscleList.length == 0 ? SizedBox(): Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      height: height*0.2,
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
                                // print(coordsXList.length);
                                // if(coordsXList.length == 4){
                                //   print(coordsXList);
                                //   print(coordsYList);
                                //
                                //   coordsXList = [];
                                //   coordsYList = [];
                                // }
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

                  //  RefreshIndicator(
                  //   onRefresh: physiqueScreenProvider.loadWorkout, //physiqueScreenProvider.refreshData,
                  //
                  //   color: Colors.amber[800],
                  //   child: Container(
                  //     height: height*0.726,
                  //     child: !physiqueScreenProvider.loaded ? ListView.builder(
                  //         itemCount: physiqueScreenProvider.muscles.length,
                  //         itemBuilder: (BuildContext context, int index){
                  //           return Card(
                  //             child: Container(height: height*0.3,
                  //                 child: Column(
                  //                  mainAxisAlignment: MainAxisAlignment.start,
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Row(
                  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Padding(
                  //                       padding: const EdgeInsets.all(8.0),
                  //                       child: Column(
                  //                         crossAxisAlignment: CrossAxisAlignment.start,
                  //                         children: [
                  //                           Text(physiqueScreenProvider.muscles[index], style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 12),),
                  //                           Text('Level: 100+', style: GoogleFonts.montserrat(fontSize: 12.0),),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                     FlatButton(
                  //                       splashColor: Colors.transparent,
                  //                       highlightColor: Colors.transparent,
                  //                       onPressed: (){
                  //                         physiqueScreenProvider.handleMusclePress(index);
                  //                       },
                  //                       child:!physiqueScreenProvider.selectedMuscleList.contains(physiqueScreenProvider.muscles[index]) ? Icon(Icons.add): Icon(Icons.check, color: Colors.amber[800],)
                  //                     ),
                  //                     Column(
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         FlatButton(
                  //                           splashColor: Colors.transparent,
                  //                           highlightColor: Colors.transparent,
                  //                           onPressed: (){},
                  //                           child: Icon(Icons.keyboard_control_sharp),
                  //                         ),
                  //                        ],
                  //                     )
                  //                   ],
                  //                 ),
                  //                 Divider(thickness: 2, color: Colors.black12,),
                  //                 Container(height: height*0.2, child: Image(image: AssetImage(physiqueScreenProvider.imagePaths[index]))),
                  //               ],
                  //             )),
                  //           );
                  //         }
                  //         ):
                  //     ListView.builder(
                  //         itemCount: physiqueScreenProvider.generatedWorkout.outputExerciseList.length,
                  //         itemBuilder: (BuildContext context, int index){
                  //           return Card(
                  //             child: Container(height: height*0.3,
                  //                 child: Column(
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     Row(
                  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                       children: [
                  //                         Padding(
                  //                           padding: const EdgeInsets.all(8.0),
                  //                           child: Column(
                  //                             crossAxisAlignment: CrossAxisAlignment.start,
                  //                             children: [
                  //                               Text(physiqueScreenProvider.generatedWorkout.outputExerciseList[index].name, style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 12),),
                  //                               Text('Level: 100+', style: GoogleFonts.montserrat(fontSize: 12.0),),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                         Checkbox(value: false, onChanged: (value){
                  //
                  //                         }, activeColor: Colors.amber[800],),
                  //                         Column(
                  //                           crossAxisAlignment: CrossAxisAlignment.start,
                  //                           children: [
                  //                             FlatButton(
                  //                               splashColor: Colors.transparent,
                  //                               highlightColor: Colors.transparent,
                  //                               onPressed: (){},
                  //                               child: Icon(Icons.keyboard_control_sharp),
                  //                             ),
                  //                           ],
                  //                         )
                  //                       ],
                  //                     ),
                  //                     Divider(thickness: 2, color: Colors.black12,),
                  //                     Container(height: height*0.2, child: physiqueScreenProvider.generatedWorkout.outputExerciseList[index].image),
                  //                   ],
                  //                 )),
                  //           );
                  //         }),
                  //   ),
                  // ),
                ],
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: height*0.125,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: physiqueScreenProvider.imagePaths.length,
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(

                            backgroundColor: physiqueScreenProvider.getBackGroundColor(index),
                            minRadius: 20,
                            maxRadius: 35,
                            backgroundImage: AssetImage(physiqueScreenProvider.imagePaths[index]),
                            child: InkWell(


                              onTap: (){
                                physiqueScreenProvider.handleMusclePress(index);
                              },
                            ),
                          ),
                        );
                      }
                  ),

                ),
                Row(
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
                        color: physiqueScreenProvider.selectedMuscleList.length > 0 ? Colors.amber[800] : Colors.black12,
                        onPressed: () async {

                          if(physiqueScreenProvider.selectedMuscleList.length > 0){

                            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WorkoutPreferenceScreen(physiqueScreenProvider.selectedMuscleList)));


                            showModalBottomSheet(isDismissible: true, context: context, builder: (BuildContext context){


                                return WorkoutPreferenceScreen(physiqueScreenProvider.selectedMuscleList);

                            }
                            );
                          }else{
                            //await showInformationDialog(context);
                          }



                        }, child: Text('Generate Workout', style: physiqueScreenProvider.selectedMuscleList.length > 0 ? GoogleFonts.montserrat(color: Colors.white) : GoogleFonts.montserrat(color: Colors.amber[800]),)
                    ),
                  ],
                ),
              ],
            ),
    //         floatingActionButton: FloatingActionButton(
    //           onPressed: () {
    // if(physiqueScreenProvider.selectedMuscleList.length > 0){
    //             showModalBottomSheet(isDismissible: true, isScrollControlled: true, context: context, builder: (BuildContext context){
    //                 return WorkoutPreferenceScreen(physiqueScreenProvider.selectedMuscleList);
    //
    //             }
    //             );
    //           }else{
    //             //await showInformationDialog(context);
    //           }
    //           },
    //           backgroundColor: Colors.amber[800],
    //           child: Icon(Icons.arrow_forward, color: Colors.white,),
    //         ),
          );
        },
      ),
    );
  }
}
