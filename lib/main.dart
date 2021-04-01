import 'package:driver/screens/food/food_screen.dart';
import 'package:driver/screens/gosit/gosit_screen.dart';
import 'package:driver/screens/home/home_screen.dart';
import 'package:driver/screens/login/login_screen.dart';
import 'package:driver/screens/parcel/parcel_screen.dart';
import 'package:driver/screens/passenger/passenger_screen.dart';
import 'package:driver/screens/profile/profile_screen.dart';
import 'package:driver/screens/withdraw/withdraw_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
  easyLoading();
}

void easyLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.doubleBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 90.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.green
    ..textColor = Colors.green
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = customAnimation();
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gojak Rider',
      home: LoginScreen(),
      builder: EasyLoading.init(),
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginScreen(),
        'home': (context) => HomeScreen(),
        'food': (context) => FoodScreen(),
        'gosit': (context) => GositScreen(),
        'parcel': (context) => ParcelScreen(),
        'passenger': (context) => PassengerScreen(),
        'profile': (context) => ProfileScreen(),
        'withdraw': (context) => WithdrawScreen(),
      },
    );
  }
}
