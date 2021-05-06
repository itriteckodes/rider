import 'package:driver/models/Loc.dart';

class ParcelOrder {
  var id, status, name, recepientName, address, size, originDistance, destinationDistance, fare, startedAt, createdAt, grandTotal;
  Loc originLocation;
  Loc destinationLocation;

  ParcelOrder(order) {
    id = order["id"] ?? "";
    status = order["status"] ?? "";
    name = order["name"] ?? "";
    recepientName = order["name"];
    address = order["address"] ?? "";
    size = order["parcel_size"] ?? "";
    originDistance = order["origin_distance"];
    destinationDistance = order["distance"];
    originLocation = order["origin_location"] != null ? Loc(order["origin_location"]) : "";
    destinationLocation = order["destination_location"] != null ? Loc(order["destination_location"]) : "";
    fare = order["rider_fare"] ?? "";
    startedAt = order["started_at"] ?? "";
    createdAt = order["created_at"] ?? "";
    grandTotal = order["fare"];

    // createdAt = order["created_at"] ?? "";
    // distance = order["distance"] ?? 2;
    // originAddress = order["origin_address"] ?? "";
    // fare = order["fare"] ?? 0;
    // startedAt = order["started_at"] ?? "12:45 PM";
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
