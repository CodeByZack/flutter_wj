https://class-platform-teacher.dev.class100.com

登录接口返回的token放入以api/v1开头的接口的 Authorization header里

### 登录
POST /login

#### 参数：
```json5
    {"login_name":"","password":""}
```

#### 响应
```json5
{
    "user_info": {
        "id": 0,
        "ctime": null,
        "utime": null,
        "no": 0,
        "username": "",
        "login_name": "",
        "real_name": "",
        "phone": "",
        "zone_code": "",
        "nationality": "",
        "email": "",
        "age": 0,
        "work_status": 0,
        "gender": 0,
        "sign_time": null,
        "avatar": "",
        "intro": ""
    },
    "token_info": {
        "token": "",
        "expired_at": ""
    }
}
```

### 课程列表
GET /api/v1/lessons

#### 响应
```json5
[
    {
        "courseware_id": 0,
        "courseware_chapter_id": 0,
        "courseware_name": "",
        "courseware_chapter_name": "",
        "class": 0,
        "grade": 0,
        "school_name": "",
        "sdate": "",
        "stime": "",
        "etime": ""
    }
]
```

### 课程文件ppt
GET /api/v1/chapters/:id/files

#### path中的参数
- id: courseware_chapter_id

#### 响应
```json5
{
    "prefix": "",
    "files": [""],
    "host": "",
    "cdns": {
        "class100": "",
    }
}
```