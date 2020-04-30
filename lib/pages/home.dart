import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/config.dart';
import 'package:flutterdemo/common/utils.dart';
import 'package:flutterdemo/components/CourseItem.dart';
import 'package:flutterdemo/model/courseBean.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  _jumpToPPT(BuildContext context, CourseBean bean) {
    print(bean.courseStatus);
    Navigator.of(context).pushNamed("/ppt");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      key: _scaffoldKey,
      appBar: AppBar(
          leading: IconButton(
            icon: Container(
              padding: EdgeInsets.all(3.0),
              child: CircleAvatar(
                  // radius: 30.0,
                  backgroundImage: AssetImage("images/avatar-default.png")),
            ),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          title: Text("Nearly 7 days courses"),
          backgroundColor: Colors.white,
          textTheme: TextTheme(
              title: TextStyle(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          centerTitle: true,
          elevation: 0),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return HomeDate();
              }
              var temp = CourseBean(index % 2 + 1);
              return CourseItem(temp, () {
                _jumpToPPT(context, temp);
              });
            }),
      )),
    );
  }
}

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

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  void onLogout(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Notice",
                      style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          decoration: TextDecoration.none)),
                  Padding(padding: EdgeInsets.only(bottom: 16)),
                  Text("Do you want to log out your CLASS100 account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 16,
                          decoration: TextDecoration.none)),
                  Padding(padding: EdgeInsets.only(bottom: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        child: Text("cacnel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Color(0x991890FF),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      FlatButton(
                        child: Text("ok"),
                        onPressed: () async{
                          await SPDataUtils.deleteKey(Config.TOKEN_KEY);
                          Navigator.of(context).pushNamedAndRemoveUntil("/",ModalRoute.withName('/'));
                        },
                        color: Color(0xFF1890FF),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset("images/avatar-default.png",
                    width: 100, height: 100),
              ),
              Text(
                "teacher",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF333333),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Spacer(),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(top: 10, bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: RaisedButton(
              onPressed: () {
                onLogout(context);
              },
              color: Color(0xFF1890FF),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Image.asset("images/icon-close.png",
                        width: 20, height: 20),
                  ),
                  Text('Log out')
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];
