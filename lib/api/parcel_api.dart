import 'package:driver/api/api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/models/ParcelOrder.dart';
import 'package:driver/models/User.dart';
import 'package:driver/values/Strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ParcelApi {
  static availableOrders() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'parcel/order/available';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      List orders = [];
      for (var order in response['orders']) {
        orders.add(ParcelOrder(order));
      }
      return orders;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
    }
  }

  static runningOrders() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'parcel/order/running';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      List orders = [];
      for (var order in response['orders']) {
        orders.add(ParcelOrder(order));
      }
      return orders;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
    }
  }

  static orderHistory() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'parcel/order/history';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      List orders = [];
      for (var order in response['orders']) {
        orders.add(ParcelOrder(order));
      }
      return orders;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
    }
  }

  static acceptOrder(order) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'parcel/order/accept';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'order_id': order.id};

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

  static pickOrder(order) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'parcel/order/pick';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'order_id': order.id};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      return ParcelOrder(response['order']);
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static deliverOrder(order) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'parcel/order/deliver';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'order_id': order.id};

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

  static receiveCash(order, receivedCash) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'parcel/order/recieve/cash';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'order_id': order.id, 'recieved_cash' : receivedCash};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
}
