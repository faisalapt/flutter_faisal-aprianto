import 'package:contacts/Badan.dart';
import 'package:contacts/data.dart';
import 'package:flutter/material.dart';

class CreateContact extends StatefulWidget {
  const CreateContact({super.key});

  @override
  State<CreateContact> createState() => _CreateContactState();
}

class _CreateContactState extends State<CreateContact> {
  TextEditingController teName = TextEditingController();
  TextEditingController teNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Contact"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey[400], shape: BoxShape.circle),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Kolom harus terisi";
                        }
                        return null;
                      },
                      maxLines: 1,
                      controller: teName,
                      textCapitalization: TextCapitalization.words,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "Name",
                          counterText: '',
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true),
                    )
                  ]),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Kolom harus terisi";
                        }
                        return null;
                      },
                      maxLines: 1,
                      controller: teNumber,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Number",
                          counterText: '',
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: InkWell(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Data Tersimpan')),
              );
              var data = {
                "name": teName.text.toString(),
                "number": teNumber.text.toString()
              };
              Navigator.of(context)
                  .pop({'name': data["name"], "number": data["number"]});
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Kesalahan pada validasi')),
              );
            }
          },
          child: SizedBox(
            height: kToolbarHeight,
            child: Center(
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
