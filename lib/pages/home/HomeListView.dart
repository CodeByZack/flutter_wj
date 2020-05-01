import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/components/CourseItem.dart';
import 'package:flutterdemo/model/courseBean.dart';

import 'HomeDate.dart';


class HomeListView extends StatelessWidget {
  final Function(CourseBean) onItemClick;
  final List data;

  HomeListView({this.data, this.onItemClick});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: data.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return HomeDate();
          }
          var temp = CourseBean(index % 2 + 1);
          return CourseItem(temp, ()=>onItemClick(temp));
        });
  }
}
