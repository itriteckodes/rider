import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget button(context, {onPress, disabled = false}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.45,
    height: 45,
    child: ElevatedButton(
      onPressed: () {
        if(!disabled)
          onPress();
      },
      style: ElevatedButton.styleFrom(
        primary: disabled? Clr.silver:Clr.green,
        onPrimary: Clr.white,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5),
        ),
      ),
      child: Text(
        disabled?'Approved':'Update',
        style: TextStyle(color: Clr.white, fontSize: Sizer.fontSix()),
      ),
    ),
  );
}
