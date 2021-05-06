import 'package:driver/api/parcel_api.dart';
import 'package:driver/models/ParcelOrder.dart';
import 'package:driver/screens/food/fragments/running/map/button.dart';
import 'package:driver/screens/food/fragments/running/map/input.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PickModal extends StatelessWidget {
  PickModal({Key key, @required this.order, @required this.onAccept}) : super(key: key);

  final ParcelOrder order;
  final onAccept;

  final amountController = TextEditingController();

  receiveAmount(context) async {
    if (! await ParcelApi.receiveCash(order, amountController.text))
      Fluttertoast.showToast(msg: "Oops! Something went wrong");

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    amountController.text = order.grandTotal.toString();
    return Container(
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 200, left: MediaQuery.of(context).size.width * 0.05),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
            BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
          ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Order Picked !',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Size : ',
                    style: TextStyle(
                      color: Clr.green,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizer.fontSix(),
                    ),
                  ),
                  Text(
                    order.size,
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
                    'Distance : ',
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
                    'Amount : ',
                    style: TextStyle(
                      color: Clr.green,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizer.fontSix(),
                    ),
                  ),
                  Text(
                    'pkr ' + order.grandTotal.toString() + ' /-',
                    style: TextStyle(
                      color: Clr.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizer.fontSeven(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  input(context, amountController, 'Enter Amount Received'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(context, 'Receive', Clr.green, onTap: (context) {
                    receiveAmount(context);
                  }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
