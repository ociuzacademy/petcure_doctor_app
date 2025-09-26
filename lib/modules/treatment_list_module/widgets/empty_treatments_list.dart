// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


class EmptyTreatmentsList extends StatelessWidget {
  final VoidCallback onSelectingToday;
  const EmptyTreatmentsList({super.key, required this.onSelectingToday});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.medical_services, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'No Treatments Found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'No treatment records found for the selected date.',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: onSelectingToday,
            icon: const Icon(Icons.today),
            label: const Text('View Today\'s Records'),
          ),
        ],
      ),
    );
  }
}
