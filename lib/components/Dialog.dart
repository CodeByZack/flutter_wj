import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/theme/customeTheme.dart';
import 'Button.dart';

class MyDialog {
  static Widget buildDialogLayout(BuildContext context, String title,
      String content, VoidCallback onConfirm) {
    return Center(
      child: Container(
        decoration: CustomeThemeData.radiusWhiteBg,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(title,
                style: CustomeThemeData.titleTextStyle.copyWith(
                  color: Color(0xff333333),
                  fontSize: 21,
                )),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            Text(content,
                textAlign: TextAlign.center,
                style: CustomeThemeData.titleTextStyle.copyWith(
                  color: Color(0xff333333),
                  fontSize: 16,
                )),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Button(
                      text: "cancel",
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  Button(
                      text: "ok",
                      onPressed: () {
                        onConfirm();
                        // Navigator.of(context).pop();
                      }),
                ]),
          ],
        ),
      ),
    );
  }

  static void showMyDialog(BuildContext context, String title, String content,
      VoidCallback onConfirm) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return buildDialogLayout(context, title, content, onConfirm);
        });
  }
}
