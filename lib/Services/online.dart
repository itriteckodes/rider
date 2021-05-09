import 'dart:async';

import 'package:driver/api/status_api.dart';
import 'package:driver/models/Ram.dart';

class OnlineService {
  OnlineService(duration) {
    var timePeriod = Duration(milliseconds: duration);

    Ram.timer = new Timer.periodic(timePeriod, callback);
  }
  void callback(Timer timer) async {
    await StatusApi.onlineInBackground();
  }

  static cancel() {
    if (Ram.timer != null) Ram.timer.cancel();
  }
}
