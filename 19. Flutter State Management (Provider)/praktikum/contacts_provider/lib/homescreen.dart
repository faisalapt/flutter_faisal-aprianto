import 'package:contacts_provider/ContactNotFound.dart';
import 'package:contacts_provider/Create.dart';
import 'Contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<Contact>(context, listen: false);
    if (contactProvider.contacts.length < 1) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: ContactNotFound(),
        floatingActionButton: IconButton(
          icon: Icon(Icons.add),
          onPressed: () async {
            var result = await Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CreateContact()));
            if (result != null &&
                result.containsKey('name') &&
                result.containsKey('number')) {
              var add = new GetContact(
                  name: result["name"].toString(),
                  number: result["number"].toString());
              setState(() {
                contactProvider.add(add);
              });
            }
          },
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
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
                                    color: Colors.green,
                                    shape: BoxShape.circle),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(contactProvider.contacts[index].name
                                              .toString() ??
                                          ''),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 9.0),
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
                                        contactProvider.delete(index);
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Kontak berhasil dihapus')),
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
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () async {
          var result = await Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => CreateContact()));
          if (result != null &&
              result.containsKey('name') &&
              result.containsKey('number')) {
            var add = new GetContact(
                name: result["name"].toString(),
                number: result["number"].toString());
            setState(() {
              contactProvider.add(add);
            });
          }
        },
      ),
    );
  }
}
