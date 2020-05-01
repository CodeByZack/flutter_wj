import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget icon;
  final String text;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  Button({this.icon, this.text,this.onPressed,this.padding});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (icon != null) {
      return RaisedButton.icon(
        onPressed: onPressed,
        icon: icon,
        color: Color(0xFF1890FF),
        textColor: Colors.white,
        label: Text(text),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      );
    } else {
      return RaisedButton(
        onPressed: onPressed,
        color: Color(0xFF1890FF),
        textColor: Colors.white,
        padding: padding,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(text),
      );
    }
  }
}
