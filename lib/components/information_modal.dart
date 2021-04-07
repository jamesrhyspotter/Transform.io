import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transform_dot_io/models/ExerciseModel.dart';
import 'package:transform_dot_io/models/WorkoutModel.dart';

class InformationModal extends StatelessWidget {


  final Workout workout ;
  final int index;

  InformationModal(this.workout, this.index);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(this.workout.outputExerciseList[index].name, style: GoogleFonts.montserrat(),),
                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text('Exercise Level: ' + this.workout.outputExerciseList[index].level.toString(), style: GoogleFonts.montserrat()),
                        ),
                      ],
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text('Image')),
                    )
                  ],
                ),
              ),
              Divider(thickness: 1,),
              Row(
                children: [
                  Container(
                    height: 315,
                    width: 395,
                    child: ListView.builder(
                        itemCount: this.workout.sets[index],
                        itemBuilder: (BuildContext context, int index){
                          return Container(
                            child: ListTile(
                              title: Text('Set ' + (index+1).toString(),  style: GoogleFonts.montserrat()),
                              subtitle: Text(this.workout.outputExerciseList[index].advancedTrainingPrinciple.toString(),  style: GoogleFonts.montserrat()),
                              trailing: Checkbox(value: false),
                            ),
                          );
                        }
                    ),
                  )
                ],
              ),
              Divider(thickness: 1,)
            ],
          ),
        ),
      ),
    );
  }

}
