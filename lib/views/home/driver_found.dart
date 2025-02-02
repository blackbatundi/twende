import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';
import 'package:twende/utils/button.dart';

class DriverFound extends StatefulWidget {
  const DriverFound({super.key});

  @override
  State<DriverFound> createState() => _DriverFoundState();
}

class _DriverFoundState extends State<DriverFound> {
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
          //  Expanded(
          //   child: Stack(
          //     children: [
          //       GoogleMap(
          //         initialCameraPosition: const CameraPosition(
          //           target: LatLng(-1.6721, 29.2285),
          //           zoom: 14,
          //         ),
          //         polylines: _polylines,
          //         markers: _markers,
          //         onMapCreated: (GoogleMapController controller) {
          //           mapController = controller;
          //         },
          //       ),
          // Positioned(
          //   top: 50,
          //   left: 16,
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: Container(
          //       padding: const EdgeInsets.all(10),
          //       decoration: BoxDecoration(
          //         color: Theme.of(context).cardColor,
          //         shape: BoxShape.circle,
          //       ),
          //       child: const Icon(Icons.arrow_back),
          //     ),
          //   ),
          // ),
          //     ],
          //   ),
          //  ),
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
                AppStyle.SPACING_SM.heightBox,
                CustomButton(
                  backGroundColor: Theme.of(context).disabledColor,
                  title: "Cancel trip",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
