import 'package:flutter/material.dart';

class BottomIcons extends StatelessWidget {
  final symbol;
  final String iconText;
  final String route;
  BottomIcons({@required this.symbol,@required this.iconText,@required this.route});
  @override
  Widget build(BuildContext context) {
    return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, route);
                    },
                    child: Icon(symbol)
                  ),
                  Text(iconText)
                ],
              );
  }
}


