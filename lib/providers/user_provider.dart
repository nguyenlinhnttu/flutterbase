import 'package:dio/dio.dart';
import 'package:flutter_base_source/models/response/base_response.dart';
import 'package:flutter_base_source/models/user.dart';
import 'package:flutter_base_source/providers/base_provider.dart';

class UserProvider extends BaseProvider {
  User user;

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

  String getUserName() {
    return (user == null || user.userName == null) ? "" : user.userName;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
