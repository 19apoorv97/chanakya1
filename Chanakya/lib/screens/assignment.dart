import 'package:Chanakya/bottom_bar.dart';
import 'package:flutter/material.dart';
class Assignment extends StatelessWidget {
  static String id='assignment_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Notes and assignment under contruction',
        style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold),
        )),
        bottomNavigationBar:BottomBar(),
      );
  }
}