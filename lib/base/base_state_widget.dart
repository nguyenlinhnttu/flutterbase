import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_source/models/response/base_response.dart';
import 'package:flutter_base_source/providers/base_provider.dart';
import 'package:flutter_base_source/providers/user_provider.dart';
import 'package:flutter_base_source/utils/app_status.dart';
import 'package:flutter_base_source/widgets/custom_dialog.dart';
import 'package:provider/provider.dart';

import '../widgets/callback_dialog.dart';
import 'app_localizations.dart';

abstract class BaseStateWidget<T extends StatefulWidget> extends State<T>
    with AutomaticKeepAliveClientMixin<T> {
  GlobalKey<ScaffoldState> globalKeyScaffold = GlobalKey<ScaffoldState>();
  double screenWidth = 0;
  double screenHeight = 0;
  AppLocalizations appLocalizations;

  @override
  void didChangeDependencies() {
    if (appLocalizations == null) {
      appLocalizations = AppLocalizations.of(context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return buildApp(context);
  }

  @override
  bool get wantKeepAlive => true;

  Widget buildApp(BuildContext context);

  void onApiError(Response error) {
    String message;
    if (error.data is DioError) {
      DioError dioError = error.data as DioError;
      switch (dioError.type) {
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
        case DioErrorType.RESPONSE:
        case DioErrorType.CANCEL:
        case DioErrorType.DEFAULT:
          message = dioError.message;
          break;
      }
    } else {
      CommonResponse response =
          CommonResponse.fromJson(json.decode(error.data));
      message = response.message;
    }
    if (!AppStatus.isShowDialog && error != null && message != null) {
      showMessage(message, null);
    }
  }

  String _getString(String key) {
    return appLocalizations.translate(key);
  }

  //Dialog: show message with callback (callback = null if don't need handle)
  //Warning: please check sample ChangePassScreen.
  Future showMessage(String mgs, CallBackDialog callback,
      {bool onWillPop = true}) async {
    AppStatus.isShowDialog = true;
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => WillPopScope(
              onWillPop: () async => onWillPop,
              child: CustomDialog(
                message: mgs,
                action: "OK",
                callback: callback,
              ),
            )).then((val) {
      AppStatus.isShowDialog = false;
      print("dialogDismiss TRUE ");
    });
  }

  void hideKeyboard() {
    if (mounted) FocusScope.of(context).requestFocus(FocusNode());
  }
}
