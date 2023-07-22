import 'package:flutter/material.dart';
import 'package:petasampah_1/homepage/home.dart';
import 'package:petasampah_1/signup-login/login.dart';
import 'package:petasampah_1/signup-login/signup.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  @override
  bool ShowLoginPage = true;

  void togglePages() {
    setState(() {
      ShowLoginPage = !ShowLoginPage;
    });
  }

  Widget build(BuildContext context) {
    if (ShowLoginPage) {
      return HomePage();
    } else {
      return Login();
    }
  }
}
