import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    username.dispose();
    email.dispose();
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Contact Us",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: username,
              decoration: InputDecoration(
                label: Text("Username"),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: email,
              decoration: InputDecoration(
                label: Text("email"),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              minLines: 4,
              maxLines: 10,
              keyboardType: TextInputType.text,
              controller: message,
              decoration: InputDecoration(
                label: Text("Message"),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Center(
            child: ElevatedButton(
              child: Text("Submit"),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
        ],
      ),
    );
  }
}
