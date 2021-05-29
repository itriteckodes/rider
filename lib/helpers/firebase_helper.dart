import 'package:driver/helpers/notification_helper.dart';
import 'package:driver/helpers/ring_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseHelper {
  static init() async {
    await Firebase.initializeApp();

    WidgetsFlutterBinding.ensureInitialized();

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(handleBackgroundNotification);

    FirebaseMessaging.onMessage.listen(handleForegroundNotification);

    FirebaseMessaging.onMessageOpenedApp.listen(handleAppOpened);
  }

  //Static Helper Methods
  static Future<void> handleBackgroundNotification(RemoteMessage message) async {
    RingHelper.longNotificaion();
  }

  static handleForegroundNotification(RemoteMessage message) {
    NotificationHelper.show(message);
  }

  static handleAppOpened(RemoteMessage message) {
    print('A new onMessageOpenedApp event was published!');
  }
}
