import 'package:driver/models/GositOrder.dart';
import 'package:driver/screens/gosit/fragments/running/show_modal.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key key, @required this.order, @required this.onFinish}) : super(key: key);
  final GositOrder order;
  final onFinish;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 100,
          decoration: BoxDecoration(color: Clr.white),
          child: InkWell(
            onTap: () async {
              var finished = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ShowModal(
                    order: order,
                  );
                },
              );
              if (finished) onFinish();
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
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.name,
                                  style: TextStyle(
                                    color: Clr.black,
                                    fontSize: Sizer.fontFive(),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'PKR ' + order.fare.toString() + '/- (' + order.distance.toString() + ' km)',
                                  style: TextStyle(
                                    color: Clr.black,
                                    fontSize: Sizer.fontSeven(),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Since ',
                                      style: TextStyle(
                                        color: Clr.silver,
                                        fontSize: Sizer.fontSix(),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Text(
                                      order.startedAt,
                                      style: TextStyle(
                                        color: Clr.green,
                                        fontSize: Sizer.fontSeven(),
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
