import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverFound extends StatefulWidget {
  const DriverFound({super.key});

  @override
  State<DriverFound> createState() => _DriverFoundState();
}

class _DriverFoundState extends State<DriverFound> {
  double _progressValue = 0.3; // Valeur initiale de progression (30%)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Driver found'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(-1.6859, 29.2218),
                zoom: 14,
              ),
              markers: {
                const Marker(
                  markerId: MarkerId('pickup'),
                  position: LatLng(-1.6859, 29.2218),
                  infoWindow: InfoWindow(title: 'Pickup in 5min'),
                ),
                const Marker(
                  markerId: MarkerId('destination'),
                  position: LatLng(-1.6500, 29.3000),
                  infoWindow: InfoWindow(title: 'To Birere'),
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
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Driver found',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('Muhindo Masu'),
                const Text('UBM102M Toyota Sienta Grey'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.phone),
                      label: const Text('Call'),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Chat',
                          suffixIcon: Icon(Icons.send),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * _progressValue,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text('${(_progressValue * 100).toInt()}%'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _progressValue += 0.1;
                      if (_progressValue > 1) {
                        _progressValue = 0.0; // Réinitialisation
                      }
                    });
                  },
                  child: const Text('Increase Progress'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Cancel trip'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
