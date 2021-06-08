import 'package:driver/helpers/text_helper.dart';
import 'package:driver/models/Ticket.dart';
import 'package:driver/screens/support/fragments/history/chat/chat_screen.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({Key key, @required this.ticket}) : super(key: key);
  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 90,
          decoration: BoxDecoration(color: Clr.white),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(ticketId: ticket.id)));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Clr.grey),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0, left: 8.0, right: 8.0, bottom: 8.0),
                            child: Image(
                              image: AssetImage('lib/assets/images/user.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ticket.createdAt,
                                  style: TextStyle(
                                    color: Clr.black,
                                    fontSize: Sizer.fontSix(),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  TextHelper.limited(ticket.title, 22),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: TextStyle(
                                    color: Clr.silver,
                                    fontSize: Sizer.fontSeven(),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Unread: ',
                                      style: TextStyle(color: Clr.green, fontSize: Sizer.fontSix(), fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      ticket.unRead.toString(),
                                      style: TextStyle(
                                        color: Clr.black,
                                        fontSize: Sizer.fontSeven(),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
