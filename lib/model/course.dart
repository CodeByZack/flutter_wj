class Course {
	int coursewareId;
	int coursewareChapterId;
	String coursewareName;
	String coursewareChapterName;
	int classNum;
	int grade;
	String schoolName;
	String sdate;
	String stime;
	String etime;

	Course({this.coursewareId, this.coursewareChapterId, this.coursewareName, this.coursewareChapterName, this.classNum, this.grade, this.schoolName, this.sdate, this.stime, this.etime});

	Course.fromJson(Map<String, dynamic> json) {
		coursewareId = json['courseware_id'];
		coursewareChapterId = json['courseware_chapter_id'];
		coursewareName = json['courseware_name'];
		coursewareChapterName = json['courseware_chapter_name'];
		classNum = json['class'];
		grade = json['grade'];
		schoolName = json['school_name'];
		sdate = json['sdate'];
		stime = json['stime'];
		etime = json['etime'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['courseware_id'] = this.coursewareId;
		data['courseware_chapter_id'] = this.coursewareChapterId;
		data['courseware_name'] = this.coursewareName;
		data['courseware_chapter_name'] = this.coursewareChapterName;
		data['class'] = this.classNum;
		data['grade'] = this.grade;
		data['school_name'] = this.schoolName;
		data['sdate'] = this.sdate;
		data['stime'] = this.stime;
		data['etime'] = this.etime;
		return data;
	}
}
