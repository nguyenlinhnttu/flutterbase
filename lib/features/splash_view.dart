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
  UserProvider userProvider;

  nextPage() async {
    Navigator.pushReplacementNamed(context, RoutePaths.SignIn);
  }

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    Timer(Duration(milliseconds: 500), () async {
//      userProvider.getUserInfo(1).then((value) => {
//            if (!value) {onApiError(userProvider.apiError)} else {nextPage()}
//          });
      nextPage();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildApp(BuildContext context) {
    return Consumer<UserProvider>(builder:
        (BuildContext context, UserProvider userProvider, Widget child) {
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
            ),
            userProvider.isLoading
                ? CommonView.loadingView(userProvider.isLoading)
                : Container(),
          ]),
        ),
      );
    });
  }
}
