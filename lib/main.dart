import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/providers/screen_provider.dart';
import 'package:transform_dot_io/screens/create_screens/create_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transform_dot_io/screens/login_signup_screen/login_screen.dart';
import 'package:transform_dot_io/screens/login_signup_screen/registration_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transform.io',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),

      home: LoginScreen(),
    );
  }
}
