import 'dart:convert';

class TokenInfo {
	String token;
	String expiredAt;

	TokenInfo({this.token, this.expiredAt});

	TokenInfo.fromJson(Map<String, dynamic> json) {
		token = json['token'];
		expiredAt = json['expired_at'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['token'] = this.token;
		data['expired_at'] = this.expiredAt;
		return data;
	}
  String toJsonString(){
    var temp = toJson();
    var jsonString = json.encode(temp);
    print(jsonString);
    return jsonString;
  }
}
