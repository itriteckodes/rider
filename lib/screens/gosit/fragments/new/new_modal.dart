import 'package:driver/api/gosit_api.dart';
import 'package:driver/helpers/location.dart';
import 'package:driver/screens/gosit/fragments/new/button.dart';
import 'package:driver/screens/gosit/fragments/new/input.dart';
import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NewModal extends StatefulWidget {
  NewModal({Key key}) : super(key: key);

  @override
  _NewModalState createState() => _NewModalState();
}

class _NewModalState extends State<NewModal> {
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = 'Customer';
  }

  start(context) async {
    EasyLoading.show();
    await GositApi.startOrder(await Geo.location(), nameController.text);
    EasyLoading.dismiss();
    Navigator.of(context).pop();
  }

  cancel(context) async {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var px = MediaQuery.of(context).size.width * 0.05;
    var pt = MediaQuery.of(context).size.height * 0.25;
    var pb = MediaQuery.of(context).size.height * 0.50;
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      margin: EdgeInsets.only(top: pt, left: px, right: px, bottom: pb),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 10),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add new Go Sit now?',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
          ),
          Input(context, nameController, 'Enter customer name'),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(context, start, 'Start', Clr.green),
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
