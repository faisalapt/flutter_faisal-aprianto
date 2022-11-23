import 'package:dio/dio.dart';
import 'package:finite_state/model/model_data.dart';

class APIService {
  Dio dio = Dio();

  final url =
      "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods";

  Future<List<Foods>> getData() async {
    try {
      final Response response = await dio.get(url);
      List<Foods> foods = [];
      response.data.forEach((v) {
        foods.add(Foods(id: v['id'], name: v['name']));
      });
      return foods;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
