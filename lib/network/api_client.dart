import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base_source/environments/env.dart';

//https://pub.dev/packages/dio#examples
class ApiClient {
  static Dio _dio = Dio();

  ApiClient() {
    BaseOptions options = new BaseOptions(
      baseUrl: Env.value.baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );
    options.headers = getHeaders();
    _dio.options = options;
    if (Platform.isAndroid) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        print('onHttpClientCreate entered...');
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        // config the http client
        client.findProxy = (uri) {
          //proxy all request to localhost:8888
          return "PROXY localhost:3001";
        };
        // you can also create a new HttpClient to dio
        // return new HttpClient();
      };
    }
  }

  Map<String, String> getHeaders() {
    debugPrint("Authorization");
    Map<String, String> header = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    //header["accessToken"] = "";
    return header;
  }

  static bool isSuccess(Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  Future<Response> callApiGet(String apiPath,
      {Map<String, dynamic> queryParameters}) async {
    Response response;
    try {
      response = await _dio.get(apiPath, queryParameters: queryParameters);
      return response;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      response = Response();
      response.data = e;
      response.statusCode = e.response.statusCode;
      response.statusMessage = e.response.statusMessage;

      return response;
    }
  }

  Future<Response> callApiPost(String apiPath, dynamic data) async {
    print("Request:" + data.toString());
    Response response;
    try {
      response = await _dio.post(apiPath, data: data);
      return response;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      response = Response();
      response.data = e;
      print(e);
      return response;
    }
  }
}
