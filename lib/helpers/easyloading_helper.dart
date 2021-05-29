import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyloadingHelper {
  static init() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.doubleBounce
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 90.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Clr.green
      ..textColor = Clr.green
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
    // ..customAnimation = customAnimation();
  }
}
