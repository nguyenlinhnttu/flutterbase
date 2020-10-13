import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_source/base/base_state_widget.dart';
import 'package:flutter_base_source/providers/user_provider.dart';
import 'package:flutter_base_source/router.dart';
import 'package:flutter_base_source/widgets/common_view.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends BaseStateWidget<SplashView> {

  nextPage() async {
    Navigator.pushReplacementNamed(context, RoutePaths.SignIn);
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 500), () async {
      nextPage();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildApp(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Container(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "assets/icons/ic_splash.png",
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
