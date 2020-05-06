
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/global.dart';
import 'package:flutterdemo/common/utils.dart';
import 'package:flutterdemo/http/api.dart';
import 'package:flutterdemo/model/course.dart';
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
  List<Course> courseList = [];
  bool isFetching = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCouseList();
  }

  void _getCouseList() async{
    var courseList = await getCourses();
    setState(() {
      this.isFetching = false;
      this.courseList = courseList;
    });
  }

  _jumpToPPT(BuildContext context) {
    return (Course bean) {
      print(bean);
      NavUtils.pushNamed("/ppt");
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
        child: isFetching ? 
        Center(child:CircularProgressIndicator()):
        HomeListView(
          data: courseList,
          onItemClick: _jumpToPPT(context),
        ),
      ),
    );
  }
}
