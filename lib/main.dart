import 'package:flutter/material.dart';

import 'common/global.dart';
import 'pages/home.dart';
import 'pages/login/login.dart';
import 'pages/ppt.dart';


void main() async{
  await Global.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              elevation: 0,
              color: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              textTheme: TextTheme(
                  title: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)))),
      onGenerateRoute: (RouteSettings settings) {
        print('build route for ${settings.name}');
        var routes = <String, WidgetBuilder>{
          "/home": (ctx) => HomePage(),
          "/": (ctx) => Login(),
          "/ppt": (ctx) => PPT(),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(
            builder: (ctx) => builder(ctx), settings: settings);
      },
    );
  }
}
