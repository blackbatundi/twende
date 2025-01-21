import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:twende/views/home/driver_found.dart';
import 'package:twende/views/home/tripe/tripe_detail.dart';

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
                const Positioned(
                  top: 40,
                  left: 16,
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DriverFound()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                  child: const Text('Pay with cash'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                  child: const Text('Pay with mobile money'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
