import 'package:flutter/material.dart';
import 'package:mvvm_architecture/screen/contact_view_model.dart';
import 'package:mvvm_architecture/screen/create_contact_screen.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider =
        Provider.of<ContactViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contactProvider.contacts.length,
              itemBuilder: ((context, index) => Card(
                    color: Colors.lightGreen[200],
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle),
                              child: Center(
                                  child: Text(
                                contactProvider.contacts[index].name
                                        .toString()[0] ??
                                    '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(contactProvider.contacts[index].name
                                            .toString() ??
                                        ''),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 9.0),
                                      child: Text(contactProvider
                                              .contacts[index].number
                                              .toString() ??
                                          ''),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      contactProvider.delete(
                                          contactProvider.contacts[index]);
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Kontak berhasil dihapus')),
                                    );
                                  },
                                  icon: Icon(Icons.delete)),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateContact(),
            ),
          );
        },
      ),
    );
  }
}
