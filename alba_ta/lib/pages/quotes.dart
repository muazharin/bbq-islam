import 'package:flutter/material.dart';
import 'package:alba_ta/model/login_option.dart';
import 'package:alba_ta/pages/login.dart';

class Quotes extends StatefulWidget {
  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  @override
  Widget build(BuildContext context) {
    switch (log) {
      case LoginStatus.isSignOut:
        return LoginPage();
        break;
      case LoginStatus.isSignIn:
        return Scaffold(
          body: Center(
            child: Text('Quotes'),
          ),
        );
      default:
        return Container();
    }
  }
}
