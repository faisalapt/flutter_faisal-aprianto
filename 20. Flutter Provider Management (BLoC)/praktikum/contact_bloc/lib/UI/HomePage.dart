import '../Contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_bloc.dart';
import '../bloc/contact_event.dart';
import '../bloc/contact_state.dart';
import 'Create.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        centerTitle: true,
      ),
      body: BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
        if (state is ContactLoading) {
          return _loading();
        }
        if (state is ContactLoaded) {
          return Container(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.contacts.length,
                    itemBuilder: ((context, index) => Card(
                          color: Colors.lightGreen[200],
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      state.contacts[index].name
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
                                          Text(state.contacts[index].name
                                                  .toString() ??
                                              ''),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 9.0),
                                            child: Text(state
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
                                          context.read<ContactBloc>()
                                            ..add(RemoveContact(
                                                contact:
                                                    state.contacts[index]));
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
          );
        } else {
          return Text("Something went wrong");
        }
      }),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () async {
          var result = await Navigator.push(
              context, MaterialPageRoute(builder: (_) => CreateContact()));
          var contact = Contact(
              name: result["name"].toString(),
              number: result["number"].toString());
          context.read<ContactBloc>().add(AddContact(contact: contact));
        },
      ),
    );
  }
}

Widget _loading() {
  return Center(
    child: Text('loading'),
  );
}
