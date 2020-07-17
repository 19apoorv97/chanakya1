import 'package:flutter/material.dart';
import 'package:Chanakya/bottom_bar.dart';
class Notes extends StatelessWidget {
  static String id='notes_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:BottomBar(),
      );
  }
}