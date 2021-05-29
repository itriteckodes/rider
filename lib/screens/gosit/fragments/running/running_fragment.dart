import 'package:driver/api/gosit_api.dart';
import 'package:driver/helpers/location.dart';
import 'package:driver/models/GositOrder.dart';
import 'package:driver/screens/gosit/fragments/running/no_order_framgent.dart';
import 'package:driver/screens/gosit/fragments/running/order_card.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/StaticValues.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return noOrdersAvailable()
        ? noOrderFragment(context)
        :Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Clr.white),
      height: MediaQuery.of(context).size.height * 0.76,
      child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          if (_orders.length > 0)
            for (var order in _orders) OrderCard(order: order, onFinish: onFinish),
        ],
      ),
    );
  }
}
