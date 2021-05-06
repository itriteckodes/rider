import 'package:driver/api/api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/models/Wallet.dart';
import 'package:driver/values/Strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WalletApi {
  static get() async {
    EasyLoading.show();

    var url = Strings.baseUrl + 'account';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(data: data, url: url);

    EasyLoading.dismiss();

    if (!response['error']) {
      return Wallet(response);
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
}
