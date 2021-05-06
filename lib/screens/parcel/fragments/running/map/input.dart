import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget input(context, textController, hint, {bool obscure = false}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.7,
    height: 50,
    child: TextField(
      keyboardType: TextInputType.number,
      obscureText: obscure,
      controller: textController,
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: TextStyle(color: Clr.green
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Clr.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Clr.green),
        ),
      ),
    ),
  );
}
