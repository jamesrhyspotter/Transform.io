

import 'package:flutter/material.dart';

class MuscleIcons {

  double maxRadius = 20;
  double minRadius = 30;
  Color backgroundColor  = Colors.black38;

  //ANTERIOR CHAIN MUSCLE GROUPS -----------------------------------------------

  Widget chestIcon(){
    return CircleAvatar(backgroundColor: backgroundColor, minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/chest.png')));
  }
  
  Widget frontDeltsIcon(){
    return CircleAvatar(backgroundColor:  backgroundColor,  minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/front_delts.png')));
  }

  Widget sideDeltsIcon(){
    return CircleAvatar(backgroundColor:  backgroundColor,  minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/side_delts.png')));
  }

  Widget bicepsIcon(){
    return CircleAvatar(backgroundColor:  backgroundColor,  minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/biceps.png')));
  }

  Widget forearmsIcon(){
    return CircleAvatar(backgroundColor:  backgroundColor,  minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/forearms.png')));
  }

  Widget absIcon(){
    return CircleAvatar(backgroundColor:  backgroundColor,  minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/abs.png')));
  }

  Widget obliquesIcon(){
    return CircleAvatar(backgroundColor:  backgroundColor,  minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/obliques.png')));
  }

  //POSTERIOR CHAIN ICONS -------------------------------------------------------

  Widget trapsIcon(){
    return CircleAvatar(backgroundColor:  backgroundColor,  minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/traps.png')));
  }

  Widget rearDeltsAndRhomboidsIcon(){
    return CircleAvatar(backgroundColor:  backgroundColor,  minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/reardeltsandrhomboids.png')));
  }

  Widget latsIcon(){
    return CircleAvatar(backgroundColor:  backgroundColor,  minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/lats.png')));
  }

  Widget lowerBackIcon(){
    return CircleAvatar(backgroundColor:  backgroundColor,  minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/lower_back.png')));
  }

  Widget glutesIcon(){
    return CircleAvatar(backgroundColor:  backgroundColor,  minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/glutes.png')));
  }

  Widget hamstringsIcon(){
    return CircleAvatar(backgroundColor:  backgroundColor,  minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/hamstrings.png')));
  }

  Widget calvesIcon(){
    return CircleAvatar(backgroundColor:  backgroundColor,  minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/calves.png')));
  }

  Widget tricepsIcon(){
    return CircleAvatar(backgroundColor:  backgroundColor,  minRadius: minRadius, maxRadius: maxRadius,child: Image(image: AssetImage('lib/assets/prometheus_white_orange/triceps.png')));
  }



}