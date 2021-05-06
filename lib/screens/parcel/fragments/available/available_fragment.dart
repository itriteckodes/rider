import 'dart:convert';

import 'package:driver/api/parcel_api.dart';
import 'package:driver/models/ParcelOrder.dart';
import 'package:driver/screens/parcel/fragments/available/order_card.dart';
import 'package:driver/values/Clr.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class AvailableFragment extends StatefulWidget {
  AvailableFragment({Key key, @required this.switchFragment}) : super(key: key);

  final switchFragment;
  @override
  _AvailableFragmentState createState() => _AvailableFragmentState();
}

class _AvailableFragmentState extends State<AvailableFragment> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  List _orders = [];

  @override
  void initState() {
    super.initState();
    fetchOrders();
    startListener();
  }

  void onAccept() {
    setState(() {
      _orders = [];
    });
    // fetchOrders();
    widget.switchFragment(1);
  }

  void fetchOrders() async {
    var orders = await ParcelApi.availableOrders();
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

  void streamListener(message) {
    var response = jsonDecode(message["data"]["body"].toString());
    if (response["type"] == "newparcelorder") {
      addToOrders(ParcelOrder(response));
    } else if (response["type"] == "removeparcelorder") {
      removeFromOrders(ParcelOrder(response));
    }
  }

  void startListener() {
    _firebaseMessaging.configure(
      onMessage: (message) async {
        streamListener(message);
      },
      onLaunch: (message) async {
        streamListener(message);
      },
      onResume: (message) async {
        streamListener(message);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Clr.white),
      height: MediaQuery.of(context).size.height * 0.76,
      child: ListView(
        children: [
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
