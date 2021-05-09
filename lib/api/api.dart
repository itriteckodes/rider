import 'dart:convert';
import 'package:dio/dio.dart';
// import 'package:driver/helpers/url.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Api {

  static execute({url, data}) async {
    var result;
    Dio dio = new Dio();
    try {
      result = await dio.post(url, data: data);
      var response = jsonDecode(result.toString());
      // print('TRITECAPI Url : ' + url.toString());
      // print('TRITECAPI Data : ' + data.toString());
      // print('TRITECAPI TestUrl : ' + url+URL.toGetString(data));
      // print('TRITECAPI Result : ' + result.toString());
      return response;
    } on DioError catch (e) {
      EasyLoading.dismiss();
      print('URL : ' + url.toString());
      print('DATA : ' + data.toString());
      print('Error : ' + e.response.toString());
    }
  }

}
