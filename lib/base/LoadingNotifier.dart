import 'package:flutter/material.dart';

class LoadingNotifier with ChangeNotifier {
  bool _isLoading = false;
  LoadingNotifier(this._isLoading);

  isLoading() => _isLoading;

  setLoading(bool isLoading) async {
    _isLoading = isLoading;
    notifyListeners();
  }
}
