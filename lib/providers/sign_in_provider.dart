import 'package:flutter_base_source/providers/base_provider.dart';

class SignInProvider extends BaseProvider {
  bool isInputFull = false;

  void updateFormInput(bool isInputFull) {
    this.isInputFull = isInputFull;
    notifyListeners();
  }
}
