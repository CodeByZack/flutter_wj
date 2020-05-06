import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterdemo/common/global.dart';
import 'package:flutterdemo/common/utils.dart';
import 'package:flutterdemo/model/course.dart';
import 'package:flutterdemo/model/userinfobean.dart';

BaseOptions options = BaseOptions(
  baseUrl: "https://class-platform-teacher.dev.class100.com",
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

class Http {
  Dio dio = Dio(options);
  String _token;

  Http() {
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor());
    }

    dio.interceptors.add(InterceptorsWrapper(
    onRequest: (Options options) async {
      if(G.user!=null){
        options.headers["Authorization"] = G.user.tokenInfo.token;
      }
      return options;
    }, 
    onResponse: (Response response) {
      var data = response.data;
      if (data == null) {
        return dio.reject('request error');
      }
      var code = data['code'];
      if (code == "ok") {
        return dio.resolve(data['data']);
      }

      return dio.reject(data['msg'] ?? 'request error');
      // if (code == 401) {
      //   return dio.reject('401');
      // }

    }, onError: (DioError error) {
      print(error.message);
    }));
  }

  Future handleToken() async {
    if (_token == null) {
      var token = await SPDataUtils.getKey(G.TOKEN_KEY);
      if (token != null) {
        _token = token;
      }
    }
  }
}

final Http http = Http();

Future<UserInfoBean> login(loginName, password) async {
  var data = {
    "login_name": loginName,
    "password": password,
  };
  Response<Map<String, dynamic>> loginResponse = await http.dio.post("/login", data: data);
  var loginInfo = UserInfoBean.fromJson(loginResponse.data);
  return loginInfo;
}

Future<List<Course>> getCourses() async{
  Response<List> res = await http.dio.get("/api/v1/lessons");
  List<Course> courses = res.data.map((json){
    return Course.fromJson(json);
  }).toList();
  print(res);
  return courses;
}
