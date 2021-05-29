import 'package:driver/api/api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/models/User.dart';
import 'package:driver/values/Strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomeApi {
  static login() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'home';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      Auth.login(User(response));
    } else {}
  }
}
