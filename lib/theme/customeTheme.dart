// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class CustomeThemeData {
  static const titleTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static BoxDecoration radiusWhiteBg = BoxDecoration(
      borderRadius: BorderRadius.circular(8), color: Colors.white);

  static ThemeData themeData() {
    return ThemeData(
        backgroundColor: Colors.white,
        primaryColor: Color(0xFF1890FF),
        appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: TextTheme(title: titleTextStyle)),
        buttonTheme: ButtonThemeData(buttonColor: Color(0xFF1890FF)));
  }
}
