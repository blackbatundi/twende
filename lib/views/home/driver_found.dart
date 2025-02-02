import 'package:flutter/cupertino.dart';
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
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Driver found',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppStyle.SPACING_SM.heightBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Muhindo Masu',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color,
                            ),
                          ),
                          Text(
                            'UBM102M Toyota Sienta Grey',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AppStyle.SPACING_XL.heightBox,
                CustomButton(
                  backGroundColor: Theme.of(context).primaryColor,
                  titleColor: Colors.white,
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
