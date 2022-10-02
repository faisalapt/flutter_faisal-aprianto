import 'package:contacts/data.dart';
import 'package:flutter/material.dart';

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
        itemBuilder: ((context, index) => Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: Center(
                          child: Text(
                        data[index].name.toString()[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data[index].name.toString()),
                          Padding(
                            padding: const EdgeInsets.only(top: 9.0),
                            child: Text(data[index].number.toString()),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
