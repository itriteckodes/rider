import 'package:geolocator/geolocator.dart';

class GositOrder {
  var id, name, status, originAddress, distance, fare, startedAt;
  Position originPosition;

  GositOrder(order) {
    var loc = order['origin_location'].split(',');

    id = order["id"] ?? "";
    status = order["status"] ?? "";
    name = order["name"] ?? "";
    distance = order["distance"] ?? 0;
    originAddress = order["origin_address"] ?? "";
    originPosition = Position(latitude: double.parse(loc[0]), longitude: double.parse(loc[1]));
    fare = order["fare"] ?? 0;
    startedAt = order["started_at"] ?? "12:45 PM";
  }

  @override
  String toString() {
    return 'name : ' + name + ' status:' + status;
  }
}
