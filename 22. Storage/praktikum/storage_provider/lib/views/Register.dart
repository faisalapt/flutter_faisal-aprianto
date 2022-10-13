import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage_provider/models/User.dart';
import 'package:storage_provider/providers/UserProviders.dart';
import 'package:storage_provider/views/HomeScreen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController teName = TextEditingController();
  TextEditingController teNumber = TextEditingController();
  TextEditingController teEmail = TextEditingController();
  TextEditingController tePass = TextEditingController();

  late SharedPreferences userData;

  bool _passVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passVisible = true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    teEmail.dispose();
    teName.dispose();
    teNumber.dispose();
    tePass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userPrivder = Provider.of<UserProviders>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xFFFC6C50),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 40, top: 70),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xAA000000),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.star,
                  color: Color(0xBBFFFFFF),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 40),
                      ),
                      Text(
                        "Account",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 40),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Nama Harus Diisi";
                              }
                              return null;
                            },
                            decoration: InputDecoration(label: Text("Name")),
                            controller: teName,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email Harus diisi";
                              }
                              return null;
                            },
                            decoration:
                                InputDecoration(label: Text("Email Address")),
                            controller: teEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Phone Number Harus Diisi";
                              }
                              return null;
                            },
                            decoration:
                                InputDecoration(label: Text("Phone Number")),
                            controller: teNumber,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password Harus Diisi";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text("Password"),
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
                            ),
                            controller: tePass,
                            keyboardType: TextInputType.text,
                            obscureText: _passVisible,
                            enableSuggestions: false,
                            autocorrect: false,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Register",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 40,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_right_alt_sharp,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    if (!_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Kesalahan pada validasi'),
                                        ),
                                      );
                                    }
                                    var user = User(
                                        name: teName.text,
                                        email: teEmail.text,
                                        password: tePass.text,
                                        number: teNumber.text);
                                    userPrivder.set(user);
                                    userData =
                                        await SharedPreferences.getInstance();
                                    userData.setString("name", teName.text);
                                    userData.setString("email", teEmail.text);
                                    userData.setBool("isLogin", true);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => HomeScreen()),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
