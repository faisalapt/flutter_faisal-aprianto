import 'package:flutter/material.dart';

var datas = List <Map>.generate(50, (index) => {
      "name" : "John Doe",
      "time" : "20.14",
      "message" : "Hello",
      "count" : 20,
      "image" : "assets/picture.jpg"
    },);

class Badan extends StatefulWidget {
  const Badan({Key? key}) : super(key: key);

  @override
  State<Badan> createState() => _BadanState();
}

class _BadanState extends State<Badan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: ((BuildContext context, int index) {
          return Card(
            child: Container(
              padding: EdgeInsets.only(top: 4, bottom: 4),
              margin: EdgeInsets.only(top: 15, left: 10),
              width: MediaQuery.of(context).size.width,
              child: Row(children: [
                Container(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(datas[index]["image"]),
                  )
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget> [
                        Container(
                          margin: EdgeInsets.only(bottom: 15, left: 10),
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Text(datas[index]["name"])),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Text(
                            datas[index]["time"],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13
                            ),
                          )
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Text(datas[index]["message"])),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: new BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            datas[index]["count"].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          )
                        )
                      ],
                    ),
                  ],
                ),
              ]
            ),
            ),
          );
        }),
       
      ),
    );
  }
}