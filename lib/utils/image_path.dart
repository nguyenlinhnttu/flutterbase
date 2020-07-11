import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImagePath {
  static final splash = Image.asset("assets/icons/splash.png");
  static final icLogo = Image.asset('assets/icons/app_icon.png');
  static final icArrow =
      Image.asset('assets/icons/ic_arrow.png', width: 24, height: 24);
  static final icApple = SvgPicture.asset('assets/icons/ic_apple.svg',
      color: Colors.white, width: 24, height: 24);
  static final icFacebook = SvgPicture.asset("assets/icons/ic_facebook.svg");
}
