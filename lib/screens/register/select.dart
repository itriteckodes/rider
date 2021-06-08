import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

Widget select(context, onChanged, selectedValue) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    height: 50,
    child: InputDecorator(
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Clr.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Clr.white),
        ),
        contentPadding: EdgeInsets.only(bottom: 0, left: 10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          iconEnabledColor: Clr.white,
          value: selectedValue,
          dropdownColor: Clr.green,
          items: [
            DropdownMenuItem(value: "male", child: Text("Male",)),
            DropdownMenuItem(value: "female", child: Text("Female")),
          ],
          onChanged: onChanged,
          style: TextStyle(color: Clr.white, fontSize: Sizer.fontSix()),
        ),
      ),
    ),
  );
}
