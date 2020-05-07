class Pptpath {
	String prefix;
	List<String> files;
	String host;

	Pptpath({this.prefix, this.files, this.host});

	Pptpath.fromJson(Map<String, dynamic> json) {
		prefix = json['prefix'];
		files = json['files'].cast<String>();
		host = json['host'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['prefix'] = this.prefix;
		data['files'] = this.files;
		data['host'] = this.host;
		return data;
	}
}
