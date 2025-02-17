import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:twende/services/app_setting.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';

class TripeDetail extends StatefulWidget {
  const TripeDetail({super.key});

  @override
  State<TripeDetail> createState() => _TripeDetailState();
}

class _TripeDetailState extends State<TripeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppStyle.SPACING_LG.heightBox,
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
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
                Positioned(
                  top: 40,
                  left: 16,
                  child: Row(
                    children: [
                      InkWell(
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
                      const SizedBox(width: 8),
                      const Text(
                        'Trip details',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppStyle.SPACING_LG.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              margin: const EdgeInsets.only(
                top: 8,
              ),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ride with Muhindo Masu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'UBM102M Toyota Sienta Grey',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor.withOpacity(.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AppStyle.SPACING_LG.heightBox,
        ],
      ),
    );
  }
}
