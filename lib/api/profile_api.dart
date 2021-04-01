import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:driver/auth/auth.dart';
import 'package:driver/models/User.dart';
import 'package:driver/values/Strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileApi {
  static update(name, email, phone, address, password) async {
    EasyLoading.show();

   var url = Strings.baseUrl + 'profile/update';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {
      'name' : name,
      'email' : email,
      'phone' : phone,
      'address' : address,
      'password' : password,
      };

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    EasyLoading.dismiss();
    if (!response['error']) {
      var user = User(response['rider']);
      Auth.login(user);
      Fluttertoast.showToast(msg: 'profile updated');
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
}
