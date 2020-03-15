import 'package:flutter/material.dart';

class HurufDetail extends StatefulWidget {
  final String huruf;
  HurufDetail(this.huruf);
  @override
  _HurufDetailState createState() => _HurufDetailState(this.huruf);
}

Widget _backGr(double width, double height, BuildContext context) {
  return Container(
    width: width,
    height: height / 2.5,
    decoration: BoxDecoration(
        color: Color(0xFF00a5b3),
        image: DecorationImage(
            image: ExactAssetImage('assets/image/bcislam.jpg'),
            fit: BoxFit.cover)),
    child: Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: <Widget>[
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Bimbingan Belajar Qur\'an',
              style: TextStyle(fontSize: width / 15, color: Colors.white),
            ),
          )
        ],
      ),
    ),
  );
}

class _HurufDetailState extends State<HurufDetail> {
  final String text;
  _HurufDetailState(this.text);
  bool _visFatah = false;
  bool _visFatahTain = false;
  bool _visKasrah = false;
  bool _visKasrahTain = false;
  bool _visDommah = false;
  bool _visDommahTain = false;

  final String url = "http://rest-api.sidakmorowali.com/audio/fatah_a.mp3";
  // Audio audio;
  void _vis() {
    setState(() {
      _visFatah = false;
      _visFatahTain = false;
      _visKasrah = false;
      _visKasrahTain = false;
      _visDommah = false;
      _visDommahTain = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Container(
              child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: _backGr(width, height, context),
          ),
          Container(
            width: width,
            height: height / 1.4,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(72),
                )),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xFF00a5b3),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: _vis,
                                child: Icon(
                                  Icons.refresh,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.volume_up,
                                ),
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: Column(
                            children: <Widget>[
                              Visibility(
                                visible: _visFatah,
                                child: Image.asset('assets/huruf/fathah.png',
                                    width: width / 8),
                              ),
                              Visibility(
                                visible: _visFatahTain,
                                child: Image.asset(
                                    'assets/huruf/fathahtain.png',
                                    width: width / 8),
                              ),
                              Visibility(
                                visible: _visDommah,
                                child: Image.asset('assets/huruf/dhommah.png',
                                    width: width / 8),
                              ),
                              Visibility(
                                visible: _visDommahTain,
                                child: Image.asset(
                                    'assets/huruf/dhomahtain.png',
                                    width: width / 8),
                              ),
                              Image.asset('assets/huruf/' + text + ".png",
                                  width: width / 8),
                              Visibility(
                                visible: _visKasrah,
                                child: Image.asset('assets/huruf/fathah.png',
                                    width: width / 8),
                              ),
                              Visibility(
                                visible: _visKasrahTain,
                                child: Image.asset(
                                    'assets/huruf/fathahtain.png',
                                    width: width / 8),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: FlatButton(
                                          onPressed: () {
                                            _vis();
                                            setState(() {
                                              _visFatah = true;
                                            });
                                          },
                                          child: Text('Fathah'))),
                                  Expanded(
                                      child: FlatButton(
                                          onPressed: () {
                                            _vis();
                                            setState(() {
                                              _visFatahTain = true;
                                            });
                                          },
                                          child: Text('Fathahtain'))),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: FlatButton(
                                          onPressed: () {
                                            _vis();
                                            setState(() {
                                              _visKasrah = true;
                                            });
                                          },
                                          child: Text('Kasroh'))),
                                  Expanded(
                                      child: FlatButton(
                                          onPressed: () {
                                            _vis();
                                            setState(() {
                                              _visKasrahTain = true;
                                            });
                                          },
                                          child: Text('Kasrohtain'))),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: FlatButton(
                                          onPressed: () {
                                            _vis();
                                            setState(() {
                                              _visDommah = true;
                                            });
                                          },
                                          child: Text('Dhommah'))),
                                  Expanded(
                                      child: FlatButton(
                                          onPressed: () {
                                            _vis();
                                            setState(() {
                                              _visDommahTain = true;
                                            });
                                          },
                                          child: Text('Dhommahtain'))),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
              ],
            ),
          )
        ],
      ))),
    );
  }
}
