import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  // Form Key
  final _formKey = GlobalKey<FormState>();

  // Editting Controller
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController secondNameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    //first name field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.emailAddress,
      //  validator: (){},
      onSaved: (value){
        nameController.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle_sharp),
        contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //second name field
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameController,
      keyboardType: TextInputType.emailAddress,
      //  validator: (){},
      onSaved: (value){
        secondNameController.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle_sharp),
        contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
        hintText: "Second Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      //  validator: (){},
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

      //  validator: (){},
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

    //password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: confirmPasswordController,

      //  validator: (){},
      onSaved: (value){
        confirmPasswordController.text = value;
      },
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


    //sign up button
    final loginButton = Material(
      elevation: 5,

      borderRadius: BorderRadius.circular(50),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        color: Colors.amber.shade800,
        padding: EdgeInsets.fromLTRB(20,15,20,15),
        onPressed: () {  },
        child: const Text('Sign Up',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),

      ),

    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.amber.shade800,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
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
                      height: 120,
                      child: Image.asset("lib/assets/prometheus_white_orange/full_body_white.png"),
                    ),
                    firstNameField,
                    SizedBox(height: 15),
                    secondNameField,
                    SizedBox(height: 15),
                    emailField,
                    SizedBox(height: 15),
                    passwordField,
                    SizedBox(height: 15,),
                    confirmPasswordField,
                    SizedBox(height: 15,),
                    loginButton,
                    SizedBox(height: 15,),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
