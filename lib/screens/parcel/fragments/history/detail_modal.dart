import 'package:driver/models/ParcelOrder.dart';
import 'package:driver/screens/parcel/fragments/history/button.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';


class DetailModal extends StatelessWidget {
  const DetailModal({
    Key key,
    @required this.order,
  }) : super(key: key);

  final ParcelOrder order;

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
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                order.address,
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
                    'Parcel : ',
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
                    'Status : ',
                    style: TextStyle(
                      color: Clr.green,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizer.fontSix(),
                    ),
                  ),
                  Text(
                    order.getStatus(),
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
                    'Earned : ',
                    style: TextStyle(
                      color: Clr.green,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizer.fontSix(),
                    ),
                  ),
                  Text(
                    'PKR '+order.fare.toString()+ '/-',
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
                    'Date : ',
                    style: TextStyle(
                      color: Clr.green,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizer.fontSix(),
                    ),
                  ),
                  Text(
                    order.createdAt,
                    style: TextStyle(
                      color: Clr.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizer.fontSeven(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(context, 'Close', Clr.red),
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
