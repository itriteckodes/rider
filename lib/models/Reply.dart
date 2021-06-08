class Reply {
  var type, message, time;

  Reply(reply) {
    type = reply['type'] ?? "";
    message = reply['message'] ?? "";
    time = reply['time'] ?? "";
  }
}
