import 'dart:io';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class RingHelper {

  static longNotificaion() {
    FlutterRingtonePlayer.play(
      android: AndroidSounds.ringtone,
      ios: IosSounds.glass,
      volume: 10,
    );
    
    sleep(Duration(seconds: 3));
    FlutterRingtonePlayer.stop();
  }
}
