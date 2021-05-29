import 'package:driver/Services/online.dart';
import 'package:driver/api/api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/models/Ram.dart';
import 'package:driver/models/User.dart';
import 'package:driver/values/Constants.dart';
import 'package:driver/values/Strings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthApi {
  static login(email, password) async {
    EasyLoading.show();
    
    var token = await FirebaseMessaging.instance.getToken();

    var url = Strings.baseUrl + 'login';

    var data = {'email': email, 'password': password, 'firebase_token': token};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      Auth.login(User(response));
      Ram.onlineChoice = Auth.user().online;
      // OnlineService(Constants.onlineDuration);
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static secretLogin(email, password) async {
    var token = await FirebaseMessaging.instance.getToken();

    var url = Strings.baseUrl + 'login';

    var data = {'email': email, 'password': password, 'firebase_token': token};

    var response = await Api.execute(url: url, data: data);

    if (!response['error']) {
      Auth.login(User(response));
      Ram.onlineChoice = Auth.user().online;
      OnlineService(Constants.onlineDuration);
      return true;
    } else {
      return false;
    }
  }

  static register(name, cnic, phone, email, password, confirmPassword) async {
    EasyLoading.show();
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    var token = await _firebaseMessaging.getToken();

    var url = Strings.baseUrl + 'register';

    var data = {'name': name, 'id_card_no': cnic, 'phone': phone, 'email': email, 'password': password, 'confirm_password': confirmPassword, 'firebase_token': token};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      Auth.login(User(response));
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
}
