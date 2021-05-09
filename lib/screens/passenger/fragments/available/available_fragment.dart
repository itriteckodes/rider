import 'dart:convert';
import 'package:driver/api/passenger_api.dart';
import 'package:driver/helpers/location.dart';
import 'package:driver/helpers/text_helper.dart';
import 'package:driver/models/PassengerOrder.dart';
import 'package:driver/screens/passenger/fragments/available/order_card.dart';
import 'package:driver/screens/passenger/fragments/available/waiting_fragment.dart';
import 'package:driver/values/Clr.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as Loc;
import 'package:driver/models/RouteInfo.dart';
import 'package:driver/api/location_api.dart';  

class AvailableFragment extends StatefulWidget {
  AvailableFragment({Key key, @required this.switchFragment}) : super(key: key);

  final switchFragment;
  @override
  _AvailableFragmentState createState() => _AvailableFragmentState();
}

class _AvailableFragmentState extends State<AvailableFragment> {
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Loc.Location location = Loc.Location();
  var locationSubscription;

  Position _currentPosition;

  List _orders = [];

  @override
  void initState() {
    super.initState();
    fetchOrders();
    startListener();
    _initPostions();
    updateCurrentPosition();
  }

  @override
  void dispose() {
    locationSubscription.cancel();
    super.dispose();
  }

  void onAccept() {
    setState(() {
      _orders = [];
    });
    widget.switchFragment(1);
  }

  void fetchOrders() async {
    var orders = await PassengerApi.availableOrders();
    setState(() {
      _orders = orders;
    });
  }

  void addToOrders(order) async {
    setState(() {
      _orders.add(order);
    });
  }

  void removeFromOrders(order) async {
    setState(() {
      _orders.removeWhere((item) => item.id == order.id);
    });
  }

  getRouteInfo() async {
    for (PassengerOrder order in _orders) {
      RouteInfo route = await LocationApi.getRouteInfo(order.originPosition, _currentPosition);
      order.distance = route.distance;
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
    _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    runLocationService();
  }

  void streamListener(message) {
    var response = jsonDecode(message);
    if (response["type"] == "newpassengerorder") {
      addToOrders(PassengerOrder(response));
    } else if (response["type"] == "removepassengerorder") {
      removeFromOrders(PassengerOrder(response));
    }
  }

  void startListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      streamListener(TextHelper.firebase(message));
    });
  }

  @override
  Widget build(BuildContext context) {
    return _orders.length < 1
        ? waitingFragment(context)
        : Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Clr.white),
            height: MediaQuery.of(context).size.height * 0.76,
            child: ListView(
              children: [
                if (_orders.length > 0)
                  SizedBox(
                    height: 10,
                  ),
                if (_orders.length > 0)
                  for (var order in _orders) OrderCard(order: order, onAccept: onAccept),
              ],
            ),
          );
  }
}
