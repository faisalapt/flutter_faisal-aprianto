import 'package:contacts_provider/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Contact.dart' as contacts;
import 'Contact.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => contacts.Contact(),
        ),
        ChangeNotifierProvider(create: (_) => Contact())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      title: "Contacts",
      home: HomeScreen(),
    );
  }
}
