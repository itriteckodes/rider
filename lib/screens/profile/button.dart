import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget button(context, {onPress}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.45,
    height: 45,
    child: ElevatedButton(
      onPressed: () {
        onPress();
      },
      style: ElevatedButton.styleFrom(
        primary: Clr.green,
        onPrimary: Clr.white,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5),
        ),
      ),
      child: Text(
        'Update',
        style: TextStyle(color: Clr.white, fontSize: Sizer.fontSix()),
      ),
    ),
  );
}
