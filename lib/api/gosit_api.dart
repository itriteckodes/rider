import 'package:driver/api/api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/models/GositOrder.dart';
import 'package:driver/models/User.dart';
import 'package:driver/values/Strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';

class GositApi {
  static runningOrders() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'gosit/order/running';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      List <GositOrder> orders = [];
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

    var response = await Api.execute(url: url, data: data);

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

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();
    

    if (!response['error']) {
      Fluttertoast.showToast(msg: 'Order started');
      Auth.login(User(response));
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static showOrder(LocationData location, GositOrder order) async {
    var url = Strings.baseUrl + 'gosit/order/show';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'gosit_id': order.id, 'destination_location': (location.latitude.toString() + ", " + location.longitude.toString())};

    var response = await Api.execute(url: url, data: data);

    if (!response['error']) {
      return GositOrder(response['order']);
    } else {
      return false;
    }
  }

  static finishOrder(LocationData location, GositOrder order) async {
    var url = Strings.baseUrl + 'gosit/order/finish';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'gosit_id': order.id, 'destination_location': (location.latitude.toString() + ", " + location.longitude.toString())};

    var response = await Api.execute(url: url, data: data);

    if (!response['error']) {
      Fluttertoast.showToast(msg: 'Order finished');
      Auth.login(User(response));
      return GositOrder(response['order']);
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
}
