import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Screen6 extends StatefulWidget {
  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Trip details'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(-1.6859, 29.2218),
                zoom: 14,
              ),
              markers: {
                const Marker(
                  markerId: MarkerId('from'),
                  position: LatLng(-1.6859, 29.2218),
                  infoWindow: InfoWindow(title: 'From Birere'),
                ),
                const Marker(
                  markerId: MarkerId('to'),
                  position: LatLng(-1.6500, 29.3000),
                  infoWindow: InfoWindow(title: 'To Lechalet'),
                ),
              },
              polylines: {
                const Polyline(
                  polylineId: PolylineId('route'),
                  points: [
                    LatLng(-1.6859, 29.2218),
                    LatLng(-1.6500, 29.3000),
                  ],
                  color: Colors.red,
                  width: 4,
                ),
              },
            ),
          ),
          const ListTile(
            title: Text('Ride with Muhindo Masu'),
          ),
        ],
      ),
    );
  }
}
