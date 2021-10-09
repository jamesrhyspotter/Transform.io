import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Welcome!', style: TextStyle(color: Colors.amber.shade800),)
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                    child: Image.asset("lib/assets/logo.png")
                ),
                Text("Welcome Back!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 20,),
                Text("James Potter"),
                Text("james.rhys.potter@gmail.com"),
                SizedBox(height: 20,),
                ActionChip(
                  backgroundColor: Colors.amber.shade800,
                  label: Text('Log out'),
                  onPressed: () {  },

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
