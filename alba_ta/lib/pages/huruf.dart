import 'package:flutter/material.dart';
import 'package:alba_ta/pages/huruf_detail.dart';

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
            image: ExactAssetImage('assets/image/bcislam.jpg'),
            fit: BoxFit.cover)),
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
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
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

Widget _hurufHijayah(
    String text, double width, double height, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HurufDetail(text)));
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    text,
                    style: TextStyle(fontSize: width / 15),
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

Widget _menuHuruf(double width, double height, BuildContext context) {
  return Container(
    width: width,
    height: height / 1.35,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(72),
          //  topRight: Radius.circular(72)
        )),
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
                  _hurufHijayah('ث', width, height, context),
                  _hurufHijayah('ت', width, height, context),
                  _hurufHijayah('ب', width, height, context),
                  _hurufHijayah('ا', width, height, context),
                  _hurufHijayah('د', width, height, context),
                  _hurufHijayah('خ', width, height, context),
                  _hurufHijayah('ح', width, height, context),
                  _hurufHijayah('ج', width, height, context),
                  _hurufHijayah('س', width, height, context),
                  _hurufHijayah('ز', width, height, context),
                  _hurufHijayah('ر', width, height, context),
                  _hurufHijayah('ذ', width, height, context),
                  _hurufHijayah('ط', width, height, context),
                  _hurufHijayah('ض', width, height, context),
                  _hurufHijayah('ص', width, height, context),
                  _hurufHijayah('ش', width, height, context),
                  _hurufHijayah('ف', width, height, context),
                  _hurufHijayah('غ', width, height, context),
                  _hurufHijayah('ع', width, height, context),
                  _hurufHijayah('ظ', width, height, context),
                  _hurufHijayah('لا', width, height, context),
                  _hurufHijayah('ل', width, height, context),
                  _hurufHijayah('ك', width, height, context),
                  _hurufHijayah('ق', width, height, context),
                  _hurufHijayah('ه', width, height, context),
                  _hurufHijayah('و', width, height, context),
                  _hurufHijayah('ن', width, height, context),
                  _hurufHijayah('م', width, height, context),
                  _hurufHijayah('ي', width, height, context),
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
              child: _menuHuruf(width, height, context),
            )
          ],
        ),
      ),
    );
  }
}
