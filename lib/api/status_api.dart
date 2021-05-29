import 'package:driver/api/api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/helpers/location.dart';
import 'package:driver/models/Ram.dart';
import 'package:driver/models/User.dart';
import 'package:driver/values/Strings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class StatusApi {
  static online() async {
    Ram.onlineChoice = true;
    EasyLoading.show();
    var url = Strings.baseUrl + 'status/online';

    print('ONline Started');

    url += '?api_token=' + Auth.user().apiToken;

    var location = await Geo.location();

    var data = {'location': location.latitude.toString() + ',' + location.longitude.toString()};

    var response = await Api.execute(data: data, url: url);
    print('ONline Ended');

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
    Ram.onlineChoice = false;
    EasyLoading.show();
    print('Offline Started');

    var url = Strings.baseUrl + 'status/offline';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(data: data, url: url);

    print('Offline Ended');

    EasyLoading.dismiss();
    if (!response['error']) {
      Auth.login(User(response));
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static onlineInBackground() async {
    var url;
    if (Ram.onlineChoice)
      url = Strings.baseUrl + 'status/online';
    else
      url = Strings.baseUrl + 'status/offline';

    url += '?api_token=' + Auth.user().apiToken;

    var location = await Geo.location();

    var data = {'location': location.latitude.toString() + ',' + location.longitude.toString()};

    var response = await Api.execute(data: data, url: url);

    if (!response['error']) {
      Auth.login(User(response));
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
}
