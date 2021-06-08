import 'package:driver/api/deposit_api.dart';
import 'package:driver/screens/deposit/fragments/history/request_card.dart';
import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

class PendingFragment extends StatefulWidget {
  PendingFragment({Key key}) : super(key: key);

  @override
  _PendingFragmentState createState() => _PendingFragmentState();
}

class _PendingFragmentState extends State<PendingFragment> {
  List _requests = [];

  @override
  void initState() {
    super.initState();
    fetchRequests();
  }

  void fetchRequests() async {
    var requests = await DepositApi.pending();
    setState(() {
      _requests = requests;
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
          if (_requests.length > 0)
            for (var request in _requests) RequestCard(request: request),
        ],
      ),
    );
  }
}
