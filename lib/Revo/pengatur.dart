import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petasampah_1/Revo/check_autentikasi.dart';
import 'package:petasampah_1/homepage/home.dart';
import 'package:petasampah_1/signup-login/login.dart';
import 'package:petasampah_1/splashpage/startup.dart';

class check_login extends StatelessWidget {
  const check_login();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // user sudah login
        if (snapshot.hasData) {
          return const HomePage();
        }

        // user belum login
        else {
          return const Login();
        }
      },
    ));
  }
}
