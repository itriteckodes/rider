import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget Input(context, textController, hint, {bool obscure = false}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.75,
    child: TextFormField(
      obscureText: obscure,
      style: TextStyle(fontSize: Sizer.fontSix(),color: Clr.white),
      controller: textController,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Clr.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Clr.white),
        ),
        hintText: hint,
        hintStyle: TextStyle(fontSize: Sizer.fontSix(),
        color: Clr.white),
      ),
    ),
  );
}
