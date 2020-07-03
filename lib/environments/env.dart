import 'package:flutter/material.dart';
import 'package:flutter_base_source/providers/app_provider.dart';
import 'package:flutter_base_source/providers/login_provider.dart';
import 'package:flutter_base_source/providers/user_provider.dart';
import 'package:flutter_base_source/utils/my_share_pref.dart';
import 'package:provider/provider.dart';

import '../main.dart';

//https://github.com/ROTGP/flutter_environments
//flutter run lib/environments/development.dart
//flutter run lib/environments/production.dart
class Env {
  static Env value;

  String baseUrl;

  Env() {
    value = this;
    MySharePref.init().then((value) {
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => LoginProvider()),
        ],
        child: MainApp(),
      ));
    });
  }

  String get name => runtimeType.toString();
}
