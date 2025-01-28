import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';
import 'package:twende/utils/button.dart';
import 'package:twende/views/home/driver_found.dart';

class SearchNearBy extends StatefulWidget {
  const SearchNearBy({super.key});

  @override
  State<SearchNearBy> createState() => _SearchNearByState();
}

class _SearchNearByState extends State<SearchNearBy> {
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
          const Text('Searching nearby drivers'),
          const Text('Ride requested '),
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
          AppStyle.SPACING_SM.heightBox,
          CustomButton(
            backGroundColor: Theme.of(context).disabledColor,
            title: "Increase Progress",
            onTap: () {
              setState(() {
                _progressValue += 0.1;
                if (_progressValue > 1) {
                  _progressValue = 0.0; // Réinitialisation
                }
              });
            },
          ),
        
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DriverFound()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('Select car'),
          ),
        ],
      ),
    );
  }
}
