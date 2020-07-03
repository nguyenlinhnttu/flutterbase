import 'package:dio/dio.dart';
import 'package:flutter_base_source/models/response/base_response.dart';
import 'package:flutter_base_source/models/user.dart';
import 'package:flutter_base_source/providers/base_provider.dart';

class UserProvider extends BaseProvider {
  User user = User();

  void getUserInfo(int userId) async {
    isLoading = true;
    Response response = await apiClient.callApiGet("/users/$userId");
    isLoading = false;
    if (response.statusCode == 200) {
      user = CommonResponse<User>.fromJson(response.data).data;
      notifyListeners();
    } else {
      errorStream = response;
    }
  }

  String getUserName() {
    return user.userName == null ? "" : user.userName;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
