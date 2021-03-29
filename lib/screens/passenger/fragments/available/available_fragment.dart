import 'package:driver/screens/parcel/fragments/available/order_card.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AvailableFragment extends StatefulWidget {
  AvailableFragment({Key key}) : super(key: key);

  @override
  _AvailableFragmentState createState() => _AvailableFragmentState();
}

class _AvailableFragmentState extends State<AvailableFragment> {
  List _orders = [];

  @override
  void initState() {
    super.initState();
    EasyLoading.show();
  }

  void onAccept() {
    setState(() {
      _orders = [];
    });
  }

  @override
  void dispose() {
    EasyLoading.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Clr.white),
      height: MediaQuery.of(context).size.height * 0.76,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top : 50),
            child: Column(
              children: [
                Text(
                  'Wating for customers',
                  style: TextStyle(
                    color: Clr.green,
                    fontWeight: FontWeight.bold,
                    fontSize: Sizer.fontFour(),
                  ),
                ),
                Text(
                  "please don't close this screen",
                  style: TextStyle(
                    color: Clr.green,
                    fontWeight: FontWeight.bold,
                    fontSize: Sizer.fontSix(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
