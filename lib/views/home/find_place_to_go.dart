import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';
import 'package:twende/views/home/picked_localisation.dart';

class FindPlaceToGo extends StatefulWidget {
  const FindPlaceToGo({super.key});

  @override
  State<FindPlaceToGo> createState() => _FindPlaceToGoState();
}

class _FindPlaceToGoState extends State<FindPlaceToGo> {
  late GoogleMapController mapController;

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
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: Column(
                    children: [
                      AppStyle.SPACING_SM.heightBox,
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).cardColor,
                          ),
                          child: Icon(
                            Icons.close,
                            size: AppStyle.ICON_NX,
                          ),
                        ),
                      ),
                    ],
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
                  'Where are you going?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Where to?',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LocalisationPicked(),
                          ),
                        ),
                    child:
                        _buildLocationItem('Lechalet', 'Av. de la paix, Goma')),
                _buildLocationItem('Kivu', 'Av. lac kivu, Goma'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationItem(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 17),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined),
          Column(
            children: [
              Text(title),
              Text(subtitle),
            ],
          )
        ],
      ),
    );
  }
}
