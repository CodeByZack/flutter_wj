import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/global.dart';

class Button extends StatelessWidget {
  final Widget icon;
  final String text;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  final Color color;
  Button({this.icon, this.text,this.onPressed,this.padding,this.color = G.colorBlue});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (icon != null) {
      return RaisedButton.icon(
        onPressed: onPressed,
        icon: icon,
        color: color,
        textColor: Colors.white,
        elevation: 0,
        label: Text(text),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      );
    } else {
      return RaisedButton(
        onPressed: onPressed,
        color: color,
        elevation: 0,

        textColor: Colors.white,
        padding: padding,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(text),
      );
    }
  }
}
