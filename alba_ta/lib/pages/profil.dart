import 'dart:io';
import 'package:flutter/material.dart';
import 'package:alba_ta/model/login_option.dart';
import 'package:alba_ta/pages/login.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:alba_ta/model/user_model.dart';
import 'package:alba_ta/services/services.dart';
import 'package:alba_ta/model/baseurl.dart';
import 'package:alba_ta/pages/template/background.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as Img;
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:async/async.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  List<Datum> _datum;
  bool _loading = true;
  File _image;

  Future getImageGallery(String id) async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, width: 500);

    var compressImg = new File("$path/image_$id.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      _image = compressImg;
      _updateImage(id);
      print(_image);
    });
  }

  Future getImageCamera(String id) async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, width: 500);

    var compressImg = new File("$path/image_$id.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      _image = compressImg;
      _updateImage(id);
    });
  }

  Widget _showAlert(String message) {
    return AlertDialog(
      title: Text('Info'),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              setState(() {
                imageCache.clear();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/Profil');
              });
            },
            child: Text('Ok'))
      ],
    );
  }

  _updateImage(String id) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String key = sp.getString('key');
    print(key);
    try {
      var stream = http.ByteStream(DelegatingStream.typed(_image.openRead()));
      var length = await _image.length();
      var uri = Uri.parse(Baseurl.updateImage);
      var request = http.MultipartRequest("POST", uri);
      request.fields['id'] = id;
      request.fields['BBQ-KEY'] = key;
      request.files.add(http.MultipartFile("image", stream, length,
          filename: path.basename(_image.path)));
      var response = await request.send();
      if (response.contentLength > 2) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) =>
                _showAlert('Berhasil mengubah gambar'));
      } else {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) =>
                _showAlert('Gagal mengubah gambar'));
      }
    } catch (e) {}
  }

  @override
  void initState() {
    Services.getUsers().then((datum) {
      setState(() {
        _datum = datum;
        _loading = false;
      });
    });
    super.initState();
  }

  Widget _dataUser(Icon icon, String name) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 16,
        ),
        icon,
        Spacer(),
        Text(name),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }

  Widget _pilihGambar(String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Icon(
            text == 'Galery' ? Icons.image : Icons.camera_alt,
            size: 40,
            color: Color(0xFF00a5b3),
          ),
          Text(text)
        ],
      ),
    );
  }

  void _pilihMode(BuildContext context, String id) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(children: <Widget>[
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () => getImageGallery(id),
                    child: _pilihGambar('Galery'),
                  ),
                  InkWell(
                    onTap: () => getImageCamera(id),
                    child: _pilihGambar('Camera'),
                  ),
                ],
              ),
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    switch (log) {
      case LoginStatus.isSignOut:
        return LoginPage();
        break;
      case LoginStatus.isSignIn:
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: Center(
                    child: _loading ? Text('Loading...') : Text('Profil')),
                backgroundColor: Color(0xFF00a5b3),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.edit),
                  )
                ],
              ),
              body: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: backGr(width, height, context),
                  ),
                  Container(
                    width: width,
                    height: height / 1.6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(72),
                        )),
                  ),
                  Center(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: _datum == null ? 0 : _datum.length,
                              itemBuilder: (context, index) {
                                Datum datum = _datum[index];
                                return Center(
                                  child: Column(children: <Widget>[
                                    Stack(children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return Photos(datum.photo);
                                          }));
                                        },
                                        child: Hero(
                                          tag: 'photo',
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            child: Image(
                                                width: 120,
                                                height: 120,
                                                fit: BoxFit.cover,
                                                image: datum.photo ==
                                                        'Profil.png'
                                                    ? NetworkImage(Baseurl.ip +
                                                        '/assets/image/' +
                                                        datum.photo)
                                                    : NetworkImage(Baseurl.ip +
                                                        '/assets/image/profil/' +
                                                        datum.photo)),
                                          ),
                                        ),
                                      ),
                                      Column(children: <Widget>[
                                        SizedBox(
                                          height: 80,
                                        ),
                                        InkWell(
                                          onTap: () =>
                                              _pilihMode(context, datum.idUser),
                                          child: Card(
                                              child: Icon(Icons.camera_alt)),
                                        ),
                                      ])
                                    ]),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          36, 0, 36, 0),
                                      child: Card(
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: 24,
                                            ),
                                            _dataUser(Icon(Icons.person),
                                                datum.username),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            _dataUser(
                                                Icon(Icons.email), datum.email),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            _dataUser(Icon(Icons.phone),
                                                datum.number),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            _dataUser(
                                                Icon(
                                                    Icons.check_circle_outline),
                                                datum.gender),
                                            SizedBox(
                                              height: 24,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        );
        break;
      default:
        return Container();
        break;
    }
  }
}

class Photos extends StatelessWidget {
  final String photo;
  Photos(this.photo);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: 'photo',
        child: PhotoView(
          imageProvider: photo == 'Profil.png'
              ? NetworkImage(Baseurl.ip + '/assets/image/' + photo)
              : NetworkImage(Baseurl.ip + '/assets/image/profil/' + photo),
        ),
      ),
    );
  }
}
