import 'package:flutter/material.dart';
import 'package:mvvm_architecture/screen/contact_screen.dart';
import 'package:mvvm_architecture/screen/contact_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactViewModel()),
      ],
      child: MaterialApp(
        title: 'Contact MVVM',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ContactScreen(),
      ),
    );
  }
}
