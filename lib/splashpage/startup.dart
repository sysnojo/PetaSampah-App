import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petasampah_1/Revo/check_autentikasi.dart';
import 'package:petasampah_1/Revo/pengatur.dart';
import 'package:petasampah_1/homepage/home.dart';
import 'package:petasampah_1/signup-login/signup.dart';

import '../signup-login/login.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  @override
  void initState() {
    super.initState();
    setTransparentStatusBar();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 1000),
          child: const check_login(),
        ),
      );
    });
  }

  @override
  void dispose() {
    restoreOriginalStatusBar();
    super.dispose();
  }

  void setTransparentStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  void restoreOriginalStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          color: const Color.fromARGB(255, 28, 114, 49),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: const Color.fromARGB(255, 28, 114, 49),
                child: Center(
                  child: Image.asset(
                    'assets/logo/PetaSampah_logo.png',
                    width: 350,
                    height: 350,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          color: const Color.fromARGB(255, 28, 114, 49),
          alignment: Alignment.center,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionalTranslation(
                  translation: const Offset(0, -0.1),
                  child: Container(
                    height: 150,
                    color: const Color.fromARGB(255, 28, 114, 49),
                    child: Image.asset(
                      'assets/logo/mahadev_logo.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 28, 114, 49),
                child: const FractionalTranslation(
                  translation: Offset(0, -5.55),
                  child: Text(
                  "by team",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
