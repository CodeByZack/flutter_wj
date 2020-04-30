// 提供五套可选主题色
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/utils.dart';
import 'package:flutterdemo/model/userBean.dart';


const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  static UserBean userBean;
  static Future init() async {
    // userBean = await SPDataUtils.getUserBean();
  } 
}