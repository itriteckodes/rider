import 'package:driver/api/deposit_api.dart';
import 'package:driver/screens/deposit/fragments/new/method_card.dart';
import 'package:driver/screens/deposit/fragments/new/request_modal.dart';
import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

class NewFragment extends StatefulWidget {
  NewFragment({Key key}) : super(key: key);

  @override
  NewFragmentState createState() => NewFragmentState();
}

class NewFragmentState extends State<NewFragment> {
  List _methods = [];

  @override
  void initState() {
    super.initState();
    fetchAccounts();
  }

  void fetchAccounts() async {
    var methods = await DepositApi.methods();
    setState(() {
      _methods = methods;
    });
  }

  onTapCard(method) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RequestModal(method: method);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Clr.white),
      height: MediaQuery.of(context).size.height * 0.76,
      child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          if (_methods.length > 0)
            for (var method in _methods) MethodCard(method: method, onTap: onTapCard,),
        ],
      ),
    );
  }
}
