import 'package:driver/models/Account.dart';
import 'package:driver/models/DepositMethod.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

class MethodCard extends StatelessWidget {
  const MethodCard({Key key, @required this.method, @required this.onTap}) : super(key: key);
  final DepositMethod method;
  final onTap;

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
              onTap(method);
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
                            child: FadeInImage(image: NetworkImage(method.image), placeholder: AssetImage('lib/assets/images/loader.png')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  method.title,
                                  style: TextStyle(
                                    color: Clr.black,
                                    fontSize: Sizer.fontFive(),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  method.number,
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
                                      method.method,
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
