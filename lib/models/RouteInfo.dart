class RouteInfo {
  var etaString, distanceString, eta, distance;

  RouteInfo(route) {
    if (route != null) {
      etaString = route['duration']['text'];
      distanceString = route['distance']['text'];
      eta = route['duration']['value'];
      distance = route['distance']['value'];
    } else {
      etaString = '... min';
      distanceString = '...km';
    }
  }

  @override
  String toString() {
    return 'eta : ' + etaString + ' distance:' + distanceString;
  }
}
