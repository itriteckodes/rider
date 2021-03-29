import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget HomeBaloon(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 200,
    decoration: BoxDecoration(
        color: Clr.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(180),
          bottomRight: Radius.circular(180),
        )),
  );
}
