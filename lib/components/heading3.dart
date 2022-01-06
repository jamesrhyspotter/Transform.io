import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Heading3 extends StatelessWidget {
  String value;

  Heading3(String value) {
    this.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Text(value,
        style: GoogleFonts.montserrat(fontWeight: FontWeight.w200));
  }
}
