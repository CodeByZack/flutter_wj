import 'package:flutter/material.dart';
import 'package:flutterdemo/common/config.dart';
import 'package:flutterdemo/common/utils.dart';
import 'package:flutterdemo/components/Button.dart';
import 'package:flutterdemo/http/api.dart';

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
    var token = await SPDataUtils.getKey(Config.TOKEN_KEY);
    print(token);
    if (token != null) {
      Navigator.of(context).pushReplacementNamed("/home");
    } else {
      var username = await SPDataUtils.getKey(Config.USERNAME_KEY);
      var password = await SPDataUtils.getKey(Config.PASSWORD_KEY);
      print(username);
      print(password);
      setState(() {
        usernameC.text = username;
        passwordC.text = password;
      });
    }
  }

  void onLogin(BuildContext context) async {
    // Validate will return true if the form is valid, or false if
    // the form is invalid.
    print("onlogin");
    if (_formKey.currentState.validate()) {
      // Process data.
      _formKey.currentState.save();
      try {
        var token = await login("");
        await SPDataUtils.saveKey(Config.USERNAME_KEY, usernameC.text);
        await SPDataUtils.saveKey(Config.PASSWORD_KEY, passwordC.text);
        await SPDataUtils.saveKey(Config.TOKEN_KEY, token);
        Navigator.of(context).pushReplacementNamed("/home");
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
                                Icon(Icons.person, color: Color(0xFFBEBEBE)),
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
                                  color: Color(0xFFBEBEBE),
                                ),
                                IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Color(0xFFBEBEBE),
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
                                style: TextStyle(color: Color(0xFF4E4E4E)),
                                children: [
                                  TextSpan(
                                      text: "《user agreement》",
                                      style:
                                          TextStyle(color: Color(0xFF1890FF)))
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

  InputDecoration buildInputDecoration(hintText, prefixIcon, suffixIcon) {
    return InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        // contentPadding: const EdgeInsets.all(0),
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFBEBEBE))),
        hintStyle:
            TextStyle(inherit: true, fontSize: 18.0, color: Color(0xFFBEBEBE)),
        hintText: hintText);
  }
}
