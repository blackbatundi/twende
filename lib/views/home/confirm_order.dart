import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({super.key});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My rides'),
      ),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Lechalet',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Jan 20, 1:40 PM'),
                      Text('FC 4,5000'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
