import 'package:driver/api/withdraw_api.dart';
import 'package:driver/helpers/validate.dart';
import 'package:driver/models/Account.dart';
import 'package:driver/screens/gosit/fragments/running/button.dart';
import 'package:driver/screens/withdraw/fragments/new/input.dart';
import 'package:driver/screens/withdraw/fragments/new/text_area.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

class RequestModal extends StatelessWidget {
  RequestModal({Key key, @required this.account}) : super(key: key);

  final Account account;
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  submit(context) async {
    if (Validate.withdrawRequest(amountController.text)) {
      if (await WithdrawApi.request(account.id, amountController.text, descriptionController.text)) {
        Navigator.of(context).pop(true);
      }
    }
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
    var mx = MediaQuery.of(context).size.width * 0.05;
    var mt = MediaQuery.of(context).size.height * 0.25;
    var mb = MediaQuery.of(context).size.height * 0.35;
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
      margin: EdgeInsets.only(top: mt, left: mx, right: mx, bottom: mb),
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
                'To : ',
                style: TextStyle(
                  color: Clr.green,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizer.fontSix(),
                ),
              ),
              Text(
                account.number,
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
          input(context, amountController, 'Enter Amount'),
          SizedBox(
            height: 10,
          ),
          textArea(context, descriptionController, 'Description optional'),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(context, submit, 'Withdraw', Clr.green),
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
