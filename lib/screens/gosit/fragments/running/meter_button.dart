import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget meterButton(context, onPress, text, color) {
  return Container(
    decoration: new BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: InkWell(
      onTap: () {
        print("Went throuhg here");
        onPress(context);
      },
      child: Ink(
        height: 50.0,
        width: MediaQuery.of(context).size.width * 0.4,
        child: new Center(
          child: Text(
            text,
            style: TextStyle(color: Clr.white, fontSize: Sizer.fontFive(), fontFamily: 'digital',letterSpacing: 2)
          ),
        ),
      ),
    ),
  );
}
