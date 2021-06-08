import 'package:driver/models/Reply.dart';

class Ticket {
  var id, title, unRead, createdAt;
  List<Reply> replies = [];

  Ticket(ticket) {
    id = ticket['id'] ?? "";
    title = ticket['ticket'] ?? "";
    createdAt = ticket['created_at'] ?? "";
    unRead = ticket['unread_replies'] ?? "";

    for (var reply in ticket['replies']) {
      replies.add(Reply(reply));
    }
    
  }
}
