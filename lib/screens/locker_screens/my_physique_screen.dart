


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/providers/my_physique_provider.dart';

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
                Container(
                  height: height*0.63,
                  color: Colors.black38,
                  child: Image(image: (myPhysiqueProvider.currentImagePath != null) ?  AssetImage(myPhysiqueProvider.currentImagePath):AssetImage( 'lib/assets/prometheus_white_orange/full_body_white.png',)),
                ),
                Container(
                  height: height*0.1,
                  decoration: BoxDecoration(
                    color: Colors.black26,

                  ),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myPhysiqueProvider.imagePaths.length,
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
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
                        );
                      }

                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
