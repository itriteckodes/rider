import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget textArea(context, textController, hint, {bool obscure = false}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    child: TextField(
      controller: textController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      minLines: 5,
      decoration: InputDecoration(
        labelText: hint, 
        labelStyle: TextStyle(color: Clr.green),
        alignLabelWithHint: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Clr.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Clr.green),
        ),
      ),
    ),
  );

}
