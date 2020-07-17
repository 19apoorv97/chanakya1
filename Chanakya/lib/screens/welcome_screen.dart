import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:Chanakya/login_button_layout.dart';

class WelcomeScreen extends StatefulWidget {
  static String id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 1));
    _controller.forward();
    _controller.addListener(() {
      setState(() {
      });
     });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LoginButton(button_text: 'Log In', button_color: Colors.lightBlueAccent, press: ()=>Navigator.pushNamed(context, LoginScreen.id)),
            LoginButton(button_text: 'Register', button_color: Colors.blueAccent,press: ()=>Navigator.pushNamed(context, RegistrationScreen.id)),
          ],
        ),
      ),
    );
  }
}
