import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';
import 'package:twende/utils/button.dart';
import 'package:twende/views/home/selected_car.dart';

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
                modelActuel(
                  context,
                  icon: Icons.location_on,
                  title: "From Birere",
                ),
                10.heightBox,
                modelPasVisiteur(
                  context,
                  icon: Icons.location_on,
                  title: "To Lechalet",
                ),
                _buildLocationItem('From Birere', Colors.red),
                _buildLocationItem('To Lechalet', Colors.green),
                AppStyle.SPACING_SM.heightBox,
                CustomButton(
                  backGroundColor: Theme.of(context).disabledColor,
                  title: "Confirm destination",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectCar()),
                    );
                  },
                ),
                // const SizedBox(height: 16),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const SelectCar()),
                //     );
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.red,
                //     minimumSize: const Size(double.infinity, 50),
                //   ),
                //   child: const Text('Confirm destination'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget modelActuel(
    BuildContext context, {
    required IconData icon,
    required String title,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre et sous-titre
                    Text(
                      "$title ",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -20,
          left: 15,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: const Icon(
              Icons.location_on,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget modelPasVisiteur(
    BuildContext context, {
    required IconData icon,
    required String title,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 35,
          top: -10,
          bottom: 10,
          child: Container(
            width: 3,
            color: const Color(0xFF7DB8A9).withOpacity(0.3),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 30,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titre et sous-titre
                Text(
                  "$title ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10, // Décalage vers le haut
          left: 15,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFF7DB8A9),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      ],
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
