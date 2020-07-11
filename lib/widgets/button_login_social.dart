import 'package:flutter/material.dart';

class LoginButtonSocial extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final dynamic icon;
  final Function onPressed;
  final Color borderColor;
  final double fontSize;
  LoginButtonSocial(
      {this.text,
      this.icon = '',
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      this.borderColor = Colors.transparent,
      this.fontSize = 18,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: double.infinity,
      ),
      child: FlatButton(
          color: backgroundColor,
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(width: 24.0, child: icon)),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(text,
                    style:
                        TextStyle(color: textColor, fontSize: this.fontSize)),
              )
            ],
          ),
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(25))),
    );
  }
}
