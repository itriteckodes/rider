import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget MainHeading() {
  return Text(
    "Register Here",
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: Sizer.fontOne(),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: Clr.white,
    ),
  );
}
