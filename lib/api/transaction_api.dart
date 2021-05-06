import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/models/Transaction.dart';
import 'package:driver/values/Strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TransactionApi {

  static history() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'transactions';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var result = await Dio().post(url, data: data);

    var response = jsonDecode(result.toString());

    EasyLoading.dismiss();

    if (!response['error']) {
      List transactions = [];
      for (var transaction in response['transactions']) {
        transactions.add(Transacation(transaction));
      }
      return transactions;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

}
