
import 'package:flutter/material.dart';

class HomeDate extends StatelessWidget {
  const HomeDate({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFF1890FF),
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
              Text("09:40am",
                  style: TextStyle(color: Colors.white, fontSize: 26)),
            ],
          )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Date", style: TextStyle(color: Colors.white, fontSize: 12)),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text("2019-10-11",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ))
        ],
      ),
    );
  }
}