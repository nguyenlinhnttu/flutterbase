import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_source/network/api_client.dart';

abstract class BaseProvider with ChangeNotifier {
  ApiClient apiClient = ApiClient();
  bool _isLoading = false;
  StreamController<Response> _errorStream = StreamController<Response>.broadcast();
  Stream<Response> get apiError => _errorStream.stream;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set errorStream(Response value) {
    _errorStream.add(value);
  }
}
