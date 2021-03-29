import 'package:driver/models/Order.dart';
import 'package:driver/models/RouteInfo.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/RiderStatus.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

Widget bottomCard(context, buttonEnabled, RouteInfo route, Order order, pickOrder, deliverOrder) {
  return Positioned(
    bottom: 0,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(color: Clr.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 15, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  order.status == RiderStatus.accepted? order.hotel.name:order.name,
                  style: TextStyle(color: Clr.black, fontSize: Sizer.fontFour(), fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 15, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ETA : ' + route.etaString,
                  style: TextStyle(
                    color: Clr.green,
                    fontSize: Sizer.fontSix(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  route.distanceString,
                  style: TextStyle(
                    color: Clr.green,
                    fontSize: Sizer.fontSix(),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                if (buttonEnabled) {
                  if(order.status == RiderStatus.accepted)
                    pickOrder();
                  else
                    deliverOrder();
                }
              },
              style: ElevatedButton.styleFrom(
                primary: buttonEnabled ? Clr.green : Clr.grey,
                onPrimary: Clr.white,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15),
                ),
              ),
              child: Text(
                order.status == RiderStatus.accepted ? (buttonEnabled ? 'Pick Order' : 'Reach resutrant') : (buttonEnabled ? 'Deliver Order' : 'Reach customer'),
                style: TextStyle(color: Clr.white, fontSize: Sizer.fontFive()),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    ),
  );
}
