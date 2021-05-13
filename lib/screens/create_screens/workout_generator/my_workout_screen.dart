

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transform_dot_io/components/ScreenTitle.dart';
import 'package:transform_dot_io/models/exercise_model.dart';
import 'package:transform_dot_io/models/workout_model.dart';

class MyWorkoutScreen extends StatelessWidget {

  Workout workout;
  List<Exercise> inputExercises;

  MyWorkoutScreen();


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return new Scaffold(
        appBar: AppBar(
          title: Text("Your Workout"),
          actions: [
            FlatButton(child: Icon(Icons.timer), onPressed: (){}),
          ],
        ),
        body: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  height: height/2,
                  width: width*.8,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: ScreenTitle(text: 'Exercise ' + index.toString()),
                ),
              ],
            );
          },
          autoplay: false,
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
        ));
  }

}

