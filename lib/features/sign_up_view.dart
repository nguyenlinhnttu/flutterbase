import 'package:flutter/material.dart';
import 'package:flutter_base_source/base/base_state_widget.dart';
import 'package:flutter_base_source/utils/utils.dart';
import 'package:flutter_base_source/widgets/button_normal.dart';
import 'package:flutter_base_source/widgets/common_view.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class SignUpView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends BaseStateWidget<SignUpView> {
  final _displayNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _displayNameController = TextEditingController();
  final _accountController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _displayNameController.addListener(_onChangeValue);
    _accountController.addListener(_onChangeValue);
    _passwordController.addListener(_onChangeValue);
    _confirmPasswordController.addListener(_onChangeValue);
  }

  @override
  Widget buildApp(BuildContext context) {
    return Scaffold(
      appBar: CommonView.getAppBar(
        context: context,
        title: "",
      ),
      body: KeyboardAvoider(
        autoScroll: true,
        child: Container(
          margin: EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            children: <Widget>[
              CommonView.makeTextView("Let's Get Started!",
                  color: AppColors.primary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 16),
              CommonView.makeTextView(
                  "Create an account to IELTS Challenge to get all features",
                  fontSize: 13,
                  color: Colors.black54),
              Container(
                margin: EdgeInsets.only(top: 32),
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(20),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: TextField(
                  focusNode: _displayNameFocusNode,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  controller: _displayNameController,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (term) {
                    _displayNameFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(_emailFocusNode);
                  },
                  onChanged: _onChangeValue(),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Display name : Jhone Williams",
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(width: 0, height: 16),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(20),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
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
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                  onChanged: _onChangeValue(),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(width: 0, height: 16),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey.withAlpha(20),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (term) {
                      _passwordFocusNode.unfocus();
                      FocusScope.of(context)
                          .requestFocus(_confirmPasswordFocusNode);
                    },
                    focusNode: _passwordFocusNode,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    onChanged: _onChangeValue(),
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle:
                            TextStyle(fontSize: 16.0, color: Colors.black),
                        border: InputBorder.none)),
              ),
              SizedBox(width: 0, height: 16),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey.withAlpha(20),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (term) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    focusNode: _confirmPasswordFocusNode,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    onChanged: _onChangeValue(),
                    decoration: InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle:
                            TextStyle(fontSize: 16.0, color: Colors.black),
                        border: InputBorder.none)),
              ),
              SizedBox(width: 0, height: 24),
              NormalButton(
                backgroundColor: AppColors.primary,
                textColor: Colors.white,
                text: "Create Account",
                onPressed: () {
                  _callSignUp();
                },
              ),
              SizedBox(width: 0, height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 4, height: 0),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Sign In",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _onChangeValue() {}

  @override
  void dispose() {
    _accountController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _callSignUp() {}
}
