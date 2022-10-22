import 'package:flutter/material.dart';
import 'package:project1/AboutMe.dart';
import 'package:project1/ContactUs.dart';
import 'package:project1/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weekly Task 2"),
        centerTitle: true,
      ),
      drawer: SideMenu(),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Contact Us"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ContactUs()));
            },
          ),
          ListTile(
            title: Text("About Us"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AboutMe()));
            },
          ),
          ListTile(
            title: Text("Login"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Login()));
            },
          ),
        ],
      ),
    );
  }
}
