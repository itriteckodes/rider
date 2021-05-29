import 'package:driver/api/food_api.dart';
import 'package:driver/api/location_api.dart';
import 'package:driver/models/FoodOrder.dart';
import 'package:driver/models/RouteInfo.dart';
import 'package:driver/screens/food/fragments/running/map/bottom_card.dart';
import 'package:driver/screens/food/fragments/running/map/deliver_modal.dart';
import 'package:driver/screens/food/fragments/running/map/location_button.dart';
import 'package:driver/screens/food/fragments/running/map/zoom_buttons.dart';
import 'package:driver/values/Constants.dart';
import 'package:driver/values/RiderStatus.dart';
import 'package:driver/values/secrets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart' as Loc;

class MapScreen extends StatefulWidget {
  MapScreen({Key key, @required this.order}) : super(key: key);

  final FoodOrder order;
  @override
  _MapScreenState createState() => _MapScreenState(order);
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController _mapController;
  CameraPosition _initialCameraPosition = CameraPosition(target: LatLng(0.0, 0.0));
  Loc.Location location = Loc.Location();
  var locationSubscription;

  Position _currentPosition;
  Position _destinationPosition;

  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  Set<Marker> markers = {};

  PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  FoodOrder _order;
  RouteInfo _route;

  bool buttonEnabled = false;

  void pickOrder() async {
    await FoodApi.pickOrder(_order);
    Fluttertoast.showToast(msg: "Food Order picked successfuly");
    Navigator.of(context).pop("picked");
  }

  void deliverOrder() async {
    await FoodApi.deliverOrder(_order);
    await showDialog(
      context: context,
      builder: (context) => DeliverModal(order: _order, onAccept: () {}),
    );
    Navigator.of(context).pop("delivered");
  }

  Marker getDestinationMaker() {
    return Marker(
      markerId: MarkerId('Destination'),
      position: LatLng(_destinationPosition.latitude, _destinationPosition.longitude),
      icon: BitmapDescriptor.defaultMarker,
    );
  }

  void focusCamera() {
    Position _northeastCoordinates;
    Position _southwestCoordinates;

    double miny = (_currentPosition.latitude <= _destinationPosition.latitude) ? _currentPosition.latitude : _destinationPosition.latitude;
    double minx = (_currentPosition.longitude <= _destinationPosition.longitude) ? _currentPosition.longitude : _destinationPosition.longitude;
    double maxy = (_currentPosition.latitude <= _destinationPosition.latitude) ? _destinationPosition.latitude : _currentPosition.latitude;
    double maxx = (_currentPosition.longitude <= _destinationPosition.longitude) ? _destinationPosition.longitude : _currentPosition.longitude;

    _southwestCoordinates = Position(latitude: miny, longitude: minx, heading: 0.0,speed: 0.0,altitude: 0.0,accuracy: 0.0,timestamp: DateTime.now(), speedAccuracy: 0.0);
    _northeastCoordinates = Position(latitude: maxy, longitude: maxx, heading: 0.0,speed: 0.0,altitude: 0.0,accuracy: 0.0,timestamp: DateTime.now(), speedAccuracy: 0.0);

    _mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          northeast: LatLng(
            _northeastCoordinates.latitude,
            _northeastCoordinates.longitude,
          ),
          southwest: LatLng(
            _southwestCoordinates.latitude,
            _southwestCoordinates.longitude,
          ),
        ),
        100.0,
      ),
    );
  }

  createPolylines() async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Secrets.API_KEY,
      PointLatLng(_currentPosition.latitude, _currentPosition.longitude),
      PointLatLng(_destinationPosition.latitude, _destinationPosition.longitude),
      travelMode: TravelMode.transit,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  runLocationService() {
    locationSubscription = location.onLocationChanged.listen((locationData) {
      if (locationData != null) {
        setState(() {
          _currentPosition = Position(latitude: locationData.latitude, longitude: locationData.longitude, heading: 0.0,speed: 0.0,altitude: 0.0,accuracy: 0.0,timestamp: DateTime.now(), speedAccuracy: 0.0);
        });
        getRouteInfo();
      }
    });
  }

  getRouteInfo() async {
    RouteInfo route = await LocationApi.getRouteInfo(_currentPosition, _destinationPosition);
    setState(() {
      _route = route;
      if (route.distance < Constants.nearBy && this.mounted)
        buttonEnabled = true;
      else
        buttonEnabled = false;
    });
  }

  _initPostions() async {
    if (_order.status == RiderStatus.accepted)
      _destinationPosition = Position(latitude: _order.hotelLocation.lat, longitude: _order.hotelLocation.long, heading: 0.0,speed: 0.0,altitude: 0.0,accuracy: 0.0,timestamp: DateTime.now(), speedAccuracy: 0.0);
    else
      _destinationPosition = Position(latitude: _order.customerLocation.lat, longitude: _order.customerLocation.long, heading: 0.0,speed: 0.0,altitude: 0.0,accuracy: 0.0,timestamp: DateTime.now(), speedAccuracy: 0.0);

    _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    markers.add(getDestinationMaker());
    await createPolylines();
    await getRouteInfo();
    focusCamera();
    runLocationService();
  }

  _MapScreenState(order) {
    _order = order;
  }

  @override
  void initState() {
    super.initState();
    _route = RouteInfo(null);
    _initPostions();
    EasyLoading.dismiss();
  }

  @override
  void dispose() {
    _mapController.dispose();
    locationSubscription.cancel();
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
          key: _scaffoldKey,
          body: Stack(
            children: [
              GoogleMap(
                markers: markers != null ? Set<Marker>.from(markers) : null,
                initialCameraPosition: _initialCameraPosition,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                polylines: Set<Polyline>.of(polylines.values),
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
              ),
              zoomButtons(_mapController),
              currentLocationButton(_mapController, _currentPosition),
              bottomCard(context, buttonEnabled, _route, _order, pickOrder, deliverOrder),
            ],
          ),
        ),
      ),
    );
  }
}
