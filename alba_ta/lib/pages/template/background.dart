import 'package:flutter/material.dart';

Widget _text(String text) {
  return Text(text, style: TextStyle(color: Colors.white));
}

Widget backGr(double width, double height, BuildContext context) {
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
          Row(
            children: <Widget>[
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      _text('Copyright '),
                      Icon(
                        Icons.copyright,
                        color: Colors.white,
                      ),
                      _text(' 2020 by '),
                      _text('Muaz_Dev '),
                    ],
                  ),
                ),
              ),
              Spacer()
            ],
          ),
        ],
      ),
    ),
  );
}
