import 'package:driver/screens/gosit/bottom_navigation.dart';
import 'package:driver/screens/gosit/fragments/history/history_fragment.dart';
import 'package:driver/screens/gosit/fragments/running/running_fragment.dart';
import 'package:driver/screens/static/baloon.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GositScreen extends StatefulWidget {
  GositScreen({Key key}) : super(key: key);

  @override
  _GositScreenState createState() => _GositScreenState();
}

class _GositScreenState extends State<GositScreen> {
  final GlobalKey<RunningFragmentState> _key = GlobalKey();
  int _navigationMenuIndex;
  var _screens;

  @override
  void initState() {
    super.initState();
    _navigationMenuIndex = 0;
    _screens = [
      RunningFragment(),
      HistoryFragment(),
    ];
  }

  onTapBottomMenu(int index) async {
    setState(() {
      _navigationMenuIndex = index;
    });

    _key.currentState.fetchOrders();
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
                            'Sit & Go Orders',
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
