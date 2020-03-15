import 'package:flutter/material.dart';

class Huruf extends StatefulWidget {
  @override
  _HurufState createState() => _HurufState();
}

Widget _appBar(double width, double height, BuildContext context) {
  return Container(
    width: width,
    height: height / 2.5,
    decoration: BoxDecoration(
        color: Color(0xFF00a5b3),
        image: DecorationImage(
            image: ExactAssetImage('assets/image/masjidilharom.jpeg'),
            fit: BoxFit.fill)),
    child: Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Huruf',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 30.0),
          Text(
            'بسم الله الرحمن الرحيم',
            style: TextStyle(fontSize: 36.0, color: Colors.white),
          )
        ],
      ),
    ),
  );
}

Widget _hurufHijayah(String text, double width, double height) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Card(
      child: InkWell(
        onTap: () {},
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/huruf/' + text + '.png',
                    // width: width,
                    height: height / 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _menuHuruf(double width, double height) {
  return Container(
    width: width,
    height: height / 1.4,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(64))),
    child: Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 4,
                children: <Widget>[
                  _hurufHijayah('ث', width, height),
                  _hurufHijayah('ت', width, height),
                  _hurufHijayah('ب', width, height),
                  _hurufHijayah('ا', width, height),
                  _hurufHijayah('د', width, height),
                  _hurufHijayah('خ', width, height),
                  _hurufHijayah('ح', width, height),
                  _hurufHijayah('ج', width, height),
                  _hurufHijayah('س', width, height),
                  _hurufHijayah('ز', width, height),
                  _hurufHijayah('ر', width, height),
                  _hurufHijayah('ذ', width, height),
                  _hurufHijayah('ط', width, height),
                  _hurufHijayah('ض', width, height),
                  _hurufHijayah('ص', width, height),
                  _hurufHijayah('ش', width, height),
                  _hurufHijayah('ف', width, height),
                  _hurufHijayah('غ', width, height),
                  _hurufHijayah('ع', width, height),
                  _hurufHijayah('ظ', width, height),
                  _hurufHijayah('لا', width, height),
                  _hurufHijayah('ل', width, height),
                  _hurufHijayah('ك', width, height),
                  _hurufHijayah('ق', width, height),
                  _hurufHijayah('ه', width, height),
                  _hurufHijayah('و', width, height),
                  _hurufHijayah('ن', width, height),
                  _hurufHijayah('م', width, height),
                  _hurufHijayah('ي', width, height),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

class _HurufState extends State<Huruf> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _appBar(width, height, context),
            Align(
              alignment: Alignment.bottomCenter,
              child: _menuHuruf(width, height),
            )
          ],
        ),
      ),
    );
  }
}
