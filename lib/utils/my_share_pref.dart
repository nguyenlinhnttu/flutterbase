import 'dart:convert';

import 'package:flutter_base_source/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharePref {
  static SharedPreferences prefs;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static final String _token = "token";
  static final String _userInfo = "userInfo";
  static final String _DARK_MODE = "_DARK_MODE";

  static void saveToken(String token) async {
    prefs.setString(_token, token);
  }

  static Future<String> getToken() async {
    return prefs.getString(_token) ?? '';
  }

  static void saveUserInfo(User user) async {
    String data = json.encode(user);
    print(data.toString());
    prefs.setString(_userInfo, data);
  }

  static void removeUserInfo() async {
    prefs.remove(_userInfo);
    prefs.remove(_token);
  }

  static void saveDarkModeValue(int value) {
    prefs.setInt(_DARK_MODE, value);
  }

  static int getDarkModeValue() {
    int value = prefs.getInt(_DARK_MODE) ?? 1;
    return value;
  }
}
