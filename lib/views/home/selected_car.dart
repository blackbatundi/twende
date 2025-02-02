import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';
import 'package:twende/utils/button.dart';
import 'package:twende/views/home/pay_with.dart';

class SelectCar extends StatefulWidget {
  const SelectCar({super.key});

  @override
  State<SelectCar> createState() => _SelectCarState();
}

class _SelectCarState extends State<SelectCar> {
  late GoogleMapController mapController;
  final Set<Polyline> _polylines = {};
  final Set<Marker> _markers = {};

  static const LatLng _birereLocation = LatLng(-1.6777, 29.2285);
  static const LatLng _lechaletLocation = LatLng(-1.6647, 29.2285);

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
                _buildRideOption(
                  'Comfort',
                  '15 min',
                  'FC 45000',
                  Icons.car_rental,
                ),
                _buildRideOption(
                  'XL',
                  '20 min',
                  'FC 55000',
                  Icons.car_rental,
                ),
                _buildRideOption(
                  'Boda',
                  'Busy',
                  'FC 5000',
                  Icons.motorcycle,
                ),
                AppStyle.SPACING_XL.heightBox,
                Row(
                  children: [
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text('Paying with'),
                    ),
                    const Text(
                      'cash',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    AppStyle.SPACING_SM.widthBox,
                    Icon(
                      Icons.arrow_forward_ios,
                      size: AppStyle.ICON_NORMAL,
                    ),
                  ],
                ),
                AppStyle.SPACING_XL.heightBox,
                CustomButton(
                  backGroundColor: Theme.of(context).primaryColor,
                  titleColor: Colors.white,
                  title: "Select car",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PayWith()),
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

  Widget _buildRideOption(
      String title, String time, String price, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(
        top: 8,
      ),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.16),
            offset: const Offset(0, 3),
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(time),
                ],
              ),
            ),
            Text(price),
          ],
        ),
      ),
    );
  }
}
