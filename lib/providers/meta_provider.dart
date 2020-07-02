import 'package:dio/dio.dart';
import 'package:flutter_base_source/providers/base_provider.dart';

class MetaProvider extends BaseProvider {

  MetaProvider();

  Future<Response> getMetaData() async{
    setLoading(true);
    Response response = await apiClient.callApiGet("/jokes/categories");
    setLoading(false);
    if (response.statusCode == 200) {

    } else {

    }
    print(response.data.toString());
    return response;
  }
}
