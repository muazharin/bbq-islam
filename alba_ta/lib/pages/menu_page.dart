// import 'package:alba_ta/model/baseurl.dart';
import 'package:flutter/material.dart';
import 'package:alba_ta/model/login_option.dart';
import 'package:alba_ta/pages/login.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Widget _logOpti(String assets, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Row(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          Image.asset(
            assets,
            width: 24.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _showAlert(String message) {
    return AlertDialog(
      title: Text('Konfirmasi'),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No')),
        FlatButton(
            onPressed: () {
              logout();
              Navigator.popAndPushNamed(context, '/Home');
            },
            child: Text('Yes'))
      ],
    );
  }

  Widget _buildTopCard(double width, double height, LoginStatus log) {
    return Container(
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
                log == LoginStatus.isSignOut
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: _logOpti('assets/image/login.png', 'Login '))
                    : InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) => _showAlert(
                                  'Apakah Anda yakin ingin keluar?'));
                        },
                        child: _logOpti('assets/image/logout.png', 'Logout '))
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

  // String username = '';
  // String id = '';
  // String key = '';
  logout() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      sp.setInt('value', null);
      sp.setString('id', null);
      sp.setString('username', null);
      sp.setString('password', null);
      sp.setString('email', null);
      sp.setString('number', null);
      sp.setString('key', null);
      // Baseurl.user = Baseurl.ip + "/api/user";
    });
  }

  var value;
  getPref() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      // username = sp.getString('username');
      // id = sp.getString('id');
      // key = sp.getString('key');
      // Baseurl.user = Baseurl.user + '?BBQ-KEY=' + key + '&id=' + id;
      value = sp.getInt('value');
      log = value == 1 ? LoginStatus.isSignIn : LoginStatus.isSignOut;
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    String materi = 'Huruf';
    String praktek = 'Praktek';
    String quiz = 'Quiz';
    String info = 'Info';
    String quotes = 'Quotes';
    String profil = 'Profil';
    // print(username);
    // print(Baseurl.user);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: _buildTopCard(width, height, log),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
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
                  _buildMenuCard(quotes, width, context),
                  _buildMenuCard(info, width, context),
                  Visibility(
                    child: Hero(
                        tag: 'photo',
                        child: _buildMenuCard(profil, width, context)),
                    visible: log == LoginStatus.isSignOut ? false : true,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
