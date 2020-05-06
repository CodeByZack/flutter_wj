import 'package:flutter/material.dart';
import 'package:flutterdemo/common/global.dart';
import 'package:flutterdemo/common/utils.dart';
import 'package:flutterdemo/components/Button.dart';
import 'package:flutterdemo/components/Dialog.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key key,
  }) : super(key: key);

  void onLogout(BuildContext context) {
    MyDialog.showMyDialog(context, "title", "content", () async {
      await SPDataUtils.deleteKey(G.TOKEN_KEY);
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/login", ModalRoute.withName('/login'));
    });
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
                    color: G.colorTextDark,
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
              child: Button(
                icon:
                    Image.asset("images/icon-close.png", width: 20, height: 20),
                text: "Log out",
                onPressed: () {
                  onLogout(context);
                },
              )),
        ],
      ),
    ));
  }
}
