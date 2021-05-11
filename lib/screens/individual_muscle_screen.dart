

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndividualMuscleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircleAvatar(backgroundColor: Colors.black38, minRadius: 20, maxRadius: 100,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/chest.png'))),
    );
  }
}
