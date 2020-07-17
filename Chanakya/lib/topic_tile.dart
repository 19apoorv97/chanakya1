import 'package:Chanakya/v_player.dart';
import 'package:flutter/material.dart';
class TopicTile extends StatelessWidget {
  final String text;
  final String link;
  TopicTile({@required this.text,@required this.link});
  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.only(top: 5,),
                color: Color(0xFF1C1B2C),
                child: ListTile(
                  dense: true,
                  title:Text(text,style: TextStyle(color:Colors.white),textAlign: TextAlign.center,),
                  onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return MyPlayer(vLink: link,);
                  }));
                  },
                ),
              );
  }
}