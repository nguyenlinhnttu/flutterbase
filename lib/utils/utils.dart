import 'package:flutter/material.dart';

class HexColor extends Color {
  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(getColorFromHex(hexColor));
}

class AppColors {
  static final Color primary = HexColor('6caddf');
  static final Color blue = HexColor('2979ff');
  static final Color red = HexColor('fc625d');
  static final Color rose = HexColor('FBEEEE');
  static final Color yellow = HexColor('fdbd41');
  static final Color black = HexColor('212121');
  static const Color transparent = Color(0x00000000);
}

class Utils {
  static bool isUserNameValidated(String username) {
    RegExp regex =
        RegExp(r'^(?=.{5,100}$)(?![- ])(?!.*[-]{2})[a-z0-9- ]+(?<![-])$');
    return regex.hasMatch(username);
  }

  static bool isEmailValidated(String email) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(email);
  }

  static bool isEmpty(String string) {
    return string == null || string == "";
  }
}
