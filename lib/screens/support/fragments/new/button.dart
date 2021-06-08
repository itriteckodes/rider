import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget button(context, onPress, text, color) {
  return Container(
    decoration: new BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: InkWell(
      onTap: () {
        onPress();
      },
      child: Ink(
        height: 40.0,
        width: MediaQuery.of(context).size.width * 0.4,
        child: new Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: Sizer.fontSix(),
              fontWeight: FontWeight.normal,
              color: Clr.white,
            ),
          ),
        ),
      ),
    ),
  );
}
