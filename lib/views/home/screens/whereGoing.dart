// Screen 1: Where Are You Going?
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WhereAreYouGoingScreen extends StatefulWidget {
  @override
  _WhereAreYouGoingScreenState createState() => _WhereAreYouGoingScreenState();
}

class _WhereAreYouGoingScreenState extends State<WhereAreYouGoingScreen> {
  late GoogleMapController mapController;

  final LatLng _initialPosition = LatLng(-11.664, 27.479);

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
        title: Text(
          'Where are you going?',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search location',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(Icons.location_on, color: Colors.blue),
                        title: Text('Lubumbashi'),
                        subtitle: Text('Haut-Katanga, Congo'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on, color: Colors.blue),
                        title: Text('Kinshasa'),
                        subtitle: Text('Kinshasa, Congo'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on, color: Colors.blue),
                        title: Text('Goma'),
                        subtitle: Text('North Kivu, Congo'),
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