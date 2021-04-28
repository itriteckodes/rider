import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget card(context, text, icon, onTap) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.95,
    height: 70,
    decoration: BoxDecoration(
      color: Clr.white,
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
        padding: EdgeInsets.only(left: 20.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  icon,
                  color: Clr.green,
                  size: Sizer.fontFour(),
                ),
                SizedBox(
                  width: 17,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Clr.black,
                    fontSize: Sizer.fontSix(),
                  ),
                ),
              ],
            ),
            Icon(
              FontAwesomeIcons.chevronRight,
              color: Clr.green,
              size: Sizer.fontFive(),
            )
          ],
        ),
      ),
    ),
  );
}
