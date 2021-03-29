

class GositOrder {
  var id, name,status, originAddress, distance, fare, startedAt;

  GositOrder(order) {
    id = order["id"] ?? "";
    status = order["status"] ?? "";
    name = order["name"] ?? "";
    distance = order["distance"] ?? 2;
    originAddress = order["origin_address"] ?? "";
    fare = order["fare"] ?? 2;
    startedAt = order["started_at"] ?? "12:45 PM";
  }

  @override
  String toString() {
    return 'name : ' + name + ' status:' + status;
  }
}
