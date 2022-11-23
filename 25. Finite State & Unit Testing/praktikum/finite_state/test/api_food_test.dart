import 'package:finite_state/model/api/api_data.dart';
import 'package:finite_state/model/model_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([Foods])
void main() {
  group('Foods', () {
    test('Get all foods from API', () async {
      var foods = await APIService().getData();
      expect(foods.isNotEmpty, true);
    });
  });
}
