import 'package:driver/api/transaction_api.dart';
import 'package:driver/helpers/text_helper.dart';
import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

class HistoryFragment extends StatefulWidget {
  HistoryFragment({Key key}) : super(key: key);

  @override
  _HistoryFragmentState createState() => _HistoryFragmentState();
}

class _HistoryFragmentState extends State<HistoryFragment> {
  List _transactions = [];

  @override
  void initState() {
    super.initState();
    fetchRequests();
  }

  void fetchRequests() async {
    var transactions = await TransactionApi.history();
    setState(() {
      _transactions = transactions;
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 12.0,
              showBottomBorder: true,
              headingRowColor: MaterialStateColor.resolveWith((states) => Clr.lightGreen),
              headingTextStyle: TextStyle(color: Clr.white, fontWeight: FontWeight.bold),
              dataTextStyle: TextStyle(color: Clr.green, fontWeight: FontWeight.bold),
              columns: [  
                DataColumn(label: Text('TID')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Type')),
                DataColumn(label: Text('Description')),
                DataColumn(label: Text('Amount')),
                DataColumn(label: Text('Opening')),
                DataColumn(label: Text('Closing')),
              ],
              rows: [
                if (_transactions.length > 0)
                  for (var transaction in _transactions)
                    DataRow(cells: [
                      DataCell(Text(transaction.id.toString())),
                      DataCell(Text(transaction.date)),
                      DataCell(Text(transaction.type)),
                      DataCell(Text(TextHelper.smallSentence(transaction.description) )),
                      DataCell(Text(transaction.amount.toString())),
                      DataCell(Text(transaction.openingBalance.toString())),
                      DataCell(Text(transaction.closingBalance.toString())),
                    ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
