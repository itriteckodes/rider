import 'package:driver/api/parcel_api.dart';
import 'package:driver/screens/parcel/fragments/running/map/map_screen.dart';
import 'package:driver/screens/parcel/fragments/running/order_card.dart';
import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

class RunningFragment extends StatefulWidget {
  RunningFragment({Key key}) : super(key: key);

  @override
  _RunningFragmentState createState() => _RunningFragmentState();
}

class _RunningFragmentState extends State<RunningFragment> {
  List _orders = [];

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  fetchOrders() async {
    var orders = await ParcelApi.runningOrders();
    setState(() {
      _orders = orders;
    });
  }

  onOrderClick(order) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen(order: order)));
    fetchOrders();
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
            for (var order in _orders) OrderCard(order: order, onOrderClick: onOrderClick),
        ],
      ),
    );
  }
}
