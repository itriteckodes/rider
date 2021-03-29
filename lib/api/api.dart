import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:driver/auth/auth.dart';
import 'package:driver/models/User.dart';
import 'package:driver/values/Strings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Api {
  static login(email, password) async {
    EasyLoading.show();
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

    var token = await _firebaseMessaging.getToken();

    var url = Strings.baseUrl + 'login';

    var data = {'email': email, 'password': password, 'firebase_token': token};

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    EasyLoading.dismiss();
    if (!response['error']) {
      var user = User(response['rider']);
      Auth.login(user);
      return true;
    } else {
      return false;
    }
  }
}
