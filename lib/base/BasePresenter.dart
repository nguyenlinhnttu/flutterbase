import 'package:flutter_base_source/network/ApiClient.dart';

abstract class BasePresenter<V> {
  ApiClient apiClient = ApiClient();

  V mvpView;
  attachView(V mvpView) {
    this.mvpView = mvpView;
  }
}
