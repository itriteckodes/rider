import 'package:driver/models/Reply.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key key, @required this.reply}) : super(key: key);
  final Reply reply;

  @override
  Widget build(BuildContext context) {
    return reply.type == 'admin'? adminMessage():riderMessage();
  }

  adminMessage() {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Clr.lightGreen.withOpacity(0.75)
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              reply.message,
              style: TextStyle(
                color: Clr.black,
                fontSize: Sizer.fontSix(),
              ),
            ),
            Text(
              reply.time,
              style: TextStyle(
                color: Clr.white,
                fontSize: Sizer.fontSeven(),
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    ),
  );
  }
  
  riderMessage() {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Clr.lightGreen.withOpacity(0.25)
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              reply.message,
              style: TextStyle(
                color: Clr.black,
                fontSize: Sizer.fontSix(),
              ),
            ),
            Text(
              reply.time,
              style: TextStyle(
                color: Clr.white,
                fontSize: Sizer.fontSeven(),
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    ),
  );
  }
}
