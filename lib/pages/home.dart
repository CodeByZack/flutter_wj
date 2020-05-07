import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[HomeDate()],
        ),
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
      
      decoration: BoxDecoration(
          color: Color(0xFF1890FF),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[
              Text("123"),
              Text("123"),
            ],
          )),
          Expanded(
              child: Column(
            children: <Widget>[
              Text("123"),
              Text("123"),
            ],
          ))
        ],
      ),
    );
  }
}

class HomeTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "images/avatar-default.png",
            width: 32,
            height: 32,
          ),
          Text("Nearly 7 days courses")
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
    Navigator.of(context).pushNamed("/login");
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
