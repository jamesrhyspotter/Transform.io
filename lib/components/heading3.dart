
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Heading3 extends StatelessWidget{

  String value;

  Heading3(String value){
    this.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20),
      child: Text(value, style: GoogleFonts.montserrat()),
    );
  }
}
