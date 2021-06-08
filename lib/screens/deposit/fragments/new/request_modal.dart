import 'package:driver/api/deposit_api.dart';
import 'package:driver/helpers/validate.dart';
import 'package:driver/models/DepositMethod.dart';
import 'package:driver/screens/gosit/fragments/running/button.dart';
import 'package:driver/screens/withdraw/fragments/new/input.dart';
import 'package:driver/screens/withdraw/fragments/new/text_area.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

class RequestModal extends StatelessWidget {
  RequestModal({Key key, @required this.method}) : super(key: key);

  final DepositMethod method;
  final amountController = TextEditingController();
  final transactionIdController = TextEditingController();
  final descriptionController = TextEditingController();

  submit(context) async {
    if (Validate.depositRequest(amountController, transactionIdController)) {
      if (await DepositApi.request(method.id, amountController.text, transactionIdController.text, descriptionController.text)) {
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
    var mb = MediaQuery.of(context).size.height * 0.22;
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
      margin: EdgeInsets.only(top: mt, left: mx, right: mx, bottom: mb),
      decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Send Amount To ' + method.method + ' account',
            style: TextStyle(
              color: Clr.green,
              fontSize: Sizer.fontSeven(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'A/C Number : ' + method.number.toString(),
            style: TextStyle(
              color: Clr.green,
              fontWeight: FontWeight.bold,
              fontSize: Sizer.fontSix(),
            ),
          ),
          Text(
            'A/C Title : ' + method.title,
            style: TextStyle(
              color: Clr.green,
              fontWeight: FontWeight.bold,
              fontSize: Sizer.fontSix(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          input(context, amountController, 'Enter Amount'),
          SizedBox(
            height: 10,
          ), 
          input(context, transactionIdController, 'Transaction Id'),
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
              Button(context, submit, 'Deposit', Clr.green),
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
