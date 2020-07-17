import 'package:flutter/material.dart';
class LoginButton extends StatelessWidget {
  final String button_text;
  final Color button_color;
  final Function press;
  LoginButton({@required this.button_text,@required this.button_color,@required this.press});
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: button_color,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: press,
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    button_text,
                  ),
                ),
              ),
            );
  }
}
