import 'package:driver/screens/deposit/fragments/pending/pending_fragment.dart';
import 'package:driver/screens/deposit/bottom_navigation.dart';
import 'package:driver/screens/deposit/fragments/history/history_fragment.dart';
import 'package:driver/screens/deposit/fragments/new/new_fragment.dart';
import 'package:driver/screens/static/baloon.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DepositScreen extends StatefulWidget {
  DepositScreen({Key key}) : super(key: key);

  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  int _navigationMenuIndex;
  var _screens;

  @override
  void initState() {
    super.initState();
    _navigationMenuIndex = 0;
  }

  onTapBottomMenu(int index) async {
    setState(() {
      _navigationMenuIndex = index;
    });
  }

  switchFragment(index) {
    onTapBottomMenu(index);
  }

  @override
  Widget build(BuildContext context) {
    _screens = [
      NewFragment(),
      PendingFragment(),
      HistoryFragment(),
    ];

    return Scaffold(
      backgroundColor: Clr.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Baloon(context),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0, right: 10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                FontAwesomeIcons.chevronCircleLeft,
                                size: Sizer.fontThree(),
                                color: Clr.white,
                              ),
                            ),
                          ),
                          Text(
                            'Deposit',
                            style: TextStyle(
                              color: Clr.white,
                              fontSize: Sizer.fontFour(),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _screens[_navigationMenuIndex],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(_navigationMenuIndex, onTapBottomMenu),
    );
  }
}
