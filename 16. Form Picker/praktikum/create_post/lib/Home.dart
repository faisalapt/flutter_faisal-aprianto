import 'dart:io';

import 'package:create_post/CreatePost.dart';
import 'package:create_post/Post.dart';
import 'package:create_post/data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ((BuildContext context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Container(
                                child: Image.file(
                                  File(data[index].file),
                                  frameBuilder: (context, child, frame,
                                      wasSynchronouslyLoaded) {
                                    return Container(
                                      child: child,
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    DateFormat("MMMM dd, yyyy")
                                        .format(data[index].date),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text("Color Theme: "),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: data[index].color,
                                            shape: BoxShape.circle),
                                      )
                                    ]),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(data[index].caption),
                            SizedBox(
                              height: 30,
                            )
                          ]),
                    );
                  }))),
        ),
      ],
    );
  }
}
