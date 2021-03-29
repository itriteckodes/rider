import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class Geo {
  static location() async {
    Location location = new Location();
    await Permission.location.request();
    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        Fluttertoast.showToast(msg: "Location service disabled");
      }
    }

    LocationData _locationData = await location.getLocation();
    return _locationData;
  }
}