import 'package:flutter/material.dart';
import 'package:gallery/Body.dart';
import 'package:gallery/Palette.dart';

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
        primarySwatch: Palette.kToDark,
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
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Gallery",
          style:
              TextStyle(color: Color(0xFFA26944), fontWeight: FontWeight.w800),
        ),
      ),
      body: Body(),
    );
  }
}
