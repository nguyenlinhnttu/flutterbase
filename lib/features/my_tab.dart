import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_source/base/base_state_widget.dart';

class MyTab extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends BaseStateWidget<MyTab> {
  @override
  void initState() {
    super.initState();
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
                SizedBox(height: 50),
                Center(
                  child: Image.asset(
                    "assets/icons/ic_splash.png",
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
