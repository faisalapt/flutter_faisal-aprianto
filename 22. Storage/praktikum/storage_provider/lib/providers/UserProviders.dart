import 'package:flutter/material.dart';
import 'package:storage_provider/models/User.dart';

class UserProviders with ChangeNotifier {
  User _users = User(name: '', email: '', password: '', number: '');

  User? get users => _users;

  void set(User user) {
    _users = User(
        name: user.name,
        email: user.email,
        password: user.password,
        number: user.number);
    notifyListeners();
  }
}
