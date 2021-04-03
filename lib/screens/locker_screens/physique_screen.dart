import 'package:flutter/material.dart';
import 'package:transform_dot_io/assets/p_chain_diagram.dart';
import 'package:transform_dot_io/assets/a_chain_diagram.dart';

class PhysiqueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        Container(
          height: 460,
          width: 250,
          child: Container(
            child: GestureDetector(
              onTapDown: (details) {
                print("${details.globalPosition.dx}");
                print("${details.globalPosition.dy}");
              },
              child: CustomPaint(
                size: Size.square(50), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: AnteriorChainDiagram(),
              ),
            ),
          ),
        ),
        Container(height: 50)
      ],
    );
  }
}
