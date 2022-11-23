import 'dart:convert';

import 'package:finite_state/model/api/api_data.dart';
import 'package:finite_state/model/model_data.dart';
import 'package:finite_state/screen/ViewState.dart';
import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  ViewModelState _state = ViewModelState.iddle;
  ViewModelState get state => _state;

  changeState(ViewModelState s) {
    _state = s;
    notifyListeners();
  }

  final APIService apiService = APIService();

  List<Foods>? data;

  getAllData() async {
    try {
      _state = ViewModelState.loading;
      var res = jsonEncode(await apiService.getData());

      var datas = jsonDecode(res);

      print(datas.runtimeType);
      datas.map((e) {
        var item = Foods(id: e['id'], name: e['name']);
        data!.add(item);
      });
      _state = ViewModelState.iddle;
      notifyListeners();
    } catch (_) {
      _state = ViewModelState.error;
    }
  }
}
