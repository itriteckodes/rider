import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:driver/auth/auth.dart';
import 'package:driver/models/GositOrder.dart';
import 'package:driver/values/Strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:location/location.dart';

class GositApi {
  static runningOrders() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'gosit/order/running';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    EasyLoading.dismiss();

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

  static orderHistory() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'gosit/order/history';

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

  static startOrder(LocationData location, String name) async {
    var url = Strings.baseUrl + 'gosit/order/start';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'origin_location': (location.latitude.toString() + ", " + location.longitude.toString()), 'name': name};

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    EasyLoading.dismiss();

    if (!response['error']) {
      return true;
    } else {
      return false;
    }
  }

  static showOrder(LocationData location, GositOrder order) async {
    var url = Strings.baseUrl + 'gosit/order/show';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'gosit_id': order.id, 'destination_location': (location.latitude.toString() + ", " + location.longitude.toString())};

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    if (!response['error']) {
      return GositOrder(response['order']);
    } else {
      return false;
    }
  }

  static finishOrder(LocationData location, GositOrder order) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'gosit/order/finish';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'gosit_id': order.id, 'destination_location': (location.latitude.toString() + ", " + location.longitude.toString())};

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    EasyLoading.dismiss();

    if (!response['error']) {
      return GositOrder(response['order']);
    } else {
      return false;
    }
  }
}
