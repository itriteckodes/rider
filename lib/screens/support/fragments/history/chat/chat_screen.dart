import 'package:driver/api/support_api.dart';
import 'package:driver/models/Ticket.dart';
import 'package:driver/screens/static/baloon.dart';
import 'package:driver/screens/support/fragments/history/chat/input.dart';
import 'package:driver/screens/support/fragments/history/chat/message_buble.dart';
import 'package:driver/screens/support/fragments/history/chat/no_messages_framgent.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key, @required this.ticketId}) : super(key: key);

  final ticketId;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Ticket _ticket;
  bool firstCall = true;
  TextEditingController messageController = new TextEditingController();
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    fetchTicket();
  }

  void fetchTicket() async {
    var ticket = await SupportApi.ticket(widget.ticketId);
    setState(() {
      _ticket = ticket;
      firstCall = false;
    });
  }

  noMessagesAvailable() {
    if (_ticket.replies.length < 1 && !firstCall)
      return true;
    else
      return false;
  }

  sendMessage() async {
    FocusScope.of(context).unfocus();
    var msg = messageController.text;
    messageController.text = "";
    if (msg != "") {
      var ticket = await SupportApi.addReply(msg, _ticket);
      setState(() {
        _ticket = ticket;
      });
    }

    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  showChat() {
    if (_ticket != null)
      return noMessagesAvailable()
          ? noMessagesFragment(context)
          : Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), color: Clr.white),
              height: MediaQuery.of(context).size.height * 0.76,
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  if (_ticket.replies.length > 0)
                    for (var reply in _ticket.replies) MessageBubble(reply: reply),
                ],
              ),
            );
    else
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), color: Clr.white),
        height: MediaQuery.of(context).size.height * 0.76,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Clr.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Baloon(context),
              Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0, right: 10.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  FontAwesomeIcons.chevronCircleLeft,
                                  size: Sizer.fontThree(),
                                  color: Clr.white,
                                ),
                              ),
                            ),
                            Text(
                              'Support',
                              style: TextStyle(
                                color: Clr.white,
                                fontSize: Sizer.fontTwo(),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      showChat(),
                      input(context, "Type a reply", messageController, sendMessage)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
