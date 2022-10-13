part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;

  const UserLoaded(
      {this.user = const User(name: '', number: '', email: '', pass: '')});

  @override
  List<Object> get props => [user];
}
