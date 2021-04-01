import 'package:driver/models/Customer.dart';
import 'package:driver/models/Loc.dart';

class PassengerOrder {
  var id, status, name, recepientName, address, size, originDistance, destinationDistance, fare, startedAt, createdAt, vehicleType, customer;
  Loc originLocation;
  Loc destinationLocation;

  PassengerOrder(order) {
    id = order["id"] ?? "";
    status = order["status"] ?? "";
    name = order["name"] ?? "";
    recepientName = order["recepientName"] ?? "Recepient";
    address = order["address"] ?? "";
    size = order["parcel_size"] ?? "";
    originDistance = order["originDistance"] ?? "7";
    destinationDistance = order["destinationDistance"] ?? "7";
    originLocation = order["origin_location"] != null ? Loc(order["origin_location"]) : "";
    destinationLocation = order["destination_location"] != null ? Loc(order["destination_location"]) : "";
    fare = order["fare"] ?? "";
    startedAt = order["started_at"] ?? "";
    createdAt = order["created_at"] ?? "";
    vehicleType = order["vehicle_type"] ?? "";
    customer = Customer(order['customer']);

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

  String getVehicleType() {
    switch (vehicleType) {
      case 1:
        return 'Bike';
      case 2:
        return 'Rikshaw';
      case 3:
        return 'Car';
    }
    return 'Unknown Vehicle';
  }
}
