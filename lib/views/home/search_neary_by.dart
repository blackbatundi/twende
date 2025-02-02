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
      body: Column(
        children: [
          Expanded(
            child: Stack(children: [
              GoogleMap(
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
              Positioned(
                top: 50,
                left: 16,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Searching nearby drivers',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                AppStyle.SPACING_SM.heightBox,
                Text(
                  'Ride requested ',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
                AppStyle.SPACING_SM.heightBox,
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
                AppStyle.SPACING_XL.heightBox,
                CustomButton(
                  backGroundColor: Theme.of(context).primaryColor,
                  titleColor: Colors.white,
                  title: "View the driver",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DriverFound()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
