import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:driver/auth/auth.dart';
import 'package:driver/models/Account.dart';
import 'package:driver/models/GositOrder.dart';
import 'package:driver/values/Strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class WithdrawApi {
  static accounts() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'withdraw/approved/accounts';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    EasyLoading.dismiss();

    if (!response['error']) {
      List orders = [];
      for (var account in response['accounts']) {
        orders.add(Account(account));
      }
      return orders;
    } else {
      print(response['error_data']);
    }
  }

  static methods() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'withde0';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    EasyLoading.dismiss();

    print(url);

    if (!response['error']) {
      List orders = [];
      for (var order in response['orders']) {
        orders.add(GositOrder(order));
      }
      return orders;
    } else {
      print(response['error_data']);
    }
  }
}
