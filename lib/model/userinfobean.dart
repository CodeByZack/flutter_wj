import 'dart:convert';

import 'userinfo.dart';
import 'tokeninfo.dart';

class UserInfoBean {
	UserInfo userInfo;
	TokenInfo tokenInfo;

	UserInfoBean({this.userInfo, this.tokenInfo});

	UserInfoBean.fromJson(Map<String, dynamic> json) {
		userInfo = json['user_info'] != null ? new UserInfo.fromJson(json['user_info']) : null;
		tokenInfo = json['token_info'] != null ? new TokenInfo.fromJson(json['token_info']) : null;
	}

  UserInfoBean.fromJsonString(String jsonStr) {
    if(jsonStr!=null){
      var jsonMap = json.decode(jsonStr);	
      userInfo = jsonMap['user_info'] != null ? new UserInfo.fromJson(jsonMap['user_info']) : null;
		  tokenInfo = jsonMap['token_info'] != null ? new TokenInfo.fromJson(jsonMap['token_info']) : null;
    }
  }

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.userInfo != null) {
      data['user_info'] = this.userInfo.toJson();
    }
		if (this.tokenInfo != null) {
      data['token_info'] = this.tokenInfo.toJson();
    }
		return data;
	}
  String toJsonString(){
    var temp = toJson();
    var jsonString = json.encode(temp);
    print(jsonString);
    return jsonString;
  }
}
