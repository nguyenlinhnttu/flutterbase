import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base_source/environments/env.dart';

const int EXCEPTION_CLIENT_SOCKET = 999;
const int EXCEPTION_CLIENT_TIMEOUT = 408;
const int EXCEPTION_CLIENT_UNKNOWN = 500;
const int EXCEPTION_NOT_FOUND = 404;

//https://pub.dev/packages/dio#examples
class ApiClient {
  static Dio _dio = Dio();


  ApiClient(){
    debugPrint("ApiClient" + Env.value.baseUrl);
    BaseOptions options = new BaseOptions(
      baseUrl: Env.value.baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 15000,
    );
    _dio.options = options ;
  }

  Map<String, String> getHeaders() {
    debugPrint("Authorization");
    Map<String, String> header = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    };
    header["accessToken"] = "";
    return header;
  }

  Future<Response> callApiGet(String apiPath) async {
    _dio.options.headers = getHeaders();
    var response = await _dio.get(apiPath);
    return response;
  }

}
