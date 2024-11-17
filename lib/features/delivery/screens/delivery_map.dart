import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryMap extends StatelessWidget {
  final LatLng pickupLocation;
  final LatLng dropOffLocation;

  const DeliveryMap({
    Key? key,
    required this.pickupLocation,
    required this.dropOffLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Delivery Map')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: pickupLocation,
          zoom: 12,
        ),
        markers: {
          Marker(
            markerId: MarkerId('pickup'),
            position: pickupLocation,
            infoWindow: InfoWindow(title: 'Pickup Location'),
          ),
          Marker(
            markerId: MarkerId('dropoff'),
            position: dropOffLocation,
            infoWindow: InfoWindow(title: 'Drop-off Location'),
          ),
        },
      ),
    );
  }
}
