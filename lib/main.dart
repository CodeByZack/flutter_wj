import 'package:flutter/material.dart';
import 'package:flutterdemo/theme/customeTheme.dart';

import 'pages/home/index.dart';
import 'pages/login/index.dart';
import 'pages/ppt/index.dart';


void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomeThemeData.themeData(), 
      onGenerateRoute: (RouteSettings settings) {
        print('build route for ${settings.name}');
        var routes = <String, WidgetBuilder>{
          "/": (ctx) => HomePage(),
          "/login": (ctx) => Login(),
          "/ppt": (ctx) => PPT(),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(
            builder: (ctx) => builder(ctx), settings: settings);
      },
    );
  }
}
