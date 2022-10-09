import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isBig = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: AnimatedContainer(
          width: isBig ? 400 : 300,
          height: isBig ? 200 : 200,
          duration: Duration(milliseconds: 300),
          child: Image.network("https://picsum.photos/id/237/400/200"),
        ),
        onTap: () {
          setState(() {
            isBig = !isBig;
          });
        },
      ),
    );
  }
}
