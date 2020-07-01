import 'package:flutter/material.dart';
import 'package:flutter_base_source/base/LoadingNotifier.dart';
import 'package:flutter_base_source/utils/MySharePref.dart';
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
      runApp(
        ChangeNotifierProvider<LoadingNotifier>(
            create: (_) => LoadingNotifier(false), child: MainApp()),
      );
    });
  }

  String get name => runtimeType.toString();
}
