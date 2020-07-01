import 'package:flutter/material.dart';
import 'package:flutter_base_source/utils/Constant.dart';

class SimpleRaisedButton extends StatelessWidget {
  final Color backgroundColor;
  final Text buttonText;
  final Color textColor;
  final Function onPressed;

  SimpleRaisedButton(
      {this.backgroundColor, this.buttonText, this.textColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 160,
          minHeight: 40,
        ),
        child: RaisedButton(
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
