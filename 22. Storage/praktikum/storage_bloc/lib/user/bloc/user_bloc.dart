import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:storage_bloc/models/User.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserLoaded()) {
    on<LoadUser>((event, emit) {
      emit(UserLoaded());
    });
    on<SetUser>(
      (event, emit) {
        final state = this.state;
        if (state is UserLoaded) {
          User _user = User(
              name: event.user.name,
              number: event.user.number,
              email: event.user.email,
              pass: event.user.pass);
          emit(UserLoaded(user: _user));
        }
      },
    );
  }
}
