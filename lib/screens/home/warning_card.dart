import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

Widget warningCard(context, text, icon, {onTap, active = false}) {
  var fontColor = active ? Clr.green : Clr.red;
  return Container(
    width: MediaQuery.of(context).size.width * 0.95,
    height: 80,
    decoration: BoxDecoration(
      border: Border.all(color: Clr.green),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        primary: Clr.white,
        onPrimary: Clr.green,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: fontColor,
            fontSize: Sizer.fontSix(),
          ),
        ),
      ),
    ),
  );
}
