import 'package:shared_preferences/shared_preferences.dart';

class MySharePref {
  static SharedPreferences prefs;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static final String _token = "token";
  static final String _userInfo = "userInfo";

  static void saveToken(String token) async {
    prefs.setString(_token, token);
  }

  static Future<String> getToken() async {
    return prefs.getString(_token) ?? '';
  }

  static void removeUserInfo() async {
    prefs.remove(_userInfo);
    prefs.remove(_token);
  }
}
