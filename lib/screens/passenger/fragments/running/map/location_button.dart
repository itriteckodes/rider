import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Widget currentLocationButton(mapController, _currentPosition) {
  return SafeArea(
    child: Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, bottom: 170.0),
        child: ClipOval(
          child: Material(
            color: Clr.green, // button color
            child: InkWell(
              splashColor: Clr.green.withOpacity(0.2), // inkwell color
              child: SizedBox(
                width: 56,
                height: 56,
                child: Icon(Icons.my_location,color: Clr.white,),
              ),
              onTap: () {
                mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(
                        _currentPosition.latitude,
                        _currentPosition.longitude,
                      ),
                      zoom: 18.0,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ),
  );
}
