import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alba_ta/model/form_validation.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:alba_ta/pages/daftar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = '';
  String _password = '';
  final _key = new GlobalKey<FormState>();
  bool _validate = false;

  Widget _buildTopCard(double width, double height) {
    return Container(
      width: width,
      height: height / 2,
      decoration: BoxDecoration(
        color: Color(0xFF00a5b3),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 8.0, right: 8.0, bottom: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 48.0),
                ),
                Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 0.0, left: 10.0, right: 8.0, bottom: 8.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Bimbingan Belajar Quran',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLoginCard(
    double width,
    String _username,
    String _password,
  ) {
    login() async {
      if (_key.currentState.validate()) {
        _key.currentState.save();
      }
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
              key: _key,
              autovalidate: _validate,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/image/account.png',
                    width: width / 5,
                    color: Colors.blue[300],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                      validator: valUser,
                      onSaved: (String val) {
                        _username = val;
                      },
                      decoration: InputDecoration(
                          labelText: "Username", border: OutlineInputBorder())),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                      validator: valPass,
                      onSaved: (String val) {
                        _password = val;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password", border: OutlineInputBorder())),
                  SizedBox(
                    height: 16.0,
                  ),
                  InkWell(
                    onTap: login,
                    child: Container(
                      width: double.infinity,
                      height: 56.0,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              letterSpacing: 1.0),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                  child: Align(
                alignment: Alignment.topCenter,
                child: _buildTopCard(width, height),
              )),
              SingleChildScrollView(
                child: Image.asset(
                  'assets/image/quran_reading.png',
                  width: width / 1.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Anda belum memiliki akun? '),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DaftarPage()));
                          },
                          child: Text('Daftar',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
            child: Container(
              child: _buildLoginCard(width, _username, _password),
            ),
          )
        ],
      )),
    );
  }
}