import 'package:flutter/material.dart';
import 'package:alba_ta/model/login_option.dart';
import 'package:alba_ta/pages/login.dart';

class Praktek extends StatefulWidget {
  @override
  _PraktekState createState() => _PraktekState();
}

class _PraktekState extends State<Praktek> {
  @override
  Widget build(BuildContext context) {
    switch (log) {
      case LoginStatus.isSignOut:
        return LoginPage();
        break;
      case LoginStatus.isSignIn:
        return Scaffold(
          body: Center(
            child: Text('Praktek'),
          ),
        );
      default:
        return Container();
    }
  }
}
