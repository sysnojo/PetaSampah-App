import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petasampah_1/Revo/kotak_text.dart';
import 'package:petasampah_1/Revo/pengatur.dart';
import 'package:petasampah_1/homepage/home.dart';
import 'package:petasampah_1/splashpage/startup.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void SignUpControl() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showerrormassage(e.code);
    }
  }

  void showerrormassage(String massage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.deepPurple,
              title: Center(
                  child: Text(
                massage,
                style: const TextStyle(color: Color.fromARGB(255, 205, 23, 23)),
              )));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 114, 49),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: FractionalTranslation(
                translation: const Offset(0, -0.7),
                child: Container(
                  color: const Color.fromARGB(255, 28, 114, 49),
                  child: Image.asset(
                    'assets/logo/PetaSampah_logo.png',
                    width: 250,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: FractionalTranslation(
                translation: const Offset(0, -0.1),
                child: Container(
                    color: Colors.transparent,
                    child: const Text(
                      'Email',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          color: Colors.white),
                    )),
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Poppins'), // Set the input text color to black
              obscureText: false,
            ),
            const SizedBox(height: 25),
            Align(
              alignment: Alignment.centerLeft,
              child: FractionalTranslation(
                translation: const Offset(0, -0.1),
                child: Container(
                    color: Colors.transparent,
                    child: const Text(
                      'Password',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          color: Colors.white),
                    )),
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Poppins'), // Set the input text color to black
              obscureText: false,
            ),
            FractionalTranslation(
              translation: const Offset(0.02, 0.9),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  fixedSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color.fromARGB(255, 30, 90, 22),
                ),
                onPressed: () {
                  SignUpControl();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            FractionalTranslation(
              translation: const Offset(0.02, 1.4),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  fixedSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color.fromARGB(255, 30, 90, 22),
                ),
                onPressed: () {
                  _handleSignUp();
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSignUp() {
    // TODO: Implement sign-up logic.
    // This function will be triggered when the user taps on "Sign Up" button.
    // You can navigate to the sign-up page or implement the sign-up logic here.
    print('Sign Up button tapped!');
  }
}
