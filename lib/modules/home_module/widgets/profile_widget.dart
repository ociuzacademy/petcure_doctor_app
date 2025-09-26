import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double latitude = 48.85833333;
    final double longitude = 2.29444444;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.05,
        vertical: screenSize.height * 0.01,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: screenSize.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.local_hospital, size: 40, color: Colors.blue),
              const SizedBox(height: 10),
              Text(
                'Dr. John Doe',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.red),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      '3058 Peck Court, Costa Mesa, California, 92627, United States.',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.green),
                  const SizedBox(width: 5),
                  Text('+91 9876543210', style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.email, color: Colors.orange),
                  const SizedBox(width: 5),
                  Text('user@email.com', style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.map, color: Colors.green),
                  const SizedBox(width: 5),
                  Text(
                    "Lat: $latitude, Lon: $longitude",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.open_in_new, color: Colors.blue),
                    onPressed: () {
                      _openGoogleMaps(latitude, longitude);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tomorrow's Bookings:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "10",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Open Google Maps in the default map application or show an error dialog if it fails.
  Future<void> _openGoogleMaps(double lat, double lon) async {
    final Uri googleMapsUri = Uri.parse("geo:$lat,$lon?q=$lat,$lon");
    final Uri webUri = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$lat,$lon",
    );

    if (await canLaunchUrl(googleMapsUri)) {
      await launchUrl(googleMapsUri);
    } else if (await canLaunchUrl(webUri)) {
      await launchUrl(webUri);
    } else {
      if (mounted) {
        _showErrorDialog(context);
      }
    }
  }

  /// Show an alert dialog when launching the map fails.
  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text(
            "Could not open the map application. Please try again.",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
