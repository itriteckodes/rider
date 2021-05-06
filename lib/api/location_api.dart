import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:driver/models/RouteInfo.dart';
import 'package:driver/values/secrets.dart';
import 'package:geolocator/geolocator.dart';

class LocationApi {
  static String baseUrl = 'https://maps.googleapis.com/maps/api/distancematrix/json?';

  static getRouteInfo(Position originPosition, Position destinationPosition) async {
    var url = baseUrl;

    var data = 'units=metric' +
        '&origins=' +
        originPosition.latitude.toString() +
        ',' +
        originPosition.longitude.toString() +
        '&destinations=' +
        destinationPosition.latitude.toString() +
        ',' +
        destinationPosition.longitude.toString() +
        '&key=' +
        Secrets.API_KEY;

    // print('TRITECAPI TestUrl : ' + url + data);
    
    var result = await Dio().get(url + data);

    var response = jsonDecode(result.toString());

    return RouteInfo(response['rows'][0]['elements'][0]);
  }
}
