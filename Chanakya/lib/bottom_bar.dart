import 'package:Chanakya/bottom_icons.dart';
import 'package:Chanakya/screens/assignment.dart';
import 'package:Chanakya/screens/home.dart';
import 'package:Chanakya/screens/notes.dart';
import 'package:Chanakya/screens/quiz.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 50,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Color(0xFFFF0067)),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              BottomIcons(symbol: Icons.ondemand_video, iconText: 'Class', route: MyHomePage.id,),
              BottomIcons(symbol: Icons.class_, iconText: 'Notes', route: Notes.id,),
              BottomIcons(symbol: Icons.assignment, iconText: 'Assignment', route: Assignment.id,),
              BottomIcons(symbol: Icons.timer, iconText: 'Quiz', route: Quizzler.id,), 
            ]
          ),
        );
  }
}