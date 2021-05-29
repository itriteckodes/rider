import 'package:driver/helpers/auth.dart';
import 'package:driver/screens/food/bottom_navigation.dart';
import 'package:driver/screens/food/fragments/available/available_fragment.dart';
import 'package:driver/screens/food/fragments/running/running_fragment.dart';
import 'package:driver/screens/food/fragments/history/history_fragment.dart';
import 'package:driver/screens/static/baloon.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodScreen extends StatefulWidget {
  FoodScreen({Key key}) : super(key: key);

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int _navigationMenuIndex = 0;

  switchFragment(int index) {
    setState(() {
      _navigationMenuIndex = index;
    });
  }

  @override
  void initState() {
    if (Auth.user().mode == 'food') {
      _navigationMenuIndex = 1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    var _fragments = [
      AvailableFragment(switchFragment: switchFragment),
      RunningFragment(switchFragment: switchFragment),
      HistoryFragment(),
    ];

    return Scaffold(
      backgroundColor: Clr.grey,
      body: SafeArea(
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
                          'Food Orders',
                          style: TextStyle(
                            color: Clr.white,
                            fontSize: Sizer.fontTwo(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _fragments[_navigationMenuIndex],
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(_navigationMenuIndex, switchFragment),
    );
  }
}
