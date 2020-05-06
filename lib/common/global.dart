// 提供五套可选主题色
import 'package:flutter/material.dart';


class G {

  static const Color colorGrey = Color(0xFFBEBEBE);
  static const Color colorBlue = Color(0xFF1890FF);
  static const Color colorTextDark = Color(0xFF333333);
  static const Color colorTextGrey = Color(0xFF999999);

  static const String USERNAME_KEY = "USERNAME_KEY";
  static const String PASSWORD_KEY = "PASSWORD_KEY";
  static const String TOKEN_KEY = "TOKEN_KEY ";

  /// 手动延时
  static sleep({ int milliseconds = 1000 }) async => await Future.delayed(Duration(milliseconds: milliseconds));

}