import 'package:flutter/material.dart';
import 'package:flutterdemo/common/global.dart';

InputDecoration buildInputDecoration(hintText, prefixIcon, suffixIcon) {
  return InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      // contentPadding: const EdgeInsets.all(0),
      labelStyle: TextStyle(color: Colors.white),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: G.colorGrey)),
      hintStyle:
          TextStyle(inherit: true, fontSize: 18.0, color: G.colorGrey),
      hintText: hintText);
}
