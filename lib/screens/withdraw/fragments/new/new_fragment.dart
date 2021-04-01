import 'package:driver/api/withdraw_api.dart';
import 'package:driver/screens/withdraw/fragments/new/account_card.dart';
import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

class NewFragment extends StatefulWidget {
  NewFragment({Key key}) : super(key: key);

  @override
  NewFragmentState createState() => NewFragmentState();
}

class NewFragmentState extends State<NewFragment> {
   List _accounts = [];

  @override
  void initState() {
    super.initState();
    fetchAccounts();
  }

  void fetchAccounts() async {
    var accounts = await WithdrawApi.accounts();
    setState(() {
      _accounts = accounts;
    });
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
          if (_accounts.length > 0)
            for (var account in _accounts) AccountCard(account: account),
        ],
      ),
    );
  }
}
