import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final controller;
  final String hint;
  final bool obscureText;
  const TextBox({super.key, required this.controller, required this.hint, required this.obscureText,});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(hintText: hint),
    );
  }
}