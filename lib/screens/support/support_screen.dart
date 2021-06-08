import 'package:driver/screens/support/bottom_navigation.dart';
import 'package:driver/screens/support/fragments/history/history_fragment.dart';
import 'package:driver/screens/support/fragments/new/new_fragment.dart';
import 'package:driver/screens/static/baloon.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SupportScreen extends StatefulWidget {
  SupportScreen({Key key}) : super(key: key);

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final GlobalKey<NewFragmentState> _key = GlobalKey();
  int _navigationMenuIndex;
  var _screens;

  @override
  void initState() {
    super.initState();
    _navigationMenuIndex = 0;
    _screens = [
      NewFragment(),
      HistoryFragment(),
    ];
  }

  onTapBottomMenu(int index) async {
    setState(() {
      _navigationMenuIndex = index;
    });

    // _key.currentState.fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
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
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                FontAwesomeIcons.chevronCircleLeft,
                                size: Sizer.fontThree(),
                                color: Clr.white,
                              ),
                            ),
                          ),
                          Text(
                            'Support',
                            style: TextStyle(
                              color: Clr.white,
                              fontSize: Sizer.fontTwo(),
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
