import '../user.dart';

class CommonResponse<T> {
  int code;
  String message;
  T data;

  CommonResponse({this.code, this.message, this.data});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("code")) {
      code = json['code'];
    }
    if (json.containsKey("message")) {
      message = json['message'];
    }
    data = json['data'] != null && json['data'].toString().isNotEmpty
        ? converts(json['data'])
        : null;
  }

  T converts(dynamic response) {
    if (this is CommonResponse<User>) {
      return User.fromJson(response) as T;
    } else {
      return null;
    }
  }
}
