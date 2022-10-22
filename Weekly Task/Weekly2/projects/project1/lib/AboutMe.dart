import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("About me"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Image(image: AssetImage("assets/profile.png")),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "A person who is interested in new things preferred field of competence, and like to improve my own skills through a project.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
