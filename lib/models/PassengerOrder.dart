import 'package:driver/models/Customer.dart';
import 'package:driver/models/Loc.dart';
import 'package:geolocator/geolocator.dart';

class PassengerOrder {
  var id, status, name, recepientName, address, size, originDistance, destinationDistance, fare, startedAt, createdAt, vehicleType, customer, grandTotal;
  var distance;
  Loc originLocation;
  Loc destinationLocation;
  Position originPosition;

  PassengerOrder(order) {
    distance = order["origin_distance"];
    id = order["id"] ?? "";
    status = order["status"] ?? "";
    name = order["name"] ?? "";
    recepientName = order["recepientName"] ?? "Recepient";
    address = order["address"] ?? "";
    size = order["parcel_size"] ?? "";
    originDistance = order["origin_distance"];
    destinationDistance = order["distance"];
    originLocation = order["origin_location"] != null ? Loc(order["origin_location"]) : "";
    destinationLocation = order["destination_location"] != null ? Loc(order["destination_location"]) : "";
    originPosition = Position(latitude: originLocation.lat,longitude: originLocation.long, heading: 0.0,speed: 0.0,altitude: 0.0,accuracy: 0.0,timestamp: DateTime.now(), speedAccuracy: 0.0);
    fare = order["rider_fare"] ?? "";
    grandTotal = order["fare"] ?? "";
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
        return 'Completed';
      case "4":
        return 'Canceled';
    }
    return 'Unknown status';
  }

  String getVehicleType() {
    switch (vehicleType) {
      case 1:
        return 'Luxury Car';
      case 2:
        return 'Ac Car';
      case 3:
        return 'Non Ac Car';
      case 4:
        return 'Bike';
      case 5:
        return 'Rikshaw';
    }
    return 'Undefined Vehicle';
  }
}
