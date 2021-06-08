import 'package:driver/api/gosit_api.dart';
import 'package:driver/helpers/location.dart';
import 'package:driver/models/GositOrder.dart';
import 'package:driver/screens/gosit/fragments/running/meter_button.dart';
import 'package:driver/screens/gosit/fragments/running/show_modal.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:driver/values/StaticValues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as Loc;
import 'package:driver/models/RouteInfo.dart';
import 'package:driver/api/location_api.dart';

class RunningFragment extends StatefulWidget {
  RunningFragment({Key key}) : super(key: key);

  @override
  RunningFragmentState createState() => RunningFragmentState();
}

class RunningFragmentState extends State<RunningFragment> {
  List<GositOrder> _orders = [];

  Loc.Location location = Loc.Location();
  var locationSubscription;

  Position _currentPosition;

  bool firstCall = true;

  void onFinish() {
    setState(() {
      _orders = [];
    });
    fetchOrders();
  }

  void fetchOrders() async {
    List<GositOrder> orders = await GositApi.runningOrders();
    setState(() {
      _orders = orders;
      firstCall = false;
    });
  }

  getRouteInfo() async {
    for (GositOrder order in _orders) {
      RouteInfo route = await LocationApi.getRouteInfo(order.originPosition, _currentPosition);
      order.distance = route.distance;
      order.fare = StaticValues.gositBaseFare + (route.distance * StaticValues.gositPerKm);
    }
    setState(() {});
  }

  runLocationService() {
    locationSubscription = location.onLocationChanged.listen((locationData) async {
      if (locationData != null) {
        updateCurrentPosition();
      }
    });
  }

  updateCurrentPosition() async {
    _currentPosition = await Geo.position();
    getRouteInfo();
  }

  _initPostions() async {
    _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    runLocationService();
  }

  @override
  void initState() {
    super.initState();
    fetchOrders();
    _initPostions();
    updateCurrentPosition();
  }

  @override
  void dispose() {
    locationSubscription.cancel();
    super.dispose();
  }

  noOrdersAvailable() {
    if (_orders.length < 1 && !firstCall)
      return true;
    else
      return false;
  }

  start(context) async {
    EasyLoading.show();
    List<GositOrder> orders = await GositApi.startOrder(await Geo.location(), "Sit & Go Customer");
    setState(() {
      _orders = orders;
      firstCall = false;
    });
    EasyLoading.dismiss();
  }

  stop(context) async {
    var finished = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShowModal(
          order: _orders[0],
        );
      },
    );
    if (finished) onFinish();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Clr.white),
      height: MediaQuery.of(context).size.height * 0.76,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          if (_orders.length > 0)
            Text(
              "Running",
              style: TextStyle(color: Clr.green, fontSize: Sizer.fontTwo()),
            ),
          if (_orders.length == 0)
            Text(
              "Stopped",
              style: TextStyle(color: Clr.red, fontSize: Sizer.fontTwo(), fontFamily: 'digital', letterSpacing: 2),
            ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Started : ",
                  style: TextStyle(color: Clr.green, fontSize: Sizer.fontFour(), fontFamily: 'digital', letterSpacing: 2),
                ),
                Text(
                  (_orders.length > 0 ? _orders[0].startedAt.toString() : "----"),
                  style: TextStyle(color: Clr.green, fontSize: Sizer.fontThree(), fontFamily: 'digital', letterSpacing: 2),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Distance : ",
                  style: TextStyle(color: Clr.green, fontSize: Sizer.fontFour(), fontFamily: 'digital', letterSpacing: 2, fontWeight: FontWeight.bold),
                ),
                Text(
                  (_orders.length > 0 ? _orders[0].distance.toString() + " KM" : "0 KM"),
                  style: TextStyle(color: Clr.green, fontSize: Sizer.fontThree(), fontFamily: 'digital', letterSpacing: 2, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fare : ",
                  style: TextStyle(color: Clr.green, fontSize: Sizer.fontFour(), fontFamily: 'digital', letterSpacing: 2, fontWeight: FontWeight.bold),
                ),
                Text(
                  (_orders.length > 0 ? "PKR " + _orders[0].fare.toString() : " PKR 0"),
                  style: TextStyle(color: Clr.green, fontSize: Sizer.fontThree(), fontFamily: 'digital', letterSpacing: 2, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          if (_orders.length == 0) meterButton(context, start, "Start Now", Clr.green),
          if (_orders.length > 0) meterButton(context, stop, "Stop Now", Clr.red),
          SizedBox(height: 10,),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image(image: AssetImage("lib/assets/images/logo.png")),
          ),
        ],
      ),
    );
  }
}
