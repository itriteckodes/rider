import 'package:driver/api/api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/models/DepositMethod.dart';
import 'package:driver/models/DepositRequest.dart';
import 'package:driver/models/WithdrawRequest.dart';
import 'package:driver/values/Strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DepositApi {
  
  static request(methodId, amount, transactionId, description) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'deposit/request/create';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'deposit_method_id': methodId, 'amount': amount, 'TID': transactionId, 'descritpion': description};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      Fluttertoast.showToast(msg: 'Deposit request sent');
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
  
  static pending() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'deposit/request/pending';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      List requests = [];
      for (var depositRequest in response['requests']) {
        requests.add(DepositRequest(depositRequest));
      }
      return requests;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
  
  static history() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'deposit/request/history';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      List requests = [];
      for (var request in response['requests']) {
        requests.add(DepositRequest(request));
      }
      return requests;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static methods() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'deposit/methods';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      List methods = [];
      for (var method in response['methods']) {
        methods.add(DepositMethod(method));
      }
      return methods;
    } else {
      print(response['error_data']);
    }
  }
}
