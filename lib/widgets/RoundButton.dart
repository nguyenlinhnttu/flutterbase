import 'package:flutter/material.dart';
import 'package:flutter_base_source/utils/Constant.dart';

class RoundButton extends StatelessWidget {
  final Color backgroundColor;
  final Text buttonText;
  final Color textColor;
  final Function onPressed;
  double width;
  RoundButton(
      {this.backgroundColor,
      this.buttonText,
      this.textColor,
      this.onPressed,
      this.width = 160});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: width,
          minHeight: 40,
        ),
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SPACE_SMALL)),
          splashColor: this.backgroundColor,
          color: this.backgroundColor,
          child: buttonText,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
