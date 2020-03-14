import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:alba_ta/pages/materi.dart';
import 'package:alba_ta/pages/praktek.dart';
import 'package:alba_ta/pages/quiz.dart';
import 'package:alba_ta/pages/info.dart';

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
          '/Materi': (BuildContext context) => new Materi(),
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
      // imageBackground: new AssetImage('assets/image/logoku.jpg'),
      image: Image.asset('assets/image/logoku.jpg'),
      // backgroundColor: Colors.red,
      seconds: 3,
      navigateAfterSeconds: new AfterSplash(),
      loaderColor: Colors.red,
    );
  }
}

class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

Widget _buildTopCard(double width, double height) {
  return SafeArea(
    child: Container(
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
                  'BBQ',
                  style: TextStyle(color: Colors.white, fontSize: 48.0),
                ),
                Spacer(),
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                )
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
    ),
  );
}

Widget _buildMenuCard(String text, double width, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/' + text);
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/image/' + text + '.png',
                  width: width / 5,
                ),
                Spacer(),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    String materi = 'Materi';
    String praktek = 'Praktek';
    String quiz = 'Quiz';
    String info = 'Info';
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _buildTopCard(width, height),
                ),
              ),
              Image.asset(
                'assets/image/istanbul.png',
                width: width / 1.8,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Copyright '),
                      Icon(Icons.copyright),
                      Text(' 2020 by '),
                      Text('Muaz_Dev', style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                _buildMenuCard(materi, width, context),
                _buildMenuCard(praktek, width, context),
                _buildMenuCard(quiz, width, context),
                _buildMenuCard(info, width, context)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
