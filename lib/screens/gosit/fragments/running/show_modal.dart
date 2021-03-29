import 'package:driver/api/gosit_api.dart';
import 'package:driver/helpers/location.dart';
import 'package:driver/models/GositOrder.dart';
import 'package:driver/screens/gosit/fragments/running/button.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

class ShowModal extends StatelessWidget {
  const ShowModal({Key key, @required this.order}) : super(key: key);

  final GositOrder  order;


  finish(context) async {
    await GositApi.finishOrder(await Geo.location(), order);
    Navigator.of(context).pop(true);
  }

  cancel(context) {
    Navigator.of(context).pop(false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: contentBox(context),
    );
  }

  contentBox(context) {
    var px = MediaQuery.of(context).size.width * 0.05;
    var pt = MediaQuery.of(context).size.height * 0.25;
    var pb = MediaQuery.of(context).size.height * 0.47;
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 15, left: 20, right: 20),
      margin: EdgeInsets.only(top: pt, left: px, right: px, bottom: pb),
      decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
      ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Started at : ',
                style: TextStyle(
                  color: Clr.green,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizer.fontSix(),
                ),
              ),
              Text(
                order.startedAt,
                style: TextStyle(
                  color: Clr.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizer.fontSeven(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Distance  : ',
                style: TextStyle(
                  color: Clr.green,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizer.fontSix(),
                ),
              ),
              Text(
                order.distance.toString() + ' km',
                style: TextStyle(
                  color: Clr.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizer.fontSeven(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Total Fare: ',
                style: TextStyle(
                  color: Clr.green,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizer.fontSix(),
                ),
              ),
              Text(
                order.fare.toString() + ' rupees',
                style: TextStyle(
                  color: Clr.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizer.fontSeven(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(context, finish, 'Finish', Clr.green),
              SizedBox(
                width: 10,
              ),
              Button(context, cancel, 'Cancel', Clr.red),
            ],
          ),
        ],
      ),
    );
  }
}
