import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


int _sec = 0;
int _min = 0;
int _hour = 0;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Widget"),
          ),
          body: Center(child: Container(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hour(),
                    Text(":",style: TextStyle(fontSize: 40),),
                    Minute(),
                    Text(":",style: TextStyle(fontSize: 40),),
                    Second()
                  ],
                ),
                ElevatedButton(onPressed: () {
                  const onSec = const Duration(seconds: 1);
                  Timer _time = new Timer.periodic(onSec, 
                    (Timer timer) => setState(
                      () {
                        _sec++;
                        if(_sec >= 60){
                          _sec = 0;
                          _min++;
                        }else if(_min >= 60){
                          _min = 0;
                          _hour++;
                        }
                      }
                    )
                  );
                }, child: Text("Start"))
              ],
            ),
          )),
      ),
    );
  }

  Widget Hour(){
    return Text("$_hour", style: TextStyle(fontSize: 40),);
  }

  Widget Minute(){
    return Text("$_min",style: TextStyle(fontSize: 40),);
  }

  Widget Second(){
    return Text("$_sec",style: TextStyle(fontSize: 40),);
  }
}
