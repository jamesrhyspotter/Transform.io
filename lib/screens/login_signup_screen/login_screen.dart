import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/providers/screen_provider.dart';
import 'home_screen.dart';
import 'registration_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Form Key
  final _formKey = GlobalKey<FormState>();

  // Editting Controller

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //Firebase

 // final _auth = FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value.isEmpty){
          return ("Please Enter Your Email");
        }

        //Reg Expression for Email Validation
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
          return ("Please Enter a Valid Email");
        }

        return null;
      },
      onSaved: (value){
        emailController.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,

      validator: (value){
        RegExp regex = new RegExp(r'^.{6,}$');

        if(value.isEmpty){
          return ("Please Enter Your Password");
        }

        if(!regex.hasMatch(value)){
          return ("Please Enter Valid Password (Min 6 Characters)");
        }
      },
      onSaved: (value){
        passwordController.text = value;
      },
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


    //Log in button
    final loginButton = Material(
      elevation: 5,

      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        color: Colors.amber.shade800,
        padding: EdgeInsets.fromLTRB(20,15,20,15),
        onPressed: () { 
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
              create: (_) => ScreenProvider() ,
              child: CurrentPage())));
        },
        child: const Text('Login',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),

      ),

    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset("lib/assets/prometheus_white_orange/full_body_white.png"),
                    ),
                    SizedBox(height: 45,),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 15,),
                    loginButton,
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account? '),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                          },
                          child: Text('Sign Up', style:TextStyle(
                              color: Colors.amber.shade800,
                              fontWeight: FontWeight.w600,
                              fontSize: 15)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  //Login Function

  void signIn(String email, String password) async {

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (content) => ChangeNotifierProvider(
        create: (_) => ScreenProvider() ,
        child: CurrentPage())));

    // if(_formKey.currentState.validate()){
    //   await _auth.signInWithEmailAndPassword(email: email, password: password).then((uid)=>{
    //     Fluttertoast.showToast(msg: "Login Sucessful"),
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (content) => HomeScreen()))
    //   }).catchError((e){
    //     Fluttertoast.showToast(msg: "Login Unsuccessful");
    //   });
  //  }
  }
}
// ignore: must_be_immutable
class CurrentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Consumer<ScreenProvider>(
        builder: (context, screenProvider, child){
          return Scaffold(

            body: screenProvider.currentPage(),
            bottomNavigationBar: BottomNavigationBar(
              items: screenProvider.bottomNavigationBarItems,
              currentIndex: screenProvider.currentPageIndex,
              selectedItemColor: Colors.amber[800],
              onTap: screenProvider.changePage,
            ),
          );
        }
    );
  }
}


