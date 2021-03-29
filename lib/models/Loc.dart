
class Loc {
  var lat, long;

  Loc(order) {
    lat = order["lat"] != null?double.parse(order["lat"]) : 0.0;
    long = order["long"] != null?double.parse(order["long"]) : 0.0;
  }

  @override
  String toString() {
    return 'lat : ' + lat + ' long:' + long;
  }
}
