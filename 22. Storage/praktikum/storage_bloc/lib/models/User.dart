import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String number;
  final String email;
  final String pass;
  const User(
      {required this.name,
      required this.number,
      required this.email,
      required this.pass});

  User copyWith({String? name, String? number, String? email, String? pass}) {
    return User(
        name: name ?? this.name,
        number: number ?? this.number,
        email: email ?? this.email,
        pass: pass ?? this.pass);
  }

  @override
  List<Object?> get props => [name, number, email, pass];
}
