import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/global.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils{
  static Future<String> createFileOfPdfUrl(String url) async {
    String filename = url.substring(url.lastIndexOf("/") + 1);
    String dir = (await getTemporaryDirectory()).path;
    String savePath = '$dir/$filename.pdf';
    print(savePath);
    await Dio().download(url, savePath);
    return savePath;
  } 
}
 
class SPDataUtils{
  // 保存数据
  static Future saveKey(key, value) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    //todo 这里需要判断一下类型
    sp.setString(key, value);
  }

  // 获取数据
  static Future getKey(key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    // print(sp.get(key));
    return sp.get(key);
  }

  // 清除数据
  static Future deleteKey(key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

}

class NavUtils{
  static void pop(){
    G.getCurrentState().pop();
  }
  static void pushNamed(String routeName, {
    Object arguments,
  }){
    G.getCurrentState().pushNamed(routeName,arguments:arguments);
  }
  static void pushReplacementNamed(String routeName, {
    Object arguments,
  }){
    G.getCurrentState().pushReplacementNamed(routeName,arguments: arguments);
  }
  static void pushNamedAndRemoveUntil(
    String newRouteName,
    RoutePredicate predicate, {
    Object arguments,
  }){
    G.getCurrentState().pushNamedAndRemoveUntil(newRouteName, predicate,arguments: arguments);
  }
}