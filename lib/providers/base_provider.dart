import 'package:flutter/material.dart';
import 'package:flutter_base_source/network/api_client.dart';

abstract class BaseProvider with ChangeNotifier {
  bool _isLoading = false;
  ApiClient apiClient = ApiClient();
  isLoading() => _isLoading;

  setLoading(bool isLoading) async {
    _isLoading = isLoading;
    notifyListeners();
  }
}
