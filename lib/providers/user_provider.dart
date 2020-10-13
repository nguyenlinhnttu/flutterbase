import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base_source/models/request/SignInReq.dart';
import 'package:flutter_base_source/models/response/base_response.dart';
import 'package:flutter_base_source/models/user.dart';
import 'package:flutter_base_source/network/api_paths.dart';
import 'package:flutter_base_source/providers/base_provider.dart';
import 'package:flutter_base_source/utils/utils.dart';

class UserProvider extends BaseProvider {
  String msgValidate = "";
  Future<dynamic> signInAccount(email, String password) async {
    if (!Utils.isEmailValidated(email)) {
      return "• Please enter a valid email";
    } else if (password.length < 5) {
      return "• Password min length 8 character";
    } else {
      isLoading = true;
      SignInReq req = SignInReq();
      req.account = email;
      req.password = password;
      User user;
      Response response =
          await apiClient.callApiPost(ApiPath.SIGN_IN, req.toJson());
      isLoading = false;
      if (response.statusCode == 200) {
        user = CommonResponse<User>.fromJson(response.data).data;
        return user;
      }
      return response;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
