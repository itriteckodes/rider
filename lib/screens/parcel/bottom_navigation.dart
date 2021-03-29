import 'package:driver/values/Clr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: non_constant_identifier_names
Widget BottomNavigation(_navigationMenuIndex, onTapBottomMenu) {
  return BottomNavigationBar(
    backgroundColor: Clr.white,
    selectedItemColor: Clr.green,
    unselectedItemColor: Clr.green.withOpacity(.6),
    selectedFontSize: 14,
    unselectedFontSize: 14,
    unselectedLabelStyle: TextStyle(color: Clr.green),
    currentIndex: _navigationMenuIndex,
    onTap: (int index) {
      onTapBottomMenu(index);
    },
    items: [
      BottomNavigationBarItem(
        label: 'Available',
        icon: Icon(FontAwesomeIcons.gifts),
      ),
      BottomNavigationBarItem(
        label: 'Running',
        icon: Icon(FontAwesomeIcons.sync),
      ),
      BottomNavigationBarItem(
        label: 'History',
        icon: Icon(FontAwesomeIcons.history),
      ),
    ],
  );
}
