import 'package:driver/api/gosit_api.dart';
import 'package:driver/screens/gosit/fragments/running/order_card.dart';
import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

class RunningFragment extends StatefulWidget {
  RunningFragment({Key key}) : super(key: key);

  @override
  RunningFragmentState createState() => RunningFragmentState();
}

class RunningFragmentState extends State<RunningFragment> {
  List _orders = [];

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void onFinish() {
    setState(() {
      _orders = [];
    });
    fetchOrders();
  }

  void fetchOrders() async {
    var orders = await GositApi.runningOrders();
    setState(() {
      _orders = orders;
    });
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
            for (var order in _orders) OrderCard(order: order, onFinish: onFinish),
        ],
      ),
    );
  }
}
