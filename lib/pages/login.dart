import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _userName;
  String _password;
  bool passwordVisible = false;

  void onLogin(BuildContext context) {
    // Validate will return true if the form is valid, or false if
    // the form is invalid.
    print(context);
    if (_formKey.currentState.validate()) {
      // Process data.
      _formKey.currentState.save();
      print(_userName);
      print(_password);
      print(_userName == "123");
      if (_userName == "123" && _password == "123456") {
        print("jump home");
        Navigator.of(context).pushReplacementNamed("/home");
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
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Color(0xFFBEBEBE),
                                ),
                                // contentPadding: const EdgeInsets.all(0),
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFBEBEBE))),
                                hintStyle: TextStyle(
                                    inherit: true,
                                    fontSize: 18.0,
                                    color: Color(0xFFBEBEBE)),
                                hintText: 'username'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'please input';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _userName = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 72,
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color(0xFFBEBEBE),
                                ),
                                suffixIcon: IconButton(
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
                                ),
                                labelStyle: new TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color(0xFFBEBEBE))),
                                hintStyle: new TextStyle(
                                    inherit: true,
                                    fontSize: 18.0,
                                    color: Color(0xFFBEBEBE)),
                                hintText: 'password'),
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
                              _password = value;
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
                          child: RaisedButton(
                            onPressed: () {
                              onLogin(context);
                            },
                            color: Color(0xFF1890FF),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text('Login'),
                          ),
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
