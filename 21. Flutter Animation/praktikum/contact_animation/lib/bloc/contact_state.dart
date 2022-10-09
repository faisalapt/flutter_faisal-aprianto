import 'package:equatable/equatable.dart';
import '../Contact.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactLoading extends ContactState {}

class ContactLoaded extends ContactState {
  final List<Contact> contacts;

  const ContactLoaded({this.contacts = const <Contact>[]});

  @override
  List<Object> get props => [contacts];
}
