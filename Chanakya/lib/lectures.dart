import 'package:Chanakya/topic_tile.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Lectures extends StatefulWidget {
  @override
  _LecturesState createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  //final _database=Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            TopicTile(text: 'Physics', link: 'br_AX6oWdw4'),
            TopicTile(text: 'Chemistry', link: 'br_AX6oWdw4'),
            TopicTile(text: 'Maths', link: 'br_AX6oWdw4')
            ],
          )
        );
  }
}