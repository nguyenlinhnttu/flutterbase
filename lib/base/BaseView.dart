import 'package:http/http.dart';

abstract class BaseView {
  void onApiError(Response error);

  void showLoading();

  void hideLoading();
}
