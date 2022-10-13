import 'package:flutter/material.dart';
import 'package:storage_bloc/Pallete.dart';
import 'package:storage_bloc/user/UI/HomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storage_bloc/user/bloc/user_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        title: 'Storage BLoC',
        theme: ThemeData(primarySwatch: Palette.pallete),
        home: HomePage(),
      ),
    );
  }
}
