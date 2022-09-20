import 'package:flutter/material.dart';
import 'data.dart';

class Badan extends StatefulWidget {
  const Badan({super.key});

  @override
  State<Badan> createState() => _BadanState();
}

class _BadanState extends State<Badan> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: ((context, index) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Text(
                    data[index]["name"]![0],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[index]["name"].toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    Text(
                      data[index]["number"].toString(),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              )
            ]),
          );
        }));
  }
}
