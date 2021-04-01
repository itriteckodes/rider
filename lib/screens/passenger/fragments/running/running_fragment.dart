import 'package:driver/api/passenger_api.dart';
import 'package:driver/models/Order.dart';
import 'package:driver/models/PassengerOrder.dart';
import 'package:driver/screens/parcel/fragments/running/map/map_screen.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

class RunningFragment extends StatefulWidget {
  RunningFragment({Key key, @required this.switchFragment}) : super(key: key);

  final switchFragment;
  @override
  _RunningFragmentState createState() => _RunningFragmentState();
}

class _RunningFragmentState extends State<RunningFragment> {
  PassengerOrder _order;

  @override
  void initState() {
    super.initState();
    fetchOrder();
  }

  fetchOrder() async {
    var order = await PassengerApi.runningOrder();
    setState(() {
      _order = order;
    });
  }

  onOrderClick(order) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen(order: order)));
    fetchOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Clr.white),
      height: MediaQuery.of(context).size.height * 0.76,
      child: _order != null?ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Text('you have running order')
        ],
      ): Column(
        children: [
          Text(
            'No Running Order',
            style: TextStyle(
              color: Clr.green,
              fontWeight: FontWeight.bold,
              fontSize: Sizer.fontFour(),
            ),
          ),
          InkWell(
            onTap: () {
              widget.switchFragment(0);
            },
            child: Text(
              "click here to look for customers",
              style: TextStyle(
                color: Clr.green,
                fontWeight: FontWeight.bold,
                fontSize: Sizer.fontSix(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
