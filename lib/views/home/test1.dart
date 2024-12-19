// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PredefinedLocationsMap extends StatefulWidget {
  static String routeName = "/PredefinedLocationsMap";
  @override
  // ignore: library_private_types_in_public_api
  _PredefinedLocationsMapState createState() => _PredefinedLocationsMapState();
}

class _PredefinedLocationsMapState extends State<PredefinedLocationsMap> {
  late GoogleMapController _mapController;

  // Liste des lieux prédéfinis
  final List<Map<String, dynamic>> locations = [
    {"name": "Goma", "position": LatLng(-1.676069, 29.232157)},
    {"name": "Bukavu", "position": LatLng(-2.509356, 28.845673)},
    {"name": "Kinshasa", "position": LatLng(-4.441931, 15.266293)},
    {"name": "Lubumbashi", "position": LatLng(-11.687754, 27.479241)},
  ];

  // Liste des marqueurs
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    // Ajouter les marqueurs pour les lieux prédéfinis
    for (var location in locations) {
      _markers.add(
        Marker(
          markerId: MarkerId(location["name"]),
          position: location["position"],
          infoWindow: InfoWindow(title: location["name"]),
        ),
      );
    }
  }

  // Fonction pour centrer la carte sur un lieu sélectionné
  void _centerMapOnLocation(LatLng position) {
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carte des lieux prédéfinis"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(-1.676069, 29.232157), // Position initiale (Goma)
                zoom: 6.0,
              ),
              markers: _markers,
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];
                return ListTile(
                  leading: Icon(Icons.location_on, color: Colors.red),
                  title: Text(location["name"]),
                  onTap: () {
                    // Centrer la carte sur le lieu sélectionné
                    _centerMapOnLocation(location["position"]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
