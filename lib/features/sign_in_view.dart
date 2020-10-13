import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_source/base/base_state_widget.dart';
import 'package:flutter_base_source/models/user.dart';
import 'package:flutter_base_source/providers/sign_in_provider.dart';
import 'package:flutter_base_source/providers/user_provider.dart';
import 'package:flutter_base_source/router.dart';
import 'package:flutter_base_source/utils/image_path.dart';
import 'package:flutter_base_source/utils/my_share_pref.dart';
import 'package:flutter_base_source/utils/utils.dart';
import 'package:flutter_base_source/widgets/button_login_social.dart';
import 'package:flutter_base_source/widgets/button_normal.dart';
import 'package:flutter_base_source/widgets/common_view.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends BaseStateWidget<SignInView> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _accountController = TextEditingController();
  final _passwordController = TextEditingController();
  UserProvider _userProvider;
  SignInProvider _signInProvider;
  @override
  void initState() {
    super.initState();
    _accountController.addListener(_onChangeValue);
    _passwordController.addListener(_onChangeValue);
  }

  @override
  Widget buildApp(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => SignInProvider()),
      ],
      child: Consumer2<SignInProvider, UserProvider>(
          builder: (_, SignInProvider provider, UserProvider userProvider, Widget child) {
        _signInProvider = provider;
        _userProvider = userProvider;
        return Scaffold(
            body: AnnotatedRegion<List<SystemUiOverlay>>(
          value: [],
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light,
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  child: KeyboardAvoider(
                    autoScroll: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      CommonView.makeTextView("SignIn",fontSize: 28, fontWeight: FontWeight.bold),
                        Container(
                          margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                              color: Colors.grey.withAlpha(20),
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          child: TextField(
                            focusNode: _emailFocusNode,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            controller: _accountController,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (term) {
                              _emailFocusNode.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                            onChanged: _onChangeValue(),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(width: 0, height: 8),
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.grey.withAlpha(20),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                              onSubmitted: (term) {
                                FocusScope.of(context).requestFocus(FocusNode());
                              },
                              focusNode: _passwordFocusNode,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              onChanged: _onChangeValue(),
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                  border: InputBorder.none)),
                        ),
                        SizedBox(width: 0, height: 16),
                        _signInProvider.isInputFull
                            ? NormalButton(
                                backgroundColor: AppColors.primary,
                                textColor: Colors.white,
                                text: "Sign In",
                                onPressed: () {
                                  _callSignIn();
                                },
                              )
                            : NormalButton(
                                backgroundColor: AppColors.primarySecond,
                                textColor: Colors.white,
                                text: "Sign In",
                                onPressed: () {},
                              ),
                        SizedBox(width: 0, height: 8),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Forgot password?",
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, RoutePaths.ForgotPass);
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16, left: 36, right: 36),
                          child: Column(
                            children: <Widget>[
                              LoginButtonSocial(
                                text: "Sign in with Facebook",
                                textColor: Colors.white,
                                icon: ImagePath.icFacebook,
                                fontSize: 13,
                                backgroundColor: HexColor("2767D3"),
                                onPressed: () {},
                              ),
                              SizedBox(height: 8),
                              LoginButtonSocial(
                                text: "Sign in with Apple",
                                textColor: Colors.white,
                                icon: ImagePath.icApple,
                                fontSize: 13,
                                backgroundColor: Colors.black,
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 0, height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have account?",
                              style:
                                  TextStyle(color: AppColors.black, fontSize: 16),
                            ),
                            SizedBox(width: 4, height: 0),
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Create a new account!",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, RoutePaths.SignUp);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                _userProvider.isLoading
                    ? CommonView.loadingView(_userProvider.isLoading)
                    : Container(),
              ],
            ),
          ),
        ));
      }),
    );
  }

  //Validate Field Change State Button
  _onChangeValue() {
    if (_accountController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      _signInProvider.updateFormInput(true);
    } else {
      _signInProvider.updateFormInput(false);
    }
  }

  Future<void> _callSignIn() async {
    hideKeyboard();
    dynamic result = await _userProvider
        .signInAccount(
        _accountController.text.trim(), _passwordController.text.trim());
    if (result is User) {
      MySharePref.saveUserInfo(result);
      Navigator.pushNamedAndRemoveUntil(
          context, RoutePaths.Home, (Route<dynamic> route) => false);
    } else if (result is String) {
      showMessage(result);
    } else {
      onApiError(result);
    }
  }

  @override
  void dispose() {
    _accountController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
