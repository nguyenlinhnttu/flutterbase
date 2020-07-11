import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Function onPressed;
  final Color borderColor;
  final double fontSize;
  NormalButton(
      {this.text,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      this.borderColor = Colors.transparent,
      this.fontSize = 18,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: 46,
      ),
      child: FlatButton(
          color: backgroundColor,
          child: Text(text,
              style: TextStyle(color: textColor, fontSize: this.fontSize)),
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(24))),
    );
  }
}
