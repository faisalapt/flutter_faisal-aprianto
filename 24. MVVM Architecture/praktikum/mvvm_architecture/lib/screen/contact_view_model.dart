import 'package:flutter/material.dart';
import 'package:mvvm_architecture/model/contact_model.dart';

class ContactViewModel extends ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  addContact(Contact contact) async {
    _contacts.add(contact);
    notifyListeners();
  }

  getAllContacts() async {}

  delete(Contact contact) {
    _contacts.remove(contact);
  }
}
