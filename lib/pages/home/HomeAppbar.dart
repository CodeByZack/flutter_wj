import 'package:flutter/material.dart';

AppBar buildAppBar(VoidCallback onLeadingClick) {
  return AppBar(
      leading: IconButton(
        icon: CircleAvatar(
            backgroundImage: AssetImage("images/avatar-default.png")),
        onPressed: () {
          onLeadingClick();
        },
      ),
      title: Text("Nearly 7 days courses"),
      centerTitle: true,
      elevation: 0);
}
