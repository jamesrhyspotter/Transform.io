


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/providers/my_physique_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';


class MyPhysiqueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider<MyPhysiqueProvider>(
      create: (_) => MyPhysiqueProvider(),
      child: Consumer<MyPhysiqueProvider>(
        builder: (context, myPhysiqueProvider, child){
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Divider(thickness: 1.0,),
                Container(
                  height: height*0.13,

                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myPhysiqueProvider.imagePaths.length,
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Stack(
                                children: <Widget>[
                                  new CircularPercentIndicator(
                                    radius: 80.0,
                                    lineWidth: 2.0,
                                    animation: true,
                                    percent: 0.7,
                                    footer: Text('Lvl: 69', style: GoogleFonts.montserrat()),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: Colors.orange,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.black38,
                                    minRadius: 20,
                                    maxRadius: 40,
                                    backgroundImage: AssetImage(myPhysiqueProvider.imagePaths[index]),
                                    child: InkWell(
                                      onTap: (){
                                        myPhysiqueProvider.currentImagePath = myPhysiqueProvider.imagePaths[index];
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                ),
                Divider(thickness: 1.0,),
                Container(
                  height: height*0.55,

                  child: Image(image: (myPhysiqueProvider.currentImagePath != null) ?  AssetImage(myPhysiqueProvider.currentImagePath):AssetImage( 'lib/assets/prometheus_white_orange/full_body_white.png',)),
                ),

              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add, color: Colors.white),
              splashColor: Colors.white,
              backgroundColor: Colors.amber[800],
              onPressed: (){

              },
            ),
          );
        }
      ),
    );
  }
}
