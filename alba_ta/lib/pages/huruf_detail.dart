import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:alba_ta/model/audio_provider.dart';
import 'package:alba_ta/pages/template/background.dart';

class HurufDetail extends StatefulWidget {
  final String huruf;
  final String a;
  final String b;
  final String c;
  final String d;
  final String e;
  final String f;
  final String g;

  HurufDetail(
      this.huruf, this.a, this.b, this.c, this.d, this.e, this.f, this.g);
  @override
  _HurufDetailState createState() => _HurufDetailState(
      this.huruf, this.a, this.b, this.c, this.d, this.e, this.f, this.g);
}

Widget _visible(_visO, String text, double width) {
  return Visibility(
    visible: _visO,
    child: Image.asset(text, width: width / 8),
  );
}

class _HurufDetailState extends State<HurufDetail> {
  Widget _row(String text, VoidCallback onpressed) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: RaisedButton(
          onPressed: onpressed,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          color: Color(0xFF00a5b3),
        ),
      ),
    );
  }

  final String text;
  final String a;
  final String b;
  final String c;
  final String d;
  final String e;
  final String f;
  final String g;

  _HurufDetailState(
      this.text, this.a, this.b, this.c, this.d, this.e, this.f, this.g);

  AudioPlayer audioPlayer = new AudioPlayer();

  bool _visFatah = false;
  bool _visFatahTain = false;
  bool _visKasrah = false;
  bool _visKasrahTain = false;
  bool _visDommah = false;
  bool _visDommahTain = false;
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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void snackBar() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content:
          Text('Untuk mendengarkan audio, pastikan jaringan sedang online'),
      action: SnackBarAction(
        label: 'Ok',
        textColor: Colors.white,
        onPressed: () {
          _scaffoldKey.currentState.mounted;
        },
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
          child: Container(
              child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: backGr(width, height, context),
          ),
          Container(
            width: width,
            height: height / 1.4,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(72),
                )),
            child: SingleChildScrollView(
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
                        Expanded(
                          child: Center(
                            child: Text(
                              'Tanda Baca',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                                  onTap: () {
                                    _vis();
                                    setState(() async {
                                      AudioProvider audioProvider =
                                          new AudioProvider(a);
                                      String localUrl =
                                          await audioProvider.load();
                                      audioPlayer.play(localUrl, isLocal: true);
                                    });
                                  },
                                  child: Icon(
                                    Icons.volume_up,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: snackBar,
                                  child: Icon(
                                    Icons.info_outline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Column(
                              children: <Widget>[
                                _visible(_visFatah, 'assets/huruf/fathah.png',
                                    width),
                                _visible(_visFatahTain,
                                    'assets/huruf/fathahtain.png', width),
                                _visible(_visDommah, 'assets/huruf/dhommah.png',
                                    width),
                                _visible(_visDommahTain,
                                    'assets/huruf/dhomahtain.png', width),
                                text != 'ء'
                                    ? Image.asset(
                                        'assets/huruf/' + text + ".png",
                                        width: width / 8)
                                    : Text(
                                        text,
                                        style: TextStyle(fontSize: width / 7),
                                      ),
                                _visible(_visKasrah, 'assets/huruf/fathah.png',
                                    width),
                                _visible(_visKasrahTain,
                                    'assets/huruf/fathahtain.png', width),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    _row('Fathah', () {
                                      setState(() {
                                        _vis();
                                        _visFatah = true;
                                      });
                                      setState(() async {
                                        AudioProvider audioProvider =
                                            new AudioProvider(b);
                                        String localUrl =
                                            await audioProvider.load();
                                        audioPlayer.play(localUrl,
                                            isLocal: true);
                                      });
                                    }),
                                    _row('Fathahtain', () {
                                      setState(() {
                                        _vis();
                                        _visFatahTain = true;
                                      });
                                      setState(() async {
                                        AudioProvider audioProvider =
                                            new AudioProvider(e);
                                        String localUrl =
                                            await audioProvider.load();
                                        audioPlayer.play(localUrl,
                                            isLocal: true);
                                      });
                                    }),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    _row('Kasroh', () {
                                      setState(() {
                                        _vis();
                                        _visKasrah = true;
                                      });
                                      setState(() async {
                                        AudioProvider audioProvider =
                                            new AudioProvider(c);
                                        String localUrl =
                                            await audioProvider.load();
                                        audioPlayer.play(localUrl,
                                            isLocal: true);
                                      });
                                    }),
                                    _row('Kasrohtain', () {
                                      setState(() {
                                        _vis();
                                        _visKasrahTain = true;
                                      });
                                      setState(() async {
                                        AudioProvider audioProvider =
                                            new AudioProvider(f);
                                        String localUrl =
                                            await audioProvider.load();
                                        audioPlayer.play(localUrl,
                                            isLocal: true);
                                      });
                                    }),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    _row('Dhommah', () {
                                      setState(() {
                                        _vis();
                                        _visDommah = true;
                                      });
                                      setState(() async {
                                        AudioProvider audioProvider =
                                            new AudioProvider(d);
                                        String localUrl =
                                            await audioProvider.load();
                                        audioPlayer.play(localUrl,
                                            isLocal: true);
                                      });
                                    }),
                                    _row('Dhommahtain', () {
                                      setState(() {
                                        _vis();
                                        _visDommahTain = true;
                                      });
                                      setState(() async {
                                        AudioProvider audioProvider =
                                            new AudioProvider(g);
                                        String localUrl =
                                            await audioProvider.load();
                                        audioPlayer.play(localUrl,
                                            isLocal: true);
                                      });
                                    }),
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
            ),
          )
        ],
      ))),
    );
  }
}
