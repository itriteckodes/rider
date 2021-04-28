import 'package:driver/models/Account.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({Key key, @required this.account, @required this.onTap}) : super(key: key);
  final Account account;
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
              onTap(account);
              // EasyLoading.show();
              // var _order = await GositApi.showOrder(await Geo.location(), order);
              // EasyLoading.dismiss();
              // var finished = await showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return ShowModal(
              //       order: _order,
              //     );
              //   },
              // );
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
                            child: FadeInImage(image: NetworkImage(account.image), placeholder: AssetImage('lib/assets/images/loader.png')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  account.title,
                                  style: TextStyle(
                                    color: Clr.black,
                                    fontSize: Sizer.fontFive(),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  account.number,
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
                                      account.getStatus(),
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
