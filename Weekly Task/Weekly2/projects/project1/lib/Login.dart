import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController identity = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool _passVisible = true;

  @override
  void dispose() {
    // TODO: implement dispose
    identity.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 40),
            child: Image(
              image: AssetImage("assets/login.png"),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Sign In",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 40,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: identity,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kolom harus terisi";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.alternate_email_rounded),
                      hintText: "Email / Username",
                      label: Text("Email / Username"),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextFormField(
                    obscureText: _passVisible,
                    controller: pass,
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
              onPressed: () async {},
              child: Center(
                child: Text("Sign In"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
