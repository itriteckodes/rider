import 'package:driver/api/api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/models/Method.dart';
import 'package:driver/models/Video.dart';
import 'package:driver/values/Strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class WatchListApi {

  static videos() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'watch/list';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      List videos = [];
      for (var video in response['watch_list']) {
        videos.add(Video(video));
      }
      return videos;
    } else {
      print(response['error_data']);
    }
  }
}
