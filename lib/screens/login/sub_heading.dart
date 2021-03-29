import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget SubHeading() {
  return Text(
    "Sign in to continue",
    textAlign: TextAlign.left,
    style: TextStyle(
      fontSize: Sizer.fontFive(),
      fontStyle: FontStyle.normal,
      color: Clr.white,
    ),
  );
}
