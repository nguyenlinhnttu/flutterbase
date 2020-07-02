import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_source/models/response/base_response.dart';
import 'package:flutter_base_source/utils/constant.dart';
import 'package:flutter_base_source/widgets/custom_dialog.dart';
import 'package:http/http.dart';

import 'app_localizations.dart';
import 'base_view.dart';
import '../widgets/callback_dialog.dart';
import '../providers/base_provider.dart';

abstract class BaseWidget<T extends StatefulWidget> extends State<T>
    with AutomaticKeepAliveClientMixin<T>
    implements BaseView {
  bool loading = false;
  bool isShowDialog = false;
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

  @override
  void onApiError(Response error) {
    String message;
    switch (error.statusCode) {
      case EXCEPTION_CLIENT_SOCKET:
        message = _getString("no_internet");
        break;
      case EXCEPTION_CLIENT_TIMEOUT:
        message = _getString("default_message");
        break;
      case EXCEPTION_CLIENT_UNKNOWN:
      case EXCEPTION_NOT_FOUND:
        message = _getString("default_message");
        break;
      default:
        CommonResponse response =
            CommonResponse.fromJson(json.decode(error.body));
        message = response.message;
        break;
    }
    hideLoading();
    if (!isShowDialog && error != null && message != null) {
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
      isShowDialog = false;
      print("dialogDismiss TRUE ");
    });
  }

  void hideKeyboard() {
    if (mounted) FocusScope.of(context).requestFocus(new FocusNode());
  }
}
