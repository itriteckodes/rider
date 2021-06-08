import 'package:driver/api/support_api.dart';
import 'package:driver/screens/support/fragments/new/button.dart';
import 'package:driver/screens/support/fragments/new/text_area.dart';
import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';

class NewFragment extends StatefulWidget {
  NewFragment({Key key}) : super(key: key);

  @override
  NewFragmentState createState() => NewFragmentState();
}

class NewFragmentState extends State<NewFragment> {
  var ticketController = new TextEditingController();

  onSubmit() async {
    FocusScope.of(context).unfocus();
    if (await SupportApi.addTicket(ticketController.text)) {
      ticketController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Clr.white),
      height: MediaQuery.of(context).size.height * 0.76,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(height: 10),
          textArea(context, ticketController, "Enter Message here"),
          SizedBox(height: 10),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(context, onSubmit, "Create Ticket", Clr.green),
              ],
            ),
          )
        ],
      ),
    );
  }
}
