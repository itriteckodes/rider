import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:driver/auth/auth.dart';
import 'package:driver/helpers/url.dart';
import 'package:driver/models/User.dart';
import 'package:driver/values/Strings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Api {

  static execute({url, data}) async {
    var result;
    Dio dio = new Dio();
    try {
      result = await dio.post(url, data: data);
      var response = jsonDecode(result.toString());
      print('TRITECAPI Url : ' + url.toString());
      print('TRITECAPI Data : ' + data.toString());
      print('TRITECAPI TestUrl : ' + url+URL.toGetString(data));
      print('TRITECAPI Result : ' + result.toString());
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      print('URL : ' + url.toString());
      print('DATA : ' + data.toString());
      print('Error : ' + e.response.toString());
    }
  }


  static login(email, password) async {
    EasyLoading.show();
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

    var token = await _firebaseMessaging.getToken();

    var url = Strings.baseUrl + 'login';

    var data = {'email': email, 'password': password, 'firebase_token': token};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();
    if (!response['error']) {
      var user = User(response);
      Auth.login(user);
      return true;
    } else {
      return false;
    }
  }
}
