import 'package:flutter/material.dart';
import 'package:flutterdemo/common/utils.dart';
import 'package:flutterdemo/components/customePDF.dart';
import 'package:flutterdemo/http/api.dart';
import 'package:flutterdemo/model/course.dart';
import 'package:flutterdemo/model/pptpath.dart';
import 'buildTab.dart';


final String NOFILE = "no file";

class PPT extends StatefulWidget {
  Course course;
  PPT(this.course);
  @override
  State<PPT> createState() => PPTState(course);
}

class PPTState extends State<PPT> {
  String nowTab = "PPT";
  String ppt_path = "";
  String lg_path = "";
  bool isLoading = true;
  Course course;
  Map<String, String> urlMap = {};
  PPTState(this.course);

  @override
  void initState() {
    super.initState();
    _getFilePaths();
  }

  _getFilePaths() async {
    Pptpath pptpath = await getChapterFiles(course.coursewareChapterId);
    setState(() {
      isLoading = false;
    });
    //找ppt
    pptpath.files.forEach((url) {
      if (url.contains("ppt")) {
        urlMap["PPT"] = "${pptpath.host}/${url}";
      }
      if (url.contains("LG")) {
        urlMap["LG"] = "${pptpath.host}/${url}";
      }
    });

     _changeTab("PPT");
  }

  _changeTab(String tab) async {
    this.setState(() {
      nowTab = tab;
    });

    if (tab == "PPT" && ppt_path.isEmpty) {
      if (!urlMap.containsKey("PPT")) {
        setState(() {
          ppt_path = NOFILE;
        });
        return;
      }
      var path = await Utils.createFileOfPdfUrl(urlMap["PPT"]);
      setState(() {
        ppt_path = path;
      });
    } else if (tab == "LG" && lg_path.isEmpty) {
      if (!urlMap.containsKey("LG")) {
        setState(() {
          lg_path = NOFILE;
        });
        return;
      }
      var path = await Utils.createFileOfPdfUrl(urlMap["LG"]);
      setState(() {
        lg_path = path;
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
              NavUtils.pop();
            });
      }),
    );

    final statusBarHeight = MediaQuery.of(context).padding.top;

    final offsetHight =
        _appBar.preferredSize.height + tab.height + statusBarHeight;

    var pathPDF = nowTab == "PPT" ? ppt_path : lg_path;

    var isFetch = isLoading || pathPDF.isEmpty;

    return Scaffold(
      appBar: _appBar,
      body: Column(
        children: <Widget>[
          tab,
          Expanded(
            child: isFetch
                ? Container(
                    color: Colors.white,
                    child: Center(child: CircularProgressIndicator()))
                : pathPDF == NOFILE 
                ? Container(
                    color: Colors.white,
                    child: Center(child: Text(NOFILE)))
                : PDFViewerScaffold(path: pathPDF, top: offsetHight),
                // : nowTab == "PPT" 
                // ? PDFViewerScaffold(path: ppt_path, top: offsetHight)
                // : PDFViewerScaffold(path: lg_path, top: offsetHight)
          ),
        ],
      ),
    );
  }
}
