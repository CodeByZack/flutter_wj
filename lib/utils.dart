import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class Utils{
  static Future<String> createFileOfPdfUrl(String url) async {
    String filename = url.substring(url.lastIndexOf("/") + 1);
    String dir = (await getTemporaryDirectory()).path;
    String savePath = '$dir/$filename.pdf';
    await Dio().download(url, savePath);
    return savePath;
  }
}