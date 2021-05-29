import 'package:driver/api/parcel_api.dart';
import 'package:driver/screens/parcel/fragments/history/no_order_framgent.dart';
import 'package:driver/screens/parcel/fragments/history/order_card.dart';
import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

class HistoryFragment extends StatefulWidget {
  HistoryFragment({Key key}) : super(key: key);

  @override
  _HistoryFragmentState createState() => _HistoryFragmentState();
}

class _HistoryFragmentState extends State<HistoryFragment> {
  List _orders = [];
  bool firstCall = true;

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    var orders = await ParcelApi.orderHistory();
    setState(() {
      _orders = orders;
      firstCall = false;
    });
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
            for (var order in _orders) OrderCard(order: order),
        ],
      ),
    );
  }
}
