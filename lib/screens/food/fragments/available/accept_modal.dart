import 'package:driver/api/food_api.dart';
import 'package:driver/models/FoodOrder.dart';
import 'package:driver/screens/food/fragments/available/button.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AcceptModal extends StatelessWidget {
  const AcceptModal({Key key, @required this.order, @required this.onAccept}) : super(key: key);

  final FoodOrder order;
  final onAccept;

  acceptOrder(context) async {
    if (await FoodApi.acceptOrder(order))
      Fluttertoast.showToast(msg: "Order accepted");
    else
      Fluttertoast.showToast(msg: "Oops! Something went wrong");
    onAccept();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, top: 50, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 200, left: MediaQuery.of(context).size.width * 0.05),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
            BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
          ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                order.name,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                order.hotel.name,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Hotel Distance : ',
                    style: TextStyle(
                      color: Clr.green,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizer.fontSix(),
                    ),
                  ),
                  Text(
                    order.hotelDistance.toString() + ' km',
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
                    'Order Distance : ',
                    style: TextStyle(
                      color: Clr.green,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizer.fontSix(),
                    ),
                  ),
                  Text(
                    order.destinationDistance.toString() + ' km',
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
                    'Ready at : ',
                    style: TextStyle(
                      color: Clr.green,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizer.fontSix(),
                    ),
                  ),
                  Text(
                    order.readyAt,
                    style: TextStyle(
                      color: Clr.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizer.fontSeven(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(context, 'Accept', Clr.green, onTap: (context) {
                    acceptOrder(context);
                  }),
                  SizedBox(
                    width: 10,
                  ),
                  Button(context, 'Cancel', Clr.red, onTap: (context) {
                    Navigator.of(context).pop();
                  }),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 150,
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(45)), child: Image.asset("lib/assets/images/user.png")),
          ),
        ),
      ],
    );
  }
}
