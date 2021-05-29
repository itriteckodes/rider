import 'package:flutter/material.dart';
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
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gojak Rider',
      home: LoginScreen(),
      initialRoute: 'splash',
      builder: EasyLoading.init(),
      theme: ThemeData(),
      navigatorObservers: [routeObserver],
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
//@JAK@jbg@12345
//215