
import 'dart:ui';

import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/global.dart';

class HomeDate extends StatelessWidget {
  const HomeDate();

  @override
  Widget build(BuildContext context) {

    DateTime dateTime = DateTime.now();
    DateTime dateTime2 = DateTime.now();
    print(DateTimeFormat.format(dateTime, format: 'O e T'));

    return Container(
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: G.colorBlue,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Beijing Time",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              RichText(text: TextSpan(
                text: DateTimeFormat.format(dateTime, format: 'h:i'),
                style: TextStyle(color: Colors.white, fontSize: 26),
                children: [
                  TextSpan(
                    text: "  ${DateTimeFormat.format(dateTime, format: 'a')}",
                    style: TextStyle(fontSize: 12)
                  )
                ]
              ))
            ],
          )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Date", style: TextStyle(color: Colors.white, fontSize: 12)),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(DateTimeFormat.format(dateTime, format: 'D.M.j.Y'),
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ))
        ],
      ),
    );
  }
}