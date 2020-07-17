import 'package:Chanakya/screens/assignment.dart';
import 'package:Chanakya/screens/home.dart';
import 'package:Chanakya/screens/login_screen.dart';
import 'package:Chanakya/screens/notes.dart';
import 'package:Chanakya/screens/quiz.dart';
import 'package:Chanakya/screens/registration_screen.dart';
import 'package:Chanakya/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context)=> WelcomeScreen(),
        LoginScreen.id:(context)=> LoginScreen(),
        RegistrationScreen.id:(context)=> RegistrationScreen(),
        MyHomePage.id: (context)=> MyHomePage(),
        Notes.id:(context)=>Notes(),
        Assignment.id:(context)=>Assignment(),
        Quizzler.id:(context)=>Quizzler()
      },
    );
  }
}

