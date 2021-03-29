import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

Widget box(context, text, value, border) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.482,
    height: 100,
    decoration: BoxDecoration(
      border: border
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(color: Clr.green, fontSize: Sizer.fontFive(), fontWeight: FontWeight.bold),
          ),
          Text(
            text,
            style: TextStyle(color: Clr.black, fontSize: Sizer.fontSeven(), fontWeight: FontWeight.normal),
          ),
        ],
      ),
    ),
  );
}
