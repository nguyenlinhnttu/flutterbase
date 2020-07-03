import 'package:flutter/material.dart';
import 'package:flutter_base_source/utils/app_status.dart';
import 'package:flutter_base_source/widgets/callback_dialog.dart';

import '../utils/constant.dart';
import '../utils/utils.dart';

class CustomDialog extends StatefulWidget {
  final String message;
  final String action;
  final String code;
  final CallBackDialog callback;

  CustomDialog({this.message, this.action, this.callback, this.code});

  @override
  _CustomDialogState createState() {
    return _CustomDialogState(message, action, callback);
  }
}

class _CustomDialogState extends State<CustomDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  final String message;
  final String action;
  CallBackDialog callback;

  _CustomDialogState(this.message, this.action, this.callback);

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
            scale: scaleAnimation,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 200.0,
                minWidth: 350.0,
              ),
              child: Container(
                margin: const EdgeInsets.all(SPACE_VERY_LARGE),
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SPACE_SMALL))),
                child: Padding(
                    padding: const EdgeInsets.all(SPACE_VERY_LARGE),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: FONT_MEDIUM,
                          ),
                        ),
                        Container(
                            constraints: BoxConstraints(
                              minWidth: 160,
                              minHeight: 40,
                            ),
                            padding:
                                const EdgeInsets.only(top: SPACE_VERY_LARGE),
                            child: RaisedButton(
                              color: AppColors.yellow,
                              child: Text(
                                action,
                                style: TextStyle(
                                    color: Colors.white, fontSize: FONT_MEDIUM),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(SPACE_SMALL)),
                              onPressed: () {
                                Navigator.of(context).pop();
                                if (callback != null) {
                                  callback.dialogDismiss(widget.code);
                                }
                              },
                            )),
                      ],
                    )),
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
