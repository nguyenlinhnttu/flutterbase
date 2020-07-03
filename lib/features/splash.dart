import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_source/base/base_state_widget.dart';
import 'package:flutter_base_source/providers/user_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends BaseStateWidget<Splash> {
  nextPage() async {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: HomeView(),
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    Timer(Duration(milliseconds: 500), () {
      Provider.of<UserProvider>(context, listen: false).getUserInfo(1);
    });
    Provider.of<UserProvider>(context, listen: false).apiError.listen((response) {
        onApiError(response);
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
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
                  Text(
                    userProvider.getUserName(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Image.asset(
                      "assets/icons/ic_splash.png",
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SafeArea(
                child: InkWell(
                  onTap: () {
                    nextPage();
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: EdgeInsets.only(right: 40, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Theme.of(context).accentColor, width: 1),
                      ),
                      child: Text(
                        'Start ...!',
                      )),
                ),
              ),
            ),
            userProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : Container(),
          ]),
        ),
      );
    });
  }
}
