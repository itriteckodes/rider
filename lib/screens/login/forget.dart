import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget forget({onTap}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ", style: TextStyle(color: Clr.white, fontSize: Sizer.fontSix())),
        Text("Signup", style: TextStyle(color: Clr.lightGreen, fontSize: Sizer.fontFive(), fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
