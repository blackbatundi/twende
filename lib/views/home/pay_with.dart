import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';
import 'package:twende/utils/button.dart';
import 'package:twende/views/home/confirm_order.dart';

class PayWith extends StatefulWidget {
  const PayWith({super.key});

  @override
  State<PayWith> createState() => _PayWithState();
}

class _PayWithState extends State<PayWith> {
  late GoogleMapController mapController;
  final Set<Polyline> _polylines = {};
  final Set<Marker> _markers = {};

  static const LatLng _birereLocation =
      LatLng(-1.6777, 29.2285); // Birere, Goma
  static const LatLng _lechaletLocation =
      LatLng(-1.6647, 29.2285); // Approximate Lechalet location

  @override
  void initState() {
    super.initState();
    _polylines.add(
      const Polyline(
        polylineId: PolylineId('route'),
        color: Colors.red,
        width: 3,
        points: [
          _birereLocation,
          _lechaletLocation,
        ],
      ),
    );
    _markers.add(
      Marker(
        markerId: const MarkerId('birere'),
        position: _birereLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
    _markers.add(
      Marker(
        markerId: const MarkerId('lechalet'),
        position: _lechaletLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(-1.6721, 29.2285), // Center of Goma
                    zoom: 14,
                  ),
                  polylines: _polylines,
                  markers: _markers,
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
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
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomButton(
                  backGroundColor: Theme.of(context).disabledColor,
                  title: "Pay with cash",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConfirmOrder()),
                    );
                  },
                ),
                AppStyle.SPACING_SM.heightBox,
                CustomButton(
                  backGroundColor: Theme.of(context).disabledColor,
                  title: "Pay with mobile money",
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
