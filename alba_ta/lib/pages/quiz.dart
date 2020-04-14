import 'package:flutter/material.dart';
import 'package:alba_ta/model/login_option.dart';
import 'package:alba_ta/pages/login.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    switch (log) {
      case LoginStatus.isSignOut:
        return LoginPage();
        break;
      case LoginStatus.isSignIn:
        return Scaffold(
          body: Center(
            child: Text('Quiz'),
          ),
        );
      default:
        return Container();
    }
  }
}
