import 'package:driver/api/status_api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/main.dart';
import 'package:driver/screens/home/card.dart';
import 'package:driver/screens/home/map/map_screen.dart';
import 'package:driver/screens/home/warning_card.dart';
import 'package:driver/screens/static/side_drawer.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool online;

  changeOnlineStatus(context, value) async {
    EasyLoading.show();
    if (online) {
      setState(() {
        online = false;
      });
      await StatusApi.offline();
    } else {
      setState(() {
        online = true;
      });
      await StatusApi.online();
    }

    EasyLoading.dismiss();
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    final route = ModalRoute.of(context).settings.name;
    if (route == 'home') {
      setState(() {});
    }
  }

  @override
  void initState() {
    online = Auth.user().online;
    super.initState();
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
              MapScreen(),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                                  color: Clr.green,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                child: Ink(
                                  child: Container(
                                    child: Text(
                                      Auth.user().online ? 'Online' : 'Offline',
                                      style: TextStyle(
                                        color: Auth.user().online ? Clr.green : Clr.red,
                                        fontSize: Sizer.fontSix(),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Switch(
                                  value: online,
                                  onChanged: (value) {
                                    changeOnlineStatus(context, value);
                                  },
                                  activeColor: Clr.green,
                                  inactiveThumbColor: Clr.red,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    if (Auth.user().specialStatusType != 3)
                      warningCard(
                        context,
                        Auth.user().specialStatus,
                        FontAwesomeIcons.bus,
                        onTap: () {
                          if (Auth.user().specialStatusType == 1)
                            Navigator.pushNamed(context, 'gosit');
                          else if (Auth.user().specialStatusType == 4) Navigator.pushNamed(context, 'deposit');
                        },
                      ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.55,
                left: MediaQuery.of(context).size.width * 0.015,
                child: Column(
                  children: [
                    card(context, 'Sit & Go', FontAwesomeIcons.bus, onTap: () {
                      Navigator.pushNamed(context, 'gosit');
                    }, active: Auth.user().allowedGosit),
                    SizedBox(height: 5),
                    card(context, 'Ride', FontAwesomeIcons.car, onTap: () {
                      Navigator.pushNamed(context, 'passenger');
                    }, active: Auth.user().allowedRide),
                    SizedBox(height: 5),
                    card(context, 'Deliver Food', FontAwesomeIcons.pizzaSlice, onTap: () {
                      Navigator.pushNamed(context, 'food');
                    }, active: Auth.user().allowedFood),
                    SizedBox(height: 5),
                    card(context, 'Deliver Parsel', FontAwesomeIcons.boxOpen, onTap: () {
                      Navigator.pushNamed(context, 'parcel');
                    }, active: Auth.user().allowedParcel),
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
