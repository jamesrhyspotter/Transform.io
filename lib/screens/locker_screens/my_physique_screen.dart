


import 'package:flutter/material.dart';

class MyPhysiqueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    List<String> imagePaths = [
      // 'lib/assets/muscle_images/posterior_chain_white.png',
      // 'lib/assets/muscle_images/anterior_chain_white.png',
      'lib/assets/prometheus_white_orange/chest.png',
      'lib/assets/prometheus_white_orange/front_delts.png',
      'lib/assets/prometheus_white_orange/side_delts.png',
      'lib/assets/prometheus_white_orange/abs.png',
      'lib/assets/prometheus_white_orange/obliques.png',
      'lib/assets/prometheus_white_orange/quads.png',
      'lib/assets/prometheus_white_orange/biceps.png',
      'lib/assets/prometheus_white_orange/forearms.png',


      'lib/assets/prometheus_white_orange/traps.png',
      'lib/assets/prometheus_white_orange/lats.png',
      'lib/assets/prometheus_white_orange/reardeltsandrhomboids.png',
      'lib/assets/prometheus_white_orange/triceps.png',
      'lib/assets/prometheus_white_orange/lower_back.png',
      'lib/assets/prometheus_white_orange/glutes.png',
      'lib/assets/prometheus_white_orange/hamstrings.png',
      'lib/assets/prometheus_white_orange/calves.png',

      // 'lib/assets/prometheus_white_orange/full_body_posterior_white.png',
      // 'lib/assets/prometheus_white_orange/full_body_white.png',

    ];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: height*0.1,
            decoration: BoxDecoration(
              color: Colors.black26,

            ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imagePaths.length,
                itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(backgroundColor: Colors.black38, minRadius: 20, maxRadius: 40,child: Image(image: AssetImage(imagePaths[index]))),
                    );
                }

            ),
          ),
        ],
      ),
    );
  }
}
