import 'package:dio/dio.dart';

class HelperAPI {
  String url = "https://reqres.in/api/users";
  getUser() async {
    final Dio dio = Dio();
    final Response response = await dio.get(url);
    return response.data.toString();
  }
}
