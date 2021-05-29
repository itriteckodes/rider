import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

Widget select(context, onChanged, selectedValue) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    height: 50,
    child: InputDecorator(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Clr.green),
        ),
        contentPadding: EdgeInsets.only(bottom: 0, left: 10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          iconEnabledColor: Clr.green,
          value: selectedValue,
          items: [
            DropdownMenuItem(value: 1, child: Text("Luxury Car")),
            DropdownMenuItem(value: 2, child: Text("AC Car")),
            DropdownMenuItem(value: 3, child: Text("Non AC Car")),
            DropdownMenuItem(value: 4, child: Text("Bike")),
            DropdownMenuItem(value: 5, child: Text("Rikshaw")),
          ],
          onChanged: onChanged,
          style: TextStyle(color: Clr.green, fontSize: Sizer.fontSix()),
        ),
      ),
    ),
  );
}
