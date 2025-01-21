import 'package:flutter/material.dart';
import 'screen5.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                  onSubmitted: (_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Screen5()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildLocationItem('Lechalet', 'Av. de la paix, Goma'),
                _buildLocationItem('Kivu', 'Av. lac kivu, Goma'),
                _buildLocationItem('Kivu', 'Av. lac kivu, Goma'),
                _buildLocationItem('Kivu', 'Av. lac kivu, Goma'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationItem(String title, String subtitle) {
    return ListTile(
      leading: const Icon(Icons.location_on_outlined),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {},
    );
  }
}