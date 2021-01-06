import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  bool status;
  List<Datum> data;

  User({
    this.status,
    this.data,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String idUser;
  String username;
  String password;
  String email;
  String number;
  String gender;
  String photo;

  Datum({
    this.idUser,
    this.username,
    this.password,
    this.email,
    this.number,
    this.gender,
    this.photo,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idUser: json["id_user"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        number: json["number"],
        gender: json["gender"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "username": username,
        "password": password,
        "email": email,
        "number": number,
        "gender": gender,
        "photo": photo,
      };
}
