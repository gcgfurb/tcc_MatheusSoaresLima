import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  @override
  State<CustomGoogleMap> createState() => CustomGoogleMapState();
}

class CustomGoogleMapState extends State<CustomGoogleMap> {
  List<Marker> customMarkers = [];
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(28.535517, 77.391029);

  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return GoogleMap(
      onMapCreated: _onMapCreated,
      markers: customMarkers.toSet(),
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 10.0,
      ),
    );
  }
}
