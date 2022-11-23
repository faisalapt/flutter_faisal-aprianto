import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';

enum Tab { all, work, unread, personal }

var data = {
  Tab.all: all,
  Tab.unread: unread,
  Tab.personal: personal,
  Tab.work: work
};

class Badan extends StatefulWidget {
  const Badan({Key? key}) : super(key: key);

  @override
  State<Badan> createState() => _BadanState();
}

class _BadanState extends State<Badan> {
  TextEditingController controller = new TextEditingController(text: "");
  Tab _selectedSegment = Tab.all;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: true,
        automaticallyImplyMiddle: true,
        border: Border(
            bottom: BorderSide.none,
            top: BorderSide.none,
            left: BorderSide.none,
            right: BorderSide.none),
        backgroundColor: CupertinoColors.lightBackgroundGray,
        leading: Row(
          children: [
            Text(
              "Edit",
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
          ],
        ),
        trailing: Icon(CupertinoIcons.plus),
        middle: Text("Chats"),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 10, bottom: 7),
                color: CupertinoColors.lightBackgroundGray,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: CupertinoSearchTextField(
                        controller: controller,
                        placeholder: "Search",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: CupertinoSlidingSegmentedControl(
                        groupValue: _selectedSegment,
                        thumbColor: Color.fromARGB(0, 0, 0, 0),
                        onValueChanged: (Tab? value) {
                          if (value != null) {
                            setState(() {
                              _selectedSegment = value;
                            });
                          }
                        },
                        children: <Tab, Widget>{
                          Tab.all: Center(child: Text("All Chats")),
                          Tab.work: Center(
                            child: Text("Works"),
                          ),
                          Tab.unread: Center(
                            child: Text("Unread"),
                          ),
                          Tab.personal: Center(
                            child: Text("Personal"),
                          )
                        },
                      ),
                    ),
                  ],
                )),
            // Text(data[_selectedSegment]!.toString()),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data[_selectedSegment]!.length,
                  itemBuilder: ((context, index) {
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
                                backgroundImage: AssetImage(
                                    data[_selectedSegment]![index]["picture"]
                                        .toString()),
                              )),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Container(
                                      margin:
                                          EdgeInsets.only(bottom: 15, left: 10),
                                      child: Text(data[_selectedSegment]![index]
                                              ["name"]
                                          .toString())),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 15),
                                      child: Text(
                                        data[_selectedSegment]![index]["time"]
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(data[_selectedSegment]![index]
                                              ["message"]
                                          .toString())),
                                  Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: new BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        data[_selectedSegment]![index]["count"]
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ]),
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }

  Widget AllChat() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: data[_selectedSegment]!.length,
        itemBuilder: ((context, index) {
          return Container(
            padding: EdgeInsets.only(top: 4, bottom: 4),
            margin: EdgeInsets.only(top: 15, left: 10),
            width: MediaQuery.of(context).size.width,
            child: Row(children: [
              Container(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        data[_selectedSegment]![index]["picture"].toString()),
                  )),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(bottom: 15, left: 10),
                          child: Text(data[_selectedSegment]![index]["name"]
                              .toString())),
                      Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Text(
                            data[_selectedSegment]![index]["time"].toString(),
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(data[_selectedSegment]![index]["message"]
                              .toString())),
                      Container(
                          padding: EdgeInsets.all(4),
                          decoration: new BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            data[_selectedSegment]![index]["count"].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ]),
          );
        }));
  }
}
