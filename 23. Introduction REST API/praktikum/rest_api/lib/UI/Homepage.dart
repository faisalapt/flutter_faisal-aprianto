import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:rest_api/models/User.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController teName = TextEditingController();
  TextEditingController teJob = TextEditingController();

  String data = '';

  @override
  void dispose() {
    // TODO: implement dispose
    teName.dispose();
    teJob.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: teName,
              decoration: InputDecoration(
                label: Text("Name"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: teJob,
              decoration: InputDecoration(
                label: Text("Job"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final Dio dio = Dio();
                    final Response response =
                        await dio.get("https://reqres.in/api/users");
                    setState(() {
                      var res = jsonEncode(response.data['data']);
                      List<User>? users;
                      users?.map((e) => User(
                          id: e.id,
                          email: e.avatar,
                          first_name: e.first_name,
                          last_name: e.last_name,
                          avatar: e.avatar));
                      data = res.toString();
                    });
                  },
                  child: Text("GET"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final Dio dio = Dio();
                    final Response response = await dio.post(
                        "https://reqres.in/api/users",
                        data: {'name': teName.text, 'job': teJob.text});
                    setState(() {
                      data = response.toString();
                    });
                  },
                  child: Text("POST"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final Dio dio = Dio();
                    final Response response = await dio.put(
                        "https://reqres.in/api/users/4",
                        data: {"name": teName.text, "job": teJob.text});
                    setState(() {
                      data = response.data.toString();
                    });
                  },
                  child: Text("PUT"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final Dio dio = Dio();
                    final Response response =
                        await dio.delete("https://reqres.in/api/users/4");
                    setState(() {
                      data = response.toString();
                    });
                  },
                  child: Text("DELETE"),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Result",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              data,
            ),
          ],
        ),
      ),
    );
  }
}
