import 'package:flutter/material.dart';

Widget userInput(String labelText, TextInputType keyboardType,
    TextEditingController controller, obscureText, maxLength) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    child: Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        maxLength: maxLength,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          counterText: '',
          labelText: labelText,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        style: const TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    ),
  );
}
