// 提供五套可选主题色
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/utils.dart';
import 'package:flutterdemo/model/userinfobean.dart';


class G {

  static const Color colorGrey = Color(0xFFBEBEBE);
  static const Color colorBlue = Color(0xFF1890FF);
  static const Color colorTextDark = Color(0xFF333333);
  static const Color colorTextDarkGrey = Color(0xFF666666);
  static const Color colorTextGrey = Color(0xFF999999);

  static const String USERNAME_KEY = "USERNAME_KEY";
  static const String PASSWORD_KEY = "PASSWORD_KEY";
  static const String TOKEN_KEY = "TOKEN_KEY ";
  static const String LOGIN_INFO_KEY = "LOGIN_INFO_KEY";

  /// 手动延时
  static sleep({ int milliseconds = 1000 }) async => await Future.delayed(Duration(milliseconds: milliseconds));

  //保存全局的 navState
  static GlobalKey<NavigatorState> navigatorState = new GlobalKey();

  /// 获取当前的state
  static NavigatorState getCurrentState() => navigatorState.currentState;

  /// 获取当前的context
  static BuildContext getCurrentContext() => navigatorState.currentContext;

  //全局userInfo
  static UserInfoBean user = UserInfoBean();


  static Future init() async{
    var jsonStr = await SPDataUtils.getKey(LOGIN_INFO_KEY);
    user = UserInfoBean.fromJsonString(jsonStr);
    print(user);
  }
}