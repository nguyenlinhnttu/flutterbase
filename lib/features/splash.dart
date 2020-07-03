import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_source/base/base_state_widget.dart';
import 'package:flutter_base_source/providers/user_provider.dart';
import 'package:flutter_base_source/widgets/common_view.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends BaseStateWidget<Splash> {
  UserProvider userProvider;
  nextPage() async {
//    Navigator.push(
//      context,
//      PageTransition(
//        type: PageTransitionType.rightToLeft,
//        child: HomeView(),
//      ),
//    );
    userProvider
        .getUserInfo(123)
        .then((value) => {if (!value) onApiError(userProvider.apiError)});
  }

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    Timer(Duration(milliseconds: 500), () async {
      userProvider
          .getUserInfo(1)
          .then((value) => {if (!value) onApiError(userProvider.apiError)});
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
                ? CommonView.loadingView(userProvider.isLoading)
                : Container(),
          ]),
        ),
      );
    });
  }
}
