import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController _mapController;
  CameraPosition _initialCameraPosition;

  Position _currentPosition;

  Widget map = Container();

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) async {
      setState(() {
        _currentPosition = position;
        _initialCameraPosition = CameraPosition(
          target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
          zoom: 18.0,
        );
      });
    });
  }

  _createMap() async {
    await _getCurrentLocation();
    map = GoogleMap(
      initialCameraPosition: _initialCameraPosition,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      mapType: MapType.normal,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _mapController = controller;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _createMap();
    // _getCurrentLocation();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: height,
        width: width,
        child: Scaffold(
          body: Stack(
            children: [
              map,
              // zoomButtons(_mapController),
              // currentLocationButton(_mapController, _currentPosition),
            ],
          ),
        ),
      ),
    );
  }
}
