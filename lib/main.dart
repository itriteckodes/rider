// import 'package:driver/Services/online.dart';
import 'package:driver/Services/online.dart';
import 'package:driver/screens/food/food_screen.dart';
import 'package:driver/screens/gosit/gosit_screen.dart';
import 'package:driver/screens/home/home_screen.dart';
import 'package:driver/screens/login/login_screen.dart';
import 'package:driver/screens/map/map_screen.dart';
import 'package:driver/screens/parcel/parcel_screen.dart';
import 'package:driver/screens/passenger/passenger_screen.dart';
import 'package:driver/screens/profile/profile_screen.dart';
import 'package:driver/screens/register/register_screen.dart';
import 'package:driver/screens/splash/splash.dart';
import 'package:driver/screens/transactions/transaction_screen.dart';
import 'package:driver/screens/wallet/wallet_screen.dart';
import 'package:driver/screens/withdraw/withdraw_screen.dart';
import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

void main() {
  runApp(MyApp());
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _firebaseMessaging.configure(
    onMessage: (message) async {
      // streamListener(message);
      FlutterRingtonePlayer.play(
        android: AndroidSounds.notification,
        ios: IosSounds.glass,
        volume: 10,
      );
    },
    onLaunch: (message) async {
      // streamListener(message);
    },
    onResume: (message) async {
      // streamListener(message);
    },
  );

  easyLoading();
  
  OnlineService(50000);
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
    ..indicatorColor = Clr.green
    ..textColor = Clr.green
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
      initialRoute: 'splash',
      builder: EasyLoading.init(),
      theme: ThemeData(),
      routes: {
        'splash': (context) => SplashScreen(),
        'register': (context) => RegisterScreen(),
        'login': (context) => LoginScreen(),
        'home': (context) => HomeScreen(),
        'map': (context) => MapScreen(),
        'food': (context) => FoodScreen(),
        'gosit': (context) => GositScreen(),
        'parcel': (context) => ParcelScreen(),
        'passenger': (context) => PassengerScreen(),
        'wallet': (context) => WalletScreen(),
        'profile': (context) => ProfileScreen(),
        'withdraw': (context) => WithdrawScreen(),
        'transactions': (context) => TransactionScreen(),
      },
    );
  }
}

//12345@HEXONIC@jbg
//
//
//