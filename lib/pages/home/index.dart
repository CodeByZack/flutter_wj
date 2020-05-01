
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/model/courseBean.dart';
import 'package:flutterdemo/pages/home/HomeAppbar.dart';
import 'package:flutterdemo/pages/home/HomeListView.dart';
import 'HomeDrawer.dart';
final List<num> entries = [1, 2, 3, 4];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  _jumpToPPT(BuildContext context) {
    return (CourseBean bean) {
      print(bean.courseStatus);
      Navigator.of(context).pushNamed("/ppt");
    };
  }

  _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: HomeDrawer(),
      key: _scaffoldKey,
      appBar: buildAppBar(_openDrawer),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: HomeListView(
          data: entries,
          onItemClick: _jumpToPPT(context),
        ),
      ),
    );
  }
}
