import 'package:dio/dio.dart';
import 'package:flutter_base_source/models/request/SignInReq.dart';
import 'package:flutter_base_source/models/response/base_response.dart';
import 'package:flutter_base_source/models/user.dart';
import 'package:flutter_base_source/network/api_paths.dart';
import 'package:flutter_base_source/providers/base_provider.dart';
import 'package:flutter_base_source/utils/utils.dart';

class UserProvider extends BaseProvider {
  User user;
  String msgValidate = "";
  Future<String> signInAccount(email, String password) async {
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
      if (response.statusCode == 200) {
        user = CommonResponse<User>.fromJson(response.data).data;
        this.user = user;
        return "success";
      } else {
        apiError = response;
      }
      isLoading = false;
      return null;
    }
  }

  Future<bool> getUserInfo(int userId) async {
    isLoading = true;
    User user;
    Response response = await apiClient.callApiGet("/users/$userId");
    if (response.statusCode == 200) {
      user = CommonResponse<User>.fromJson(response.data).data;
      notifyListeners();
    } else {
      apiError = response;
    }
    isLoading = false;
    this.user = user;
    return this.user != null ? true : false;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
