import 'package:contacts/Badan.dart';
import 'package:contacts/Create.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Badan(),
      floatingActionButton: Container(
        decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            addContact();
          },
        ),
      ),
    );
  }

  Future addContact() async {
    var result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return CreateContact();
    }));
    if (result != null &&
        result.containsKey('name') &&
        result.containsKey('number')) {
      var add = {
        "name": result["name"].toString(),
        "number": result["number"].toString()
      };
      setState(() {
        data.add(add);
      });
    }
  }
}
