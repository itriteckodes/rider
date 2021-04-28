import 'package:flutter/material.dart';

class Clr {
  static var red = fromHex('#9B2420');
  static var blue = fromHex('#1B2E4A');
  static var lightGreen = fromHex('#006A01');
  static var green = fromHex('#00401A');
  
  static var btnSuccess = fromHex('#7DBE02');
  static var btnWarning = fromHex('#EF7F1A');
  static var btnDanger = fromHex('#EB0404');
  
  static var lightGrey = fromHex('#D9DBDA');
  static var grey = fromHex('#D9DADA');
  static var silver = fromHex('#b5b5b5');
  static var white = Colors.white;
  static var black = Colors.black;

  static Color fromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse("0x$hexColor"));
  }
}
