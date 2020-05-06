import 'package:flutter/material.dart';
import 'package:flutterdemo/common/global.dart';

SizedBox buildTab(String nowChoose, Function changeTab) {
  return SizedBox(
    height: 40,
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              changeTab("PPT");
            },
            child: Container(
              child: Text(
                "PPT",
                style: TextStyle(color: Colors.white),
              ),
              width: 100,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: nowChoose == "PPT"
                      ? G.colorBlue
                      : G.colorBlue.withOpacity(0.7),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      topLeft: Radius.circular(8))),
            ),
          ),
          GestureDetector(
            onTap: () {
              changeTab("LG");
            },
            child: Container(
              child: Text(
                "LG",
                style: TextStyle(color: Colors.white),
              ),
              width: 100,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: nowChoose == "LG"
                      ? G.colorBlue
                      : G.colorBlue.withOpacity(0.7),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      topRight: Radius.circular(8))),
            ),
          )
        ],
      ),
    ),
  );
}
