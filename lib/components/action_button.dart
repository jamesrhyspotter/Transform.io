import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionButton extends StatelessWidget {

  String buttonTitle;
  String description;

  ActionButton(this.buttonTitle, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       //   Text('Image Here', style: GoogleFonts.montserrat()),
        //  Text(this.description, style: GoogleFonts.montserrat()),
          RaisedButton(onPressed: (){}, child: Text(this.buttonTitle, style: GoogleFonts.montserrat()),color: Colors.amber[800],),
        ],
      ),
    );
  }


}
