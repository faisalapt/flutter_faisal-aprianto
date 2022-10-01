import 'package:create_post/Home.dart';
import 'package:create_post/data.dart';
import 'package:flutter/material.dart';

import 'CreatePost.dart';

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
        title: Text("Posts"),
        actions: [
          IconButton(
              onPressed: () async {
                var post = await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return CreatePost();
                }));
                setState(() {
                  data.add(post);
                });
                print(data[0].file);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Home(),
    );
  }
}
