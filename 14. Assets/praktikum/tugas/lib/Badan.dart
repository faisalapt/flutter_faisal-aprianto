import 'package:flutter/material.dart';
import 'package:tugas/ViewImage.dart';
import 'package:tugas/data.dart';

class Badan extends StatefulWidget {
  const Badan({super.key});

  @override
  State<Badan> createState() => _BadanState();
}

class _BadanState extends State<Badan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisExtent: 150),
          itemCount: data.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              child: Image.network(data[index]["url"].toString()),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ViewImage(
                  url: data[index]["url"].toString(),
                );
              })),
            );
          })),
    );
  }
}
