import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:driver/auth/auth.dart';
import 'package:driver/models/Order.dart';
import 'package:driver/values/Strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FoodApi {
  static availableOrders() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'food/order/available';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    EasyLoading.dismiss();

    if (!response['error']) {
      List orders = [];
      for (var order in response['orders']) {
        orders.add(Order(order));
      }
      return orders;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
    }
  }

  static runningOrders() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'food/order/running';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    EasyLoading.dismiss();

    if (!response['error']) {
      List orders = [];
      for (var order in response['orders']) {
        orders.add(Order(order));
      }
      return orders;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
    }
  }

  static orderHistory() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'food/order/history';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    EasyLoading.dismiss();

    if (!response['error']) {
      List orders = [];
      for (var order in response['orders']) {
        orders.add(Order(order));
      }
      return orders;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
    }
  }

  static acceptOrder(order) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'food/order/accept';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'order_id': order.id};

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    EasyLoading.dismiss();

    if (!response['error']) {
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static pickOrder(order) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'food/order/pick';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'order_id': order.id};

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    EasyLoading.dismiss();

    if (!response['error']) {
      return Order(response['order']);
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static deliverOrder(order) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'food/order/deliver';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'order_id': order.id};

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    EasyLoading.dismiss();

    if (!response['error']) {
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
}
