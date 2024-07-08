import 'package:flutter/material.dart';

class MyTextield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextield(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

// Style Textfield yang digunakan
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.5),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black)),
      ),
    );
  }
}
