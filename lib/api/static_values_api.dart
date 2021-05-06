import 'package:driver/api/api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/values/StaticValues.dart';
import 'package:driver/values/Strings.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StaticValuesApi {

  static fetch() async {
    var url = Strings.baseUrl + 'static/values';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    if (!response['error']) {
      StaticValues.gositBaseFare = response['gosit_base_fare'];
      StaticValues.gositPerKm = response['gosit_per_km'];
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
    }
  }
}
