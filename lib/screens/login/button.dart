import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget Button(context, onPress, text) {
  return Container(
    decoration: new BoxDecoration(
      color: Clr.green,
      borderRadius: BorderRadius.circular(10),
    ),
    child: InkWell(
      onTap: () {
        onPress(context);
      },
      child: Ink(
        height: 50.0,
        width: MediaQuery.of(context).size.width * 0.75,
        child: new Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: Sizer.fontSix(),
              fontWeight: FontWeight.bold,
              color: Clr.white,
            ),
          ),
        ),
      ),
    ),
  );
}
