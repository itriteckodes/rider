import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget datePicker(context, selectedDate, _onSelectDate, textController, hint) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.80,
    height: 50,
    child: GestureDetector(
      onTap: (){
        _onSelectDate(textController);
      },
      child: AbsorbPointer(
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
            labelText: hint,
            labelStyle: TextStyle(color: Clr.green),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Clr.green),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Clr.green),
            ),
          ),
        ),
      ),
    ),
  );
  // return Container(
  //   width: MediaQuery.of(context).size.width * 0.8,
  //   height: 60,
  //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Clr.green)),
  //   child: InkWell(
  //     child: Padding(
  //       padding: EdgeInsets.only(top: 20, bottom: 8, left: 8),
  //       child: Text(
  //         selectedDate.toLocal().toString().split(' ')[0],
  //         style: TextStyle(fontSize: Sizer.fontSeven(), color: Clr.black),
  //       ),
  //     ),
  //   ),
  // );
}
