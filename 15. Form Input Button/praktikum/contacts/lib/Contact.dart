class Contact {
  Contact({this.name, this.number}) {
    var data = {'name': name, 'number': number};
    contacts.add(data);
  }
  String? name;
  String? number;

  List contacts = [];

  List getContact() {
    return contacts;
  }
}
