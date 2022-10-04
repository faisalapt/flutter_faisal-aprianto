import 'package:flutter/material.dart';

class ContactNotFound extends StatelessWidget {
  const ContactNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.supervisor_account_sharp),
          Text("Your Contact is Empty")
        ],
      ),
    );
  }
}
