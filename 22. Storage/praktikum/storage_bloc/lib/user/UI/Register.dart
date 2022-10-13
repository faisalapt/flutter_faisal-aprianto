import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage_bloc/user/UI/HomePage.dart';

import '../../models/User.dart';
import '../bloc/user_bloc.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController teName = TextEditingController();
  TextEditingController teNumber = TextEditingController();
  TextEditingController teEmail = TextEditingController();
  TextEditingController tePass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passVisible = true;
  late SharedPreferences userData;

  @override
  void dispose() {
    // TODO: implement dispose
    teName.dispose();
    teNumber.dispose();
    teEmail.dispose();
    tePass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 40),
                child: Image(
                  image: AssetImage("assets/head_register.png"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: teName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Kolom harus terisi";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.perm_identity_rounded),
                          hintText: "Name",
                          label: Text("Name"),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      TextFormField(
                        controller: teEmail,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Kolom harus terisi";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email_rounded),
                          hintText: "Email",
                          label: Text("Email"),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      TextFormField(
                        controller: teNumber,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Kolom harus terisi";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.local_phone_rounded),
                          hintText: "Phone Number",
                          label: Text("Phone Number"),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      TextFormField(
                        obscureText: _passVisible,
                        controller: tePass,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Kolom harus terisi";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(_passVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _passVisible = !_passVisible;
                              });
                            },
                          ),
                          prefixIcon: Icon(Icons.password_rounded),
                          hintText: "Password",
                          label: Text("Password"),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var user = User(
                          name: teName.text,
                          email: teEmail.text,
                          number: teNumber.text,
                          pass: tePass.text);
                      context.read<UserBloc>().add(SetUser(user: user));
                      userData = await SharedPreferences.getInstance();
                      userData.setString("name", teName.text);
                      userData.setString("email", teEmail.text);
                      userData.setBool("isLogin", true);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomePage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Kesalahan pada validasi')),
                      );
                    }
                  },
                  child: Center(
                    child: Text("Sign up"),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
