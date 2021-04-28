import 'package:driver/api/api.dart';
import 'package:driver/auth/auth.dart';
import 'package:driver/models/Account.dart';
import 'package:driver/models/Method.dart';
import 'package:driver/models/WithdrawRequest.dart';
import 'package:driver/values/Strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WithdrawApi {
  static accounts() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'withdraw/approved/accounts';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

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

  static addAccount(methodId, title, accountNo, description, image) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'withdraw/account/request';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'title': title, 'account_no': accountNo, 'descritpion': description, 'withdrawmethod_id': methodId, 'image': image};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      Fluttertoast.showToast(msg: 'Account request sent');
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
  
  static request(accountId, amount, description,) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'withdraw/request';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'withdrawaccount_id': accountId, 'amount': amount, 'descritpion': description};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      Fluttertoast.showToast(msg: 'Withdraw request sent');
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
  
  static history() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'withdraw/request/history';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      List requests = [];
      for (var request in response['requests']) {
        requests.add(WithdrawRequest(request));
      }
      return requests;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static methods() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'withdraw/method';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      List methods = [];
      for (var method in response['accounts']) {
        methods.add(Method(method));
      }
      return methods;
    } else {
      print(response['error_data']);
    }
  }
}
