import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/providers/workout_preferences_provider.dart';
import 'package:transform_dot_io/providers/physique_screen_provider.dart';

// ignore: must_be_immutable
class PillButtonRow extends StatelessWidget {
  List<String> inputList = [];

  PillButtonRow(List<String> inputList) {
    this.inputList = inputList;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Consumer<PhysiqueScreenProvider>(
        builder: (context, workoutProvider, child) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 26,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: inputList.length,
          itemBuilder: (context, index) {
            String value =
                inputList[index]; //workoutProvider.disciplinesList[index];
            Color borderColor = workoutProvider.getColor(value)[0];
            Color backgroundColor = workoutProvider.getColor(value)[1];
            Color fontColor = workoutProvider.getColor(value)[2];

            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: borderColor)),
                onPressed: () {
                  workoutProvider.handleButtonTap(value);
                },
                color: backgroundColor,
                textColor: fontColor,
                child:
                    Text(value.toUpperCase(), style: TextStyle(fontSize: 12)),
              ),
            );
          },
        ),
      );
    });
  }
}
