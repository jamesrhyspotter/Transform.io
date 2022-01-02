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
        builder: (context, physiqueScreenProvider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                physiqueScreenProvider.currentTitle,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w200, fontSize: 12),
              ),
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
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(
                    thickness: 1.0,
                  ),
                  Container(
                      height: height * 0.17,
                      child: physiqueScreenProvider.selectedMuscleList.length ==
                              0
                          ? SizedBox()
                          : Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              height: height * 0.2,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: physiqueScreenProvider
                                    .selectedMuscleList.length,
                                itemBuilder: (context, index) {
                                  String value = physiqueScreenProvider
                                          .selectedMuscleList[
                                      index]; //workoutProvider.disciplinesList[index];

                                  if (value == null) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.white70,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          // minRadius: 20,
                                          // maxRadius: 35,
                                          child: Icon(Icons.add)),
                                      // child: RaisedButton(
                                      //   shape: RoundedRectangleBorder(
                                      //       borderRadius:
                                      //           BorderRadius.circular(8.0),
                                      //       side: BorderSide(
                                      //           color: Colors.amber[800])),
                                      //   onPressed: () {},
                                      //   color: Colors.black26,
                                      //   textColor: Colors.white,
                                      //   child: Text(value.toUpperCase(),
                                      //       style: TextStyle(fontSize: 12)),
                                      // ),
                                    );
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.white70, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        // minRadius: 20,
                                        // maxRadius: 35,

                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                child: Image(
                                                  image: AssetImage(
                                                      physiqueScreenProvider
                                                          .imagePaths[index]),
                                                )),
                                            Text(value.toUpperCase(),
                                                style: TextStyle(fontSize: 12))
                                          ],
                                        )),
                                    // child: RaisedButton(
                                    //   shape: RoundedRectangleBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(8.0),
                                    //       side: BorderSide(
                                    //           color: Colors.amber[800])),
                                    //   onPressed: () {},
                                    //   color: Colors.black26,
                                    //   textColor: Colors.white,
                                    //   child: Text(value.toUpperCase(),
                                    //       style: TextStyle(fontSize: 12)),
                                    // ),
                                  );
                                },
                              ),
                            )),
                  Divider(
                    thickness: 1.0,
                  ),
                  Container(
                    height: height * 0.4,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: physiqueScreenProvider.imagePaths.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 100,
                                child: GestureDetector(
                                  onTap: () {
                                    physiqueScreenProvider
                                        .handleMusclePress(index);
                                  },
                                  child: Card(
                                      color: physiqueScreenProvider
                                          .getBackGroundColor(index),
                                      // minRadius: 20,
                                      // maxRadius: 35,

                                      child: Image(
                                          image: AssetImage(
                                              physiqueScreenProvider
                                                  .imagePaths[index]))),
                                  // child: InkWell(
                                  //   onTap: () {
                                  //     physiqueScreenProvider
                                  //         .handleMusclePress(index);
                                  //   },
                                  // ),
                                )),
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: RaisedButton(
                          color:
                              physiqueScreenProvider.selectedMuscleList.length >
                                      0
                                  ? Colors.amber[800]
                                  : Colors.black12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.amber[800])),
                          onPressed: () {
                            if (physiqueScreenProvider
                                    .selectedMuscleList.length >
                                0) {
                              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WorkoutPreferenceScreen(physiqueScreenProvider.selectedMuscleList)));

                              showModalBottomSheet(
                                  isDismissible: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return WorkoutPreferenceScreen(
                                        physiqueScreenProvider
                                            .selectedMuscleList);
                                  });
                            } else {
                              //await showInformationDialog(context);
                            }
                          },
                          textColor: Colors.white,
                          child: Text('Generate Workout',
                              style: GoogleFonts.montserrat(fontSize: 16)),
                        ),
                      ),
                      // ElevatedButton(
                      //     style: ButtonStyle(
                      //       backgroundColor: physiqueScreenProvider
                      //                   .selectedMuscleList.length >
                      //               0
                      //           ? MaterialStateProperty.all<Color>(
                      //               Colors.amber[800])
                      //           : MaterialStateProperty.all<Color>(
                      //               Colors.black12),
                      //     ),
                      //     onPressed: () async {
                      //       if (physiqueScreenProvider
                      //               .selectedMuscleList.length >
                      //           0) {
                      //         // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WorkoutPreferenceScreen(physiqueScreenProvider.selectedMuscleList)));

                      //         showModalBottomSheet(
                      //             isDismissible: true,
                      //             context: context,
                      //             builder: (BuildContext context) {
                      //               return WorkoutPreferenceScreen(
                      //                   physiqueScreenProvider
                      //                       .selectedMuscleList);
                      //             });
                      //       } else {
                      //         //await showInformationDialog(context);
                      //       }
                      //     },
                      //     child: Text(
                      //       'Generate Workout',
                      //       style: physiqueScreenProvider
                      //                   .selectedMuscleList.length >
                      //               0
                      //           ? GoogleFonts.montserrat(color: Colors.white)
                      //           : GoogleFonts.montserrat(
                      //               color: Colors.amber[800]),
                      //     )),
                    ],
                  ),
                ],
              ),

              // child: Column(
              //   children: [
              //     Container(
              //       height: height*0.075,
              //       child: physiqueScreenProvider.selectedMuscleList.length == 0 ? SizedBox(): Container(
              //         margin: EdgeInsets.symmetric(vertical: 10.0),
              //         height: height*0.2,
              //         child: ListView.builder(
              //           scrollDirection: Axis.horizontal,
              //           itemCount: physiqueScreenProvider.selectedMuscleList.length,
              //           itemBuilder: (context, index){

              //             String value = physiqueScreenProvider.selectedMuscleList[index];//workoutProvider.disciplinesList[index];

              //             if(value == null){
              //               return SizedBox();
              //             }
              //             return Padding(
              //               padding: const EdgeInsets.only(left:8.0, right: 8.0),
              //               child: RaisedButton(
              //                 shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(32.0),
              //                     side: BorderSide(color: Colors.amber[800])),
              //                 onPressed: () {

              //                 },
              //                 color: Colors.black26,
              //                 textColor: Colors.white,
              //                 child: Text(value.toUpperCase(),
              //                     style: TextStyle(fontSize: 12)),
              //               ),
              //             );
              //           },
              //         ),
              //       )
              //     ),
              //     Column(
              //       children: [
              //         Container(
              //           height: physiqueScreenProvider.switched ? 50 : 0,
              //         ),
              //         Container(
              //           child: Container(

              //             height: physiqueScreenProvider.yDimension,
              //             width: physiqueScreenProvider.xDimension,
              //             child: Container(
              //               child: GestureDetector(
              //                 onTapDown: (details) {
              //                   coordsXList.add(details.globalPosition.dx);
              //                   coordsYList.add(details.globalPosition.dy);
              //                   // print(coordsXList.length);
              //                   // if(coordsXList.length == 4){
              //                   //   print(coordsXList);
              //                   //   print(coordsYList);
              //                   //
              //                   //   coordsXList = [];
              //                   //   coordsYList = [];
              //                   // }
              //                   physiqueScreenProvider.selectMuscle(details.globalPosition.dx, details.globalPosition.dy);
              //                 },
              //                 child: CustomPaint(
              //                   size: Size.square(50), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              //                   painter: physiqueScreenProvider.currentView,
              //                 ),
              //               ),
              //             ),
              //           ),
              //        ),
              //       ],
              //     ),

              //   ],
              // ),
            ),
          );
        },
      ),
    );
  }
}
