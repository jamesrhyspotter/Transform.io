import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Heading2 extends StatelessWidget {
  String value;

  Heading2(String value) {
    this.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Text(value,
        style:
            GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w200));
  }
}
