import 'package:driver/api/api.dart';
import 'package:driver/auth/auth.dart';
import 'package:driver/models/User.dart';
import 'package:driver/values/Strings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class StatusApi {
  static online() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'status/online';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(data: data, url: url);

    EasyLoading.dismiss();
    if (!response['error']) {
      Auth.login(User(response));
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static offline() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'status/offline';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(data: data, url: url);
    
    EasyLoading.dismiss();
    if (!response['error']) {
      Auth.login(User(response));
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
}
