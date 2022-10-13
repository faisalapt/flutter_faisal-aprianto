import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage_bloc/user/UI/Register.dart';

import '../bloc/user_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences? loginData;
  bool? isLogin;

  @override
  void initState() {
    // TODO: implement initState
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    isLogin = loginData!.getBool('isLogin') ?? false;

    if (isLogin == false || isLogin == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Register()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: BlocBuilder<UserBloc, UserState>(
          bloc: userBloc,
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.user.name ?? ''),
                    Text(state.user.email ?? ''),
                    ElevatedButton(
                      onPressed: () {
                        loginData!.remove("name");
                        loginData!.remove("email");
                        loginData!.setBool("isLogin", false);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HomePage(),
                          ),
                        );
                      },
                      child: Text("Logout"),
                    ),
                  ],
                ),
              );
            } else {
              return Text("Something went wrong");
            }
          }),
    );
  }
}
