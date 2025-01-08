// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WhereAreYouGoingScreen extends StatefulWidget {
  const WhereAreYouGoingScreen({super.key});

  @override
  _WhereAreYouGoingScreenState createState() => _WhereAreYouGoingScreenState();
}

class _WhereAreYouGoingScreenState extends State<WhereAreYouGoingScreen> {
  late GoogleMapController mapController;

  final LatLng _initialPosition = const LatLng(-11.664, 27.479);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Where are you going?',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 250,
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
              child: GoogleMap(
                onMapCreated: (controller) {
                  mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: _initialPosition,
                  zoom: 14.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search location',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading:
                            const Icon(Icons.location_on, color: Colors.blue),
                        title: const Text('Lubumbashi'),
                        subtitle: const Text('Haut-Katanga, Congo'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.location_on, color: Colors.blue),
                        title: const Text('Kinshasa'),
                        subtitle: const Text('Kinshasa, Congo'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.location_on, color: Colors.blue),
                        title: const Text('Goma'),
                        subtitle: const Text('North Kivu, Congo'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
