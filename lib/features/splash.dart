import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_source/providers/meta_provider.dart';
import 'package:flutter_base_source/widgets/common_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'main_activity.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  nextPage() async {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: MainActivity(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 500), () {
      Provider.of<MetaProvider>(context, listen: false).getMetaData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MetaProvider>(builder:
        (BuildContext context, MetaProvider metaProvider, Widget child) {
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
                    'Hello Splash Screen',
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
            CommonView.loadingView(metaProvider.isLoading())
          ]),
        ),
      );
    });
  }
}
