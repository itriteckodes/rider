import 'package:driver/screens/parcel/bottom_navigation.dart';
import 'package:driver/screens/parcel/fragments/available/available_fragment.dart';
import 'package:driver/screens/parcel/fragments/running/running_fragment.dart';
import 'package:driver/screens/parcel/fragments/history/history_fragment.dart';
import 'package:driver/screens/static/baloon.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParcelScreen extends StatefulWidget {
  ParcelScreen({Key key}) : super(key: key);

  @override
  _ParcelScreenState createState() => _ParcelScreenState();
}

class _ParcelScreenState extends State<ParcelScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int _navigationMenuIndex = 0;

  var _fragments = [
    AvailableFragment(),
    RunningFragment(),
    HistoryFragment(),
  ];

  onTapBottomMenu(int index) {
    setState(() {
      _navigationMenuIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          'Parcel Orders',
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
      bottomNavigationBar: BottomNavigation(_navigationMenuIndex, onTapBottomMenu),
    );
  }
}
