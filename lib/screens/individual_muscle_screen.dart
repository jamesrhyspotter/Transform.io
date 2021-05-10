

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndividualMuscleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircleAvatar(backgroundColor: Colors.amber[800], minRadius: 20, maxRadius: 40,child: Image(image: AssetImage('lib/assets/muscle_images/anterior_chain_white.png'))),
    );
  }
}
