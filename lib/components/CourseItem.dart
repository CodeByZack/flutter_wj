import 'package:flutter/material.dart';
import 'package:flutterdemo/common/global.dart';
import 'package:flutterdemo/components/Button.dart';
import 'package:flutterdemo/model/courseBean.dart';

var statusMaps = {
  1: StatusItem("Staring soon", Color(0xFF1CE384)),
  2: StatusItem("Ongoing", Color(0xFFFFC718))
};

class StatusItem {
  Color _color;
  String _text;
  StatusItem(this._text, this._color);
}

class CourseItem extends StatelessWidget {
  final CourseBean courseBean;
  final VoidCallback onViewPPT;

  CourseItem(this.courseBean, this.onViewPPT);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 16)),
        StatusWidget(statusMaps[courseBean.courseStatus]),
        Padding(padding: EdgeInsets.only(top: 8)),
        Container(
          // height: 180,
          width: double.infinity,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: <Widget>[
              buildListTitle("images/icon-1.png", "04:00-04:30 Dec.Apr.07",
                  "Beijing time 14:30-15:00 Fri.Apr.19"),
              buildListTitle(
                  "images/icon-2.png",
                  "G7L4-Lesson 4 School Life Jijiao G7 in 2019 spring term",
                  null),
              buildListTitle("images/icon-3.png", null,
                  "Class 11,Grade 7,Beijing Clover Primary School"),
              Button(
                text: "View PPT",
                onPressed: onViewPPT,
                padding: EdgeInsets.symmetric(horizontal: 40),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget buildListTitle(img, text1, text2) {
  var texts = <Widget>[];
  if (text1 != null) {
    texts.add(Text(
      text1,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: G.colorTextDark,
      ),
    ));
  }
  if (text2 != null) {
    texts.add(Text(text2,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: G.colorTextGrey,
        )));
  }
  return Padding(
    padding: const EdgeInsets.only(bottom: 4.0),
    child: Row(
      children: <Widget>[
        Image.asset(
          img,
          width: 44,
          height: 44,
        ),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: texts),
        )
      ],
    ),
  );
}

class StatusWidget extends StatelessWidget {
  final StatusItem statusItem;

  StatusWidget(this.statusItem);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Text(
          statusItem._text,
          style: TextStyle(color: Colors.white),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            color: statusItem._color, borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
