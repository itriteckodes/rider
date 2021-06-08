import 'package:driver/api/support_api.dart';
import 'package:driver/screens/support/fragments/history/no_ticket_framgent.dart';
import 'package:driver/screens/support/fragments/history/ticket_card.dart';
import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

class HistoryFragment extends StatefulWidget {
  HistoryFragment({Key key}) : super(key: key);

  @override
  _HistoryFragmentState createState() => _HistoryFragmentState();
}

class _HistoryFragmentState extends State<HistoryFragment> {
  List _tickets = [];
    bool firstCall = true;

  @override
  void initState() {
    super.initState();
    fetchTickets();
  }

  void onAccept() {
    setState(() {
      _tickets = [];
    });
    fetchTickets();
  }

  void fetchTickets() async {
    var tickets = await SupportApi.tickets();
    setState(() {
      _tickets = tickets;
      firstCall = false;
    });
  }

  noTicketsAvailable() {
    if (_tickets.length < 1 && !firstCall)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return noTicketsAvailable()
        ? noOrderFragment(context)
        : Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Clr.white),
            height: MediaQuery.of(context).size.height * 0.76,
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                if (_tickets.length > 0)
                  for (var ticket in _tickets) TicketCard(ticket: ticket),
              ],
            ),
          );
  }
}
