import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/global.dart';
import 'package:flutterdemo/common/utils.dart';
import 'package:flutterdemo/components/Button.dart';
import 'package:flutterdemo/model/course.dart';

var statusMaps = {
  2: StatusItem("Staring soon", Color(0xFF1CE384)),
  1: StatusItem("Ongoing", Color(0xFFFFC718))
};

class StatusItem {
  Color _color;
  String _text;
  StatusItem(this._text, this._color);
}

class CourseItem extends StatelessWidget {
  final Course courseBean;
  final VoidCallback onViewPPT;

  CourseItem(this.courseBean, this.onViewPPT);

  _getSchoolClassInfo(){
    return "Class ${courseBean.classNum},Grade ${courseBean.grade}, ${courseBean.schoolName}";
  }

  _getCourseInfo(){
    return "${courseBean.coursewareName}-${courseBean.coursewareChapterName}";
  }

  _formateLocaltime(){
    String sdtStr = "${courseBean.sdate} ${courseBean.stime}";
    String edtStr = "${courseBean.sdate} ${courseBean.etime}";

    DateTime sdateTime = DateTime.parse(sdtStr);
    DateTime edateTime = DateTime.parse(edtStr);

    Duration timeOffset = sdateTime.timeZoneOffset;
    DateTime sdateTimeLocal,edateTimeLocal;

    num diffHours = timeOffset.inHours - 8;
    sdateTimeLocal = sdateTime.add(Duration(hours: diffHours));
    edateTimeLocal = edateTime.add(Duration(hours: diffHours));

    return "${DateTimeFormat.format(sdateTimeLocal, format: 'H:i')}-${DateTimeFormat.format(edateTimeLocal, format: 'H:i')} ${DateTimeFormat.format(sdateTimeLocal, format: 'D.M.j')}";
  }
  _formateBJtime(){
    DateTime dateTime = DateTime.parse(courseBean.sdate);
    num diffHours = 8 - dateTime.timeZoneOffset.inHours;
    DateTime dateTimeLocal = dateTime.add(Duration(hours: diffHours));
    return "Beijing time ${courseBean.stime}-${courseBean.etime} ${DateTimeFormat.format(dateTime, format: 'D.M.j')}";
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 16)),
        StatusWidget(statusMaps[courseBean.lessonStatus]),
        Padding(padding: EdgeInsets.only(top: 8)),
        Container(
          // height: 180,
          width: double.infinity,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xFFF4F9FF), borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: <Widget>[
              buildListTitle("images/icon-1.png", _formateLocaltime(),
                  _formateBJtime()),
              buildListTitle(
                  "images/icon-2.png",
                  _getCourseInfo(),
                  null),
              buildListTitle("images/icon-3.png", null,
                  _getSchoolClassInfo()),
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
    if(text1!=null){
      texts.add(SizedBox(height: 8,));
    }
    texts.add(Text(text2,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: text1 == null ? G.colorTextDarkGrey : G.colorTextGrey,
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
