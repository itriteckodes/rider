import 'package:driver/screens/wallet/box.dart';
import 'package:driver/screens/wallet/card.dart';
import 'package:driver/screens/static/side_drawer.dart';
import 'package:driver/screens/static/home_baloon.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Clr.lightGrey,
      key: scaffoldKey,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              HomeBaloon(context),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Wallet',
                      style: TextStyle(color: Clr.white, fontSize: 55, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        scaffoldKey.currentState.openDrawer();
                      },
                      child: Ink(
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.bars,
                            size: Sizer.fontFour(),
                            color: Clr.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Online',
                      style: TextStyle(
                        color: Clr.white,
                        fontSize: Sizer.fontSix(),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.275,
                left: MediaQuery.of(context).size.width * 0.015,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: Clr.green),
                    color: Clr.white,
                  ),
                  width: MediaQuery.of(context).size.width * 0.97,
                  height: 202,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          box(context, 'Avaialble Balance', 'PKR 2500/-', Border(right: BorderSide(color: Clr.green))),
                          box(context, 'Lifetime Earning', 'PKR 124502/-', Border()),
                        ],
                      ),
                      Row(
                        children: [
                          box(context, 'Total Passengers', '7758', Border(right: BorderSide(color: Clr.green), top: BorderSide(color: Clr.green))),
                          box(context, 'Orders delivered', '931', Border(top: BorderSide(color: Clr.green))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.55,
                left: MediaQuery.of(context).size.width * 0.015,
                child: Column(
                  children: [
                    card(context, 'Withdraw', FontAwesomeIcons.moneyBillWave, () {
                      Navigator.pushNamed(context, 'withdraw');
                    }),
                    SizedBox(height: 5),
                    card(context, 'Transactions', FontAwesomeIcons.buffer, () {
                      Navigator.pushNamed(context, 'transactions');
                    }),
                    SizedBox(height: 5),
                    card(context, 'Profile', FontAwesomeIcons.userCog, () {
                      Navigator.pushNamed(context, 'profile');
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawerEnableOpenDragGesture: false,
      drawer: SideDrawer(context),
    );
  }
}
