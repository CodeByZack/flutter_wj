import 'dart:convert';

class UserInfo {
	int id;
	String ctime;
	String utime;
	int no;
	String username;
	String loginName;
	String realName;
	String phone;
	String zoneCode;
	String nationality;
	String email;
	int age;
	int workStatus;
	int gender;
	String signTime;
	String avatar;
	String intro;

	UserInfo({this.id, this.ctime, this.utime, this.no, this.username, this.loginName, this.realName, this.phone, this.zoneCode, this.nationality, this.email, this.age, this.workStatus, this.gender, this.signTime, this.avatar, this.intro});

	UserInfo.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		ctime = json['ctime'];
		utime = json['utime'];
		no = json['no'];
		username = json['username'];
		loginName = json['login_name'];
		realName = json['real_name'];
		phone = json['phone'];
		zoneCode = json['zone_code'];
		nationality = json['nationality'];
		email = json['email'];
		age = json['age'];
		workStatus = json['work_status'];
		gender = json['gender'];
		signTime = json['sign_time'];
		avatar = json['avatar'];
		intro = json['intro'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['ctime'] = this.ctime;
		data['utime'] = this.utime;
		data['no'] = this.no;
		data['username'] = this.username;
		data['login_name'] = this.loginName;
		data['real_name'] = this.realName;
		data['phone'] = this.phone;
		data['zone_code'] = this.zoneCode;
		data['nationality'] = this.nationality;
		data['email'] = this.email;
		data['age'] = this.age;
		data['work_status'] = this.workStatus;
		data['gender'] = this.gender;
		data['sign_time'] = this.signTime;
		data['avatar'] = this.avatar;
		data['intro'] = this.intro;
		return data;
	}

  String toJsonString(){
    var temp = toJson();
    var jsonString = json.encode(temp);
    print(jsonString);
    return jsonString;
  }
}
