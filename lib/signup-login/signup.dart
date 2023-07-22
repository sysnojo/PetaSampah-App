import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'login.dart';
import '../homepage/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key,});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 220,
                child: FractionalTranslation(
                  translation: const Offset(1.25, 0.05),
                  child: Image.asset(
                    'assets/login-sign up/signup_img_left.png',
                    width: 160,
                    height: 160,
                  ),
                ),
              ),
              const FractionalTranslation(
                translation: Offset(0.15, -2.2),
                child: Text(
                  "Be a part of us to\nchange the earth!",
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 19),
                ),
              ),
              const FractionalTranslation(
                translation: Offset(0.47, -2),
                child: Text(
                  "Email",
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 19),
                ),
              ),
              FractionalTranslation(
                translation: const Offset(-0.01, -1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    width: 320,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 219, 219, 219),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 19,
                          color: Colors.black,
                        ),
                        enabled: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'noplastic@example.com',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            color: Color.fromARGB(255, 197, 197, 197),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const FractionalTranslation(
                translation: Offset(0.3, -1),
                child: Text(
                  "Password",
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 19),
                ),
              ),
              FractionalTranslation(
                translation: const Offset(-0.01, -0.4),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    width: 320,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 219, 219, 219),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 19,
                          color: Colors.black,
                        ),
                        enabled: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'iloveSUSt4inablity',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            color: Color.fromARGB(255, 197, 197, 197),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              FractionalTranslation(
                translation: const Offset(0.09, 0.5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.white,
                    fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color.fromARGB(255, 38, 152, 156),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: const Duration(milliseconds: 700),
                        child: const HomePage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Okay, let's go!",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              FractionalTranslation(
                translation: const Offset(0.09, 0.83),
                child: ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    shadowColor: Colors.transparent,
                    side: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: const Duration(milliseconds: 700),
                        child: const SignUp(),
                      ),
                    );
                  },
                  child: const Text(
                    "I have an account..",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              FractionalTranslation(
                translation: const Offset(0.12, -0.15),
                child: Image.asset(
                  'assets/login-sign up/signup_img_down.png',
                  width: 290,
                  height: 290,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
