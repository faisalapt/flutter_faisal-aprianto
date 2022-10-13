part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  final User user;

  const LoadUser(
      {this.user = const User(email: '', name: '', pass: '', number: '')});

  @override
  List<Object> get props => [user];
}

class SetUser extends UserEvent {
  final User user;

  const SetUser({required this.user});

  @override
  List<Object> get props => [user];
}

class RemoveUser extends UserEvent {
  final User user;

  const RemoveUser({required this.user});

  @override
  List<Object> get props => [user];
}
