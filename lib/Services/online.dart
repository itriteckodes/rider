import 'dart:async';

import 'package:driver/api/status_api.dart';

class OnlineService {
  static var timer;

  OnlineService(duration) {
    var timePeriod = Duration(milliseconds: duration);

    timer = new Timer.periodic(timePeriod, callback);
  }
  void callback(Timer timer) async {
    await StatusApi.online();
  }
}
