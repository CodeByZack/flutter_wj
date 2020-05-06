import 'package:flutter/material.dart';
import 'package:flutterdemo/common/utils.dart';
import 'package:flutterdemo/components/customePDF.dart';

import 'buildTab.dart';

class PPT extends StatefulWidget {
  @override
  State<PPT> createState() => PPTState();
}

Map mockData = {
  "PPT": "http://africau.edu/images/default/sample.pdf",
  "LG": "http://africau.edu/images/default/sample.pdf"
};

class PPTState extends State<PPT> {
  String nowTab = "PPT";
  String ppt_path = "";
  String lg_path = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _changeTab("PPT");
  }

  _changeTab(String tab) async {
    this.setState(() {
      nowTab = tab;
    });

    if (tab == "PPT" && ppt_path.isEmpty) {
      setState(() {
        isLoading = true;
      });
      var path = await Utils.createFileOfPdfUrl(mockData["PPT"]);
      print("load ppt $path");
      setState(() {
        ppt_path = path;
        isLoading = false;
      });
    } else if (tab == "LG" && lg_path.isEmpty) {
      setState(() {
        isLoading = true;
      });
      var path = await Utils.createFileOfPdfUrl(mockData["LG"]);
      print("load lg $path");

      setState(() {
        lg_path = path;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    var tab = buildTab(nowTab, _changeTab);
    var _appBar = AppBar(
      title: Text("章节名称"),
      centerTitle: true,
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            });
      }),
    );

    final statusBarHeight = MediaQuery.of(context).padding.top;

    final offsetHight =
        _appBar.preferredSize.height + tab.height + statusBarHeight;

    var pathPDF = nowTab == "PPT" ? ppt_path : lg_path;

    return Scaffold(
      appBar: _appBar,
      body: Column(
        children: <Widget>[
          tab,
          Expanded(
            child: isLoading
                ? Container(
                    color: Colors.white,
                    child: Center(child: CircularProgressIndicator()))
                : PDFViewerScaffold(path: pathPDF, top: offsetHight),
          ),
        ],
      ),
    );
  }
}
