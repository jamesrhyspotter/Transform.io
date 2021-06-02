
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft ,
              end: Alignment.topRight,
              colors: [
                Color(0xC32F27),
                Color(0x780116),
                Colors.amber[800],
              ],
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Row(
                children: [
                  Icon(Icons.star),
                  SizedBox(width: width * 0.02,),
                  Text('Favourites', style: GoogleFonts.montserrat()),
                ],
              ),
            ),
            Container(
             height: height*0.17,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    color: Colors.amber[800],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                        width: width*0.35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Workout ' + index.toString(), style: GoogleFonts.montserrat(fontSize: 18),),
                          ],
                        ),
                      ),

                    ]
                    ),
                  );
                },

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Row(
                children: [
                  Icon(Icons.new_releases_outlined),
                  SizedBox(width: width * 0.02,),
                  Text('New', style: GoogleFonts.montserrat()),
                ],
              ),
            ),
            Container(
              height: height*0.17,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    color: Colors.amber[800],
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: width*0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Workout ' + index.toString(), style: GoogleFonts.montserrat(fontSize: 18),),
                              ],
                            ),
                          ),

                        ]
                    ),
                  );
                },

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.history),
                  SizedBox(width: width * 0.02,),
                  Text('History', style: GoogleFonts.montserrat()),
                ],
              ),
            ),
            Container(
              height: height*0.17,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    color: Colors.amber[800],
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: width*0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Workout ' + index.toString(), style: GoogleFonts.montserrat(fontSize: 18),),
                              ],
                            ),
                          ),

                        ]
                    ),
                  );
                },

              ),
            )
          ],
        ),
      ),
    );
  }
}
