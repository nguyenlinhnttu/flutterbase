import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_source/utils/constant.dart';
import 'package:flutter_base_source/utils/image_path.dart';
import 'package:flutter_base_source/utils/utils.dart';
import 'package:loading_animations/loading_animations.dart';

class CommonView {
  static AppBar getAppBar(
      {BuildContext context,
      String title,
      Color titleColor = Colors.black,
      double elevation = 0,
      double fontSize = FONT_NORMAL,
      Color backgroundColor = Colors.white,
      bool isBackPress = true}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: elevation,
      title: Text(
        title,
        style: TextStyle(color: titleColor, fontSize: fontSize),
      ),
      centerTitle: true,
      leading: Visibility(
        visible: isBackPress,
        child: IconButton(
          icon: ImagePath.icArrow,
          onPressed: () {
            FocusScope.of(context).unfocus();
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  static UnderlineInputBorder getUnderLine(
      {Color color = Colors.grey, double width = 1}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color, width: width),
    );
  }

  static Text makeTextView(String value,
      {Color color,
      double fontSize = FONT_MEDIUM,
      textAlign = TextAlign.start,
      FontWeight fontWeight = FontWeight.normal}) {
    if (color == null) {
      return Text(value,
          textAlign: textAlign,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight));
    } else {
      return Text(value,
          textAlign: textAlign,
          style: TextStyle(
              fontSize: fontSize, color: color, fontWeight: fontWeight));
    }
  }

  static ShapeDecoration createShape(
      {Color color = Colors.white, double borderRadios = SPACE_SMALL}) {
    return ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadios)));
  }

  static Widget loadingView(bool isLoading) {
    print("loadingView" + isLoading.toString());
    if (!isLoading) return Container();
    return Container(
      color: Colors.black.withAlpha(5),
      child: Center(
        child: LoadingBouncingGrid.square(
          size: 40,
          inverted: true,
          backgroundColor: AppColors.primarySecond,
        ),
      ),
    );
  }
}
