import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:twende/views/home/selectedCar.dart';

class LocalisationPicked extends StatefulWidget {
  const LocalisationPicked({super.key});

  @override
  State<LocalisationPicked> createState() => _LocalisationPickedState();
}

class _LocalisationPickedState extends State<LocalisationPicked> {
  late GoogleMapController mapController;
  final Set<Polyline> _polylines = {};
  final Set<Marker> _markers = {};

  static const LatLng _birereLocation = LatLng(-1.6777, 29.2285);
  static const LatLng _lechaletLocation = LatLng(-1.6647, 29.2285);

  @override
  void initState() {
    super.initState();
    _polylines.add(
      Polyline(
        polylineId: const PolylineId('route'),
        color: Colors.red,
        width: 3,
        points: const [
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
                    target: LatLng(-1.6721, 29.2285),
                    zoom: 14,
                  ),
                  polylines: _polylines,
                  markers: _markers,
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pickup location',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildLocationItem('From Birere', Colors.red),
                _buildLocationItem('To Lechalet', Colors.green),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SelectCar()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Confirm destination'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationItem(String text, Color color) {
    return Row(
      children: [
        Icon(Icons.location_on, color: color),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
