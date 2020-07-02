import 'package:flutter/material.dart';

abstract class BaseProvider with ChangeNotifier {
  bool _isLoading = false;

  isLoading() => _isLoading;

  setLoading(bool isLoading) async {
    _isLoading = isLoading;
    notifyListeners();
  }
}
