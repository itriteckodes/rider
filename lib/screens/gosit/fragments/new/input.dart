import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget Input(context, textController, hint, {bool obscure = false}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.5,
    child: TextFormField(
      obscureText: obscure,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: Sizer.fontFive(), color: Clr.black),
      controller: textController,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Clr.green),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Clr.green),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: Sizer.fontSix(),
          color: Clr.black,
        ),
      ),
    ),
  );
}
