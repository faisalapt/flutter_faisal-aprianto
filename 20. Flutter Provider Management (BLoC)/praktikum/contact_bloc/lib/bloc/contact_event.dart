import '../Contact.dart';
import 'package:equatable/equatable.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class LoadContact extends ContactEvent {
  final List<Contact> contacts;

  const LoadContact({this.contacts = const <Contact>[]});

  @override
  List<Object> get props => [contacts];
}

class AddContact extends ContactEvent {
  final Contact contact;

  const AddContact({required this.contact});

  @override
  List<Object> get props => [contact];
}

class RemoveContact extends ContactEvent {
  final Contact contact;

  const RemoveContact({required this.contact});

  @override
  List<Object> get props => [contact];
}
