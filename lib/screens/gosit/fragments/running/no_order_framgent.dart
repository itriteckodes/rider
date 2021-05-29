import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

Widget noOrderFragment(context){
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Clr.white),
    height: MediaQuery.of(context).size.height * 0.76,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top : 50),
          child: Column(
            children: [
              Text(
                'No Orders',
                style: TextStyle(
                  color: Clr.green,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizer.fontFour(),
                ),
              ),
              Text(
                "running at this moment",
                style: TextStyle(
                  color: Clr.green,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizer.fontSix(),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}