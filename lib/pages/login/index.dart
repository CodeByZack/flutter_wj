import 'package:flutter/material.dart';
import 'package:flutterdemo/common/global.dart';
import 'package:flutterdemo/common/utils.dart';
import 'package:flutterdemo/components/Button.dart';
import 'package:flutterdemo/components/Dialog.dart';
import 'package:flutterdemo/http/api.dart';
import 'package:flutterdemo/model/userinfobean.dart';

import 'buildInputDecoration.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async {
    if (G.user !=null && G.user.tokenInfo !=null && G.user.tokenInfo.token != null) {
      NavUtils.pushReplacementNamed("/");
    } else {
      var username = await SPDataUtils.getKey(G.USERNAME_KEY);
      var password = await SPDataUtils.getKey(G.PASSWORD_KEY);
      print(username);
      print(password);
      setState(() {
        usernameC.text = username;
        passwordC.text = password;
      });
    }
  }

  void onLogin(BuildContext context) async {
    print("onlogin");
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        MyDialog.showLoading(context,"loading...");
        UserInfoBean userInfoBean = await login(usernameC.text,passwordC.text);
        G.user = userInfoBean;
        MyDialog.hideLoading(context);
        await SPDataUtils.saveKey(G.USERNAME_KEY, usernameC.text);
        await SPDataUtils.saveKey(G.PASSWORD_KEY, passwordC.text);
        // await SPDataUtils.saveKey(G.TOKEN_KEY, userInfoBean.tokenInfo.token);
        await SPDataUtils.saveKey(G.LOGIN_INFO_KEY, userInfoBean.toJsonString());
        NavUtils.pushReplacementNamed("/");
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 60),
            child: Column(
              children: <Widget>[
                Image.asset(
                  "images/logo.png",
                  width: 100,
                  height: 100,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 72,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: usernameC,
                            decoration: buildInputDecoration(
                                "username",
                                Icon(Icons.person, color: G.colorGrey),
                                null),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'please input';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              usernameC.text = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 72,
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordC,
                            obscureText: !passwordVisible,
                            decoration: buildInputDecoration(
                                "password",
                                Icon(
                                  Icons.lock,
                                  color: G.colorGrey,
                                ),
                                IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: G.colorGrey,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                )),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'please input';
                              }
                              if (value.length < 6) {
                                return 'Password length should be no less than 6 digits';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              passwordC.text = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: RichText(
                            text: TextSpan(
                                text: "* Sign in means agree ",
                                style: TextStyle(color: G.colorTextDark),
                                children: [
                                  TextSpan(
                                      text: "《user agreement》",
                                      style:
                                          TextStyle(color: G.colorBlue))
                                ]),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Button(text:"Login",onPressed: (){onLogin(context);},),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

}
