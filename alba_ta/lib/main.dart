import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alba_ta/pages/menu_page.dart';
import 'package:alba_ta/pages/huruf.dart';
import 'package:alba_ta/pages/praktek.dart';
import 'package:alba_ta/pages/quiz.dart';
import 'package:alba_ta/pages/info.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        routes: <String, WidgetBuilder>{
          '/Huruf': (BuildContext context) => new Huruf(),
          '/Praktek': (BuildContext context) => new Praktek(),
          '/Quiz': (BuildContext context) => new Quiz(),
          '/Info': (BuildContext context) => new Info(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      image: Image.asset('assets/image/logoku.jpg'),
      seconds: 3,
      navigateAfterSeconds: new MenuPage(),
      loaderColor: Color(0xFF00a5b3),
    );
  }
}
