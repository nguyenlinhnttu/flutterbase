import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_source/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'base/app_localizations.dart';
import 'environments/development.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => Development());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
      systemNavigationBarColor: Colors.white, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ));

    return MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale('vi', 'VN'), // Vietnam
        ],
        // Returns a locale which will be used by the app
        localeResolutionCallback: (locale, supportedLocales) {
          if (locale == null) {
            return supportedLocales.first;
          }
          // Check if the current device locale is supported
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          // If the locale of the device is not supported, use the first one
          // from the list (English, in this case).
          return supportedLocales.first;
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          primaryColorBrightness: Brightness.light,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutePaths.Splash,
        onGenerateRoute: Router.generateRoute);
  }
}
