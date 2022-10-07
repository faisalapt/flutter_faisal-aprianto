import '../Contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactLoading()) {
    on<LoadContact>(_OnLoadContact);
    on<AddContact>(_AddContact);
    on<RemoveContact>(_RemoveContact);
  }

  void _OnLoadContact(LoadContact event, Emitter<ContactState> emit) {
    emit(
      ContactLoaded(contacts: event.contacts),
    );
  }

  void _AddContact(AddContact event, Emitter<ContactState> emit) {
    final state = this.state;
    if (state is ContactLoaded) {
      List<Contact> contacts = List.from(state.contacts)..add(event.contact);
      emit(
        ContactLoaded(
          contacts: contacts,
        ),
      );
    }
  }

  void _RemoveContact(RemoveContact event, Emitter<ContactState> emit) {
    final state = this.state;
    if (state is ContactLoaded) {
      List<Contact> contacts = List.from(state.contacts)..remove(event.contact);
      emit(ContactLoaded(contacts: contacts));
    }
  }
}
