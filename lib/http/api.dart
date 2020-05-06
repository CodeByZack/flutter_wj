import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterdemo/common/global.dart';
import 'package:flutterdemo/common/utils.dart';

BaseOptions options = BaseOptions(
  baseUrl: "http://47.94.254.236:55",
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
        await handleToken();
        options.headers["Authorization"] = _token;
        return options;
      }, 
      onResponse: (Response response) {
        var data = response.data;
        if (data == null) {
          return dio.reject('request error');
        }
        var code = data['code'];
        if (code == 0) {
          return dio.resolve(data['data']);
        }
        if (code == 401) {
          return dio.reject('401');
        }
        return dio.reject(data['msg'] ?? 'request error');
      }, 
      onError: (DioError error) {
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

Future login(args) async {
  print("now");
  await G.sleep();
  print("5sguohou");
  return "test";
}