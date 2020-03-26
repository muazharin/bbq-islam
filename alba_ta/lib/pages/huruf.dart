import 'package:flutter/material.dart';
import 'package:alba_ta/pages/huruf_detail.dart';
import 'package:alba_ta/source/source.dart';

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
    String text,
    double width,
    double height,
    BuildContext context,
    String a,
    String b,
    String c,
    String d,
    String e,
    String f,
    String g) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HurufDetail(text, a, b, c, d, e, f, g)));
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

class _HurufState extends State<Huruf> {
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
                    _hurufHijayah(
                        'ث',
                        width,
                        height,
                        context,
                        Source.ts0,
                        Source.ts1,
                        Source.ts2,
                        Source.ts3,
                        Source.ts4,
                        Source.ts5,
                        Source.ts6),
                    _hurufHijayah(
                        'ت',
                        width,
                        height,
                        context,
                        Source.t0,
                        Source.t1,
                        Source.t2,
                        Source.t3,
                        Source.t4,
                        Source.t5,
                        Source.t6),
                    _hurufHijayah(
                        'ب',
                        width,
                        height,
                        context,
                        Source.b0,
                        Source.b1,
                        Source.b2,
                        Source.b3,
                        Source.b4,
                        Source.b5,
                        Source.b6),
                    _hurufHijayah(
                        'ا',
                        width,
                        height,
                        context,
                        Source.a0,
                        Source.a1,
                        Source.a2,
                        Source.a3,
                        Source.a4,
                        Source.a5,
                        Source.a6),
                    _hurufHijayah(
                        'د',
                        width,
                        height,
                        context,
                        Source.d0,
                        Source.d1,
                        Source.d2,
                        Source.d3,
                        Source.d4,
                        Source.d5,
                        Source.d6),
                    _hurufHijayah(
                        'خ',
                        width,
                        height,
                        context,
                        Source.kh0,
                        Source.kh1,
                        Source.kh2,
                        Source.kh3,
                        Source.kh4,
                        Source.kh5,
                        Source.kh6),
                    _hurufHijayah(
                        'ح',
                        width,
                        height,
                        context,
                        Source.h0,
                        Source.h1,
                        Source.h2,
                        Source.h3,
                        Source.h4,
                        Source.h5,
                        Source.h6),
                    _hurufHijayah(
                        'ج',
                        width,
                        height,
                        context,
                        Source.j0,
                        Source.j1,
                        Source.j2,
                        Source.j3,
                        Source.j4,
                        Source.j5,
                        Source.j6),
                    _hurufHijayah(
                        'س',
                        width,
                        height,
                        context,
                        Source.s0,
                        Source.s1,
                        Source.s2,
                        Source.s3,
                        Source.s4,
                        Source.s5,
                        Source.s6),
                    _hurufHijayah(
                        'ز',
                        width,
                        height,
                        context,
                        Source.z0,
                        Source.z1,
                        Source.z2,
                        Source.z3,
                        Source.z4,
                        Source.z5,
                        Source.z6),
                    _hurufHijayah(
                        'ر',
                        width,
                        height,
                        context,
                        Source.r0,
                        Source.r1,
                        Source.r2,
                        Source.r3,
                        Source.r4,
                        Source.r5,
                        Source.r6),
                    _hurufHijayah(
                        'ذ',
                        width,
                        height,
                        context,
                        Source.dz0,
                        Source.dz1,
                        Source.dz2,
                        Source.dz3,
                        Source.dz4,
                        Source.dz5,
                        Source.dz6),
                    _hurufHijayah(
                        'ط',
                        width,
                        height,
                        context,
                        Source.th0,
                        Source.th1,
                        Source.th2,
                        Source.th3,
                        Source.th4,
                        Source.th5,
                        Source.th6),
                    _hurufHijayah(
                        'ض',
                        width,
                        height,
                        context,
                        Source.dh0,
                        Source.dh1,
                        Source.dh2,
                        Source.dh3,
                        Source.dh4,
                        Source.dh5,
                        Source.dh6),
                    _hurufHijayah(
                        'ص',
                        width,
                        height,
                        context,
                        Source.sh0,
                        Source.sh1,
                        Source.sh2,
                        Source.sh3,
                        Source.sh4,
                        Source.sh5,
                        Source.sh6),
                    _hurufHijayah(
                        'ش',
                        width,
                        height,
                        context,
                        Source.sy0,
                        Source.sy1,
                        Source.sy2,
                        Source.sy3,
                        Source.sy4,
                        Source.sy5,
                        Source.sy6),
                    _hurufHijayah(
                        'ف',
                        width,
                        height,
                        context,
                        Source.f0,
                        Source.f1,
                        Source.f2,
                        Source.f3,
                        Source.f4,
                        Source.f5,
                        Source.f6),
                    _hurufHijayah(
                        'غ',
                        width,
                        height,
                        context,
                        Source.gh0,
                        Source.gh1,
                        Source.gh2,
                        Source.gh3,
                        Source.gh4,
                        Source.gh5,
                        Source.gh6),
                    _hurufHijayah(
                        'ع',
                        width,
                        height,
                        context,
                        Source.ai0,
                        Source.ai1,
                        Source.ai2,
                        Source.ai3,
                        Source.ai4,
                        Source.ai5,
                        Source.ai6),
                    _hurufHijayah(
                        'ظ',
                        width,
                        height,
                        context,
                        Source.zh0,
                        Source.zh1,
                        Source.zh2,
                        Source.zh3,
                        Source.zh4,
                        Source.zh5,
                        Source.zh6),
                    _hurufHijayah(
                        'م',
                        width,
                        height,
                        context,
                        Source.m0,
                        Source.m1,
                        Source.m2,
                        Source.m3,
                        Source.m4,
                        Source.m5,
                        Source.m6),
                    _hurufHijayah(
                        'ل',
                        width,
                        height,
                        context,
                        Source.l0,
                        Source.l1,
                        Source.l2,
                        Source.l3,
                        Source.l4,
                        Source.l5,
                        Source.l6),
                    _hurufHijayah(
                        'ك',
                        width,
                        height,
                        context,
                        Source.k0,
                        Source.k1,
                        Source.k2,
                        Source.k3,
                        Source.k4,
                        Source.k5,
                        Source.k6),
                    _hurufHijayah(
                        'ق',
                        width,
                        height,
                        context,
                        Source.q0,
                        Source.q1,
                        Source.q2,
                        Source.q3,
                        Source.q4,
                        Source.q5,
                        Source.q6),
                    _hurufHijayah(
                        'ء',
                        width,
                        height,
                        context,
                        Source.aa0,
                        Source.aa1,
                        Source.aa2,
                        Source.aa3,
                        Source.aa4,
                        Source.aa5,
                        Source.aa6),
                    _hurufHijayah(
                        'ه',
                        width,
                        height,
                        context,
                        Source.ha0,
                        Source.ha1,
                        Source.ha2,
                        Source.ha3,
                        Source.ha4,
                        Source.ha5,
                        Source.ha6),
                    _hurufHijayah(
                        'و',
                        width,
                        height,
                        context,
                        Source.w0,
                        Source.w1,
                        Source.w2,
                        Source.w3,
                        Source.w4,
                        Source.w5,
                        Source.w6),
                    _hurufHijayah(
                        'ن',
                        width,
                        height,
                        context,
                        Source.n0,
                        Source.n1,
                        Source.n2,
                        Source.n3,
                        Source.n4,
                        Source.n5,
                        Source.n6),
                    _hurufHijayah(
                        'ي',
                        width,
                        height,
                        context,
                        Source.y0,
                        Source.y1,
                        Source.y2,
                        Source.y3,
                        Source.y4,
                        Source.y5,
                        Source.y6),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

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
