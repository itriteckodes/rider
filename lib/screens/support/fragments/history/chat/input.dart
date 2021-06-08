import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

Widget input(context, hint, controller, sendMessage) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    height: 60,
    child: TextField(
      controller: controller,
      style: TextStyle(fontSize: 15, color: Clr.white),
      cursorColor: Colors.black,
      keyboardType: TextInputType.name,
      decoration: new InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.send, color: Clr.white,),
          onPressed: sendMessage,
        ),
        border: new OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        ),
        filled: true,
        fillColor: Clr.lightGreen.withOpacity(0.8),
        contentPadding: EdgeInsets.only(left: 25, bottom: 20, top: 20, right: 25),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 15, color: Clr.white),
      ),
    ),
  );
}
