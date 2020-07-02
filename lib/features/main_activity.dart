import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base_source/features/splash.dart';
import 'package:provider/provider.dart';


class MainActivity extends StatefulWidget{
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MainActivity> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Splash(),
          Splash(),
          Splash(),
          Splash(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey[500],
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: SizedBox(),
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            title: SizedBox(),
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            title: SizedBox(),
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            title: SizedBox(),
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),

    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
