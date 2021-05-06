import 'package:driver/models/Hotel.dart';
import 'package:driver/models/Loc.dart';

class FoodOrder {
  var id, name, status, address, hotelDistance, destinationDistance, originAddress, distance, fare, readyAt, startedAt, hotel, createdAt, grandTotal,customerDistance;
  Loc hotelLocation;
  Loc customerLocation;

  FoodOrder(order) {
    id = order["id"];
    status = order["rider_status"];
    name = order["name"];
    address = order["address"];
    createdAt = order["created_at"];
    hotelDistance = order["hotel_distance"];
    destinationDistance = order["customer_distance"];
    distance = order["distance"] ?? 2;
    originAddress = order["origin_address"] ?? "";
    fare = order["fare"] ?? 0;
    readyAt = order["dispatch_time"] ?? "12:45 PM";
    startedAt = order["started_at"] ?? "12:45 PM";
    hotelLocation = order["hotel_location"] != null ? Loc(order["hotel_location"]) : "";
    customerLocation = order["customer_location"] != null ? Loc(order["customer_location"]) : "";
    hotel = order["hotel"] != null ? Hotel(order["hotel"]) : null;
    grandTotal = order["grand_total"];
    customerDistance = order["customer_distance"];
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
