import 'package:driver/models/Hotel.dart';
import 'package:driver/models/Loc.dart';

class Order {
  var id, name, status, address, hotelDistance, destinationDistance, originAddress, distance, fare, readyAt, startedAt, hotel, createdAt;
  Loc hotelLocation;
  Loc customerLocation;

  Order(order) {
    id = order["id"] ?? "";
    status = order["rider_status"] ?? "";
    name = order["name"] ?? "";
    address = order["address"] ?? "";
    createdAt = order["created_at"] ?? "";
    hotelDistance = order["hotelDistance"] ?? 3;
    destinationDistance = order["hotelDistance"] ?? 7;
    distance = order["distance"] ?? 2;
    originAddress = order["origin_address"] ?? "";
    fare = order["fare"] ?? 0;
    readyAt = order["readyAt"] ?? "12:45 PM";
    startedAt = order["started_at"] ?? "12:45 PM";
    hotelLocation = order["hotel_location"] != null ? Loc(order["hotel_location"]) : "";
    customerLocation = order["customer_location"] != null ? Loc(order["customer_location"]) : "";
    hotel = order["hotel"] != null ? Hotel(order["hotel"]) : null;
  }

  @override
  String toString() {
    return 'name : ' + name + ' address:' + address;
  }

  String getStatus() {
    switch (status) {
      case "1":
        return 'Accepted';
      case "2":
        return 'Picked';
      case "3":
        return 'Delivered';
      case "4":
        return 'Canceled';
    }
    return 'Unknown status';
  }
}
