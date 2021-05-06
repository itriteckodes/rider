import 'package:driver/api/status_api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/screens/home/card.dart';
import 'package:driver/screens/static/side_drawer.dart';
import 'package:driver/screens/static/home_baloon.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  changeOnlineStatus() async {
    if (Auth.user().online)
      await StatusApi.offline();
    else
      await StatusApi.online();
    setState(() {});
  }

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
              HomeBaloon(context, color: Auth.user().online ? Clr.green : Clr.red),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Go JAK',
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
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            changeOnlineStatus();
                          },
                          child: Ink(
                            child: Container(
                              child: Text(
                                Auth.user().online ? 'Online' : 'Offline',
                                style: TextStyle(
                                  color: Clr.white,
                                  fontSize: Sizer.fontSix(),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'map');
                          },
                          child: Ink(
                            child: Container(
                              child: Icon(
                                FontAwesomeIcons.globe,
                                size: Sizer.fontFour(),
                                color: Clr.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.275,
                left: MediaQuery.of(context).size.width * 0.015,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.97,
                  height: 202,
                  child: Image(
                    image: AssetImage('lib/assets/images/logo.png'),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.55,
                left: MediaQuery.of(context).size.width * 0.015,
                child: Column(
                  children: [
                    card(
                      context,
                      'Go & Sit',
                      FontAwesomeIcons.bus,
                      onTap: () {
                        Navigator.pushNamed(context, 'gosit');
                      },
                      active: Auth.user().allowedGosit
                    ),
                    SizedBox(height: 5),
                    card(
                      context,
                      'Ride',
                      FontAwesomeIcons.car,
                      onTap: () {
                        Navigator.pushNamed(context, 'passenger');
                      },
                      active: Auth.user().allowedRide
                    ),
                    SizedBox(height: 5),
                    card(
                      context,
                      'Deliver Food',
                      FontAwesomeIcons.pizzaSlice,
                      onTap: () {
                        Navigator.pushNamed(context, 'food');
                      },
                      active: Auth.user().allowedFood
                    ),
                    SizedBox(height: 5),
                    card(
                      context,
                      'Deliver Parsel',
                      FontAwesomeIcons.boxOpen,
                      onTap: () {
                        Navigator.pushNamed(context, 'parcel');
                      },
                      active: Auth.user().allowedParcel
                    ),
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
