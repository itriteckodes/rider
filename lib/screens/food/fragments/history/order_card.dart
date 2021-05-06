import 'package:driver/models/FoodOrder.dart';
import 'package:driver/screens/food/fragments/history/detail_modal.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key key, @required this.order}) : super(key: key);
  final FoodOrder order;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 90,
          decoration: BoxDecoration(color: Clr.white),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DetailModal(order: order);
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Clr.grey),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0, left: 8.0, right: 8.0, bottom: 8.0),
                            child: Image(
                              image: AssetImage('lib/assets/images/user.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0,bottom: 8,left: 4,right: 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.createdAt,
                                  style: TextStyle(
                                    color: Clr.black,
                                    fontSize: Sizer.fontSix(),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  order.getStatus(),
                                  style: TextStyle(
                                    color: Clr.green,
                                    fontSize: Sizer.fontSeven(),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'PKR '+ order.fare.toString() + '/-',
                                      style: TextStyle(
                                        color: Clr.silver,
                                        fontSize: Sizer.fontSix(),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
