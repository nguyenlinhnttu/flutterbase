import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_source/utils/my_share_pref.dart';
import 'package:flutter_base_source/utils/my_theme.dart';

class AppProvider extends ChangeNotifier {
  ThemeData theme = MyTheme.lightTheme;

  AppProvider() {
    _getTheme();
  }

  void _changeThemeStyle() {
    bool isDark = MySharePref.getDarkModeValue() == 2;
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark ? MyTheme.darkPrimary : MyTheme.lightPrimary,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));
    notifyListeners();
  }

  ThemeData getTheme(value) {
    return theme;
  }
  void switchTheme(){
    bool isDark = MySharePref.getDarkModeValue() == 2;
    if (isDark){
      MySharePref.saveDarkModeValue(1);
    } else {
      MySharePref.saveDarkModeValue(2);
    }
    _getTheme();
  }


  Future _getTheme() async {
    bool isDark = MySharePref.getDarkModeValue() == 2;
    if (isDark) {
      theme = MyTheme.darkTheme;
    } else {
      theme = MyTheme.lightTheme;
    }
    _changeThemeStyle();
  }
}
