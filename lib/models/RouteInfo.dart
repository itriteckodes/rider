class RouteInfo {
  var etaString, distanceString, eta, distance;

  RouteInfo(route) {
    if (route != null) {
      etaString = route['duration']['text'];
      distanceString = route['distance']['text'];
      eta = route['duration']['value'];
      distance = num.parse((route['distance']['value']/1000).toStringAsFixed(1));
 
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
