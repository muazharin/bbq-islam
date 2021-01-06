import 'package:http/http.dart' as http;
import 'package:alba_ta/model/user_model.dart';
import 'package:alba_ta/model/baseurl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  static Future<List<Datum>> getUsers() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String key = sp.getString('key');
    String id = sp.getString('id');
    try {
      final response =
          await http.get(Baseurl.user + '?BBQ-KEY=' + key + '&id=' + id);
      if (200 == response.statusCode) {
        final List<Datum> users = userFromJson(response.body).data;
        return users;
      } else {
        return List<Datum>();
      }
    } catch (e) {
      return List<Datum>();
    }
  }
}
