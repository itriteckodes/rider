import 'package:driver/values/Clr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Widget zoomButtons(mapController) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Material(
              color: Clr.green, // button color
              child: InkWell(
                splashColor: Clr.green.withOpacity(0.2), // inkwell color
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.add,color: Clr.white,),
                ),
                onTap: () {
                  mapController.animateCamera(
                    CameraUpdate.zoomIn(),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          ClipOval(
            child: Material(
              color: Clr.green, // button color
              child: InkWell(
                splashColor: Clr.green.withOpacity(0.2), // inkwell color
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.remove,color: Clr.white,),
                ),
                onTap: () {
                  mapController.animateCamera(
                    CameraUpdate.zoomOut(),
                  );
                },
              ),
            ),
          )
        ],
      ),
    ),
  );
}
