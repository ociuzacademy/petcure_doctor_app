// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/models/treatment_record.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';

class TreatmentHeaderCard extends StatelessWidget {
  const TreatmentHeaderCard({super.key, required this.treatmentRecord});

  final TreatmentRecord treatmentRecord;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppPalette.firstColor.withValues(alpha: 0.2),
              radius: 30,
              child: const Icon(Icons.pets, size: 30, color: AppPalette.firstColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    treatmentRecord.petName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Owner: ${treatmentRecord.ownerName}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Pet ID: ${treatmentRecord.petId}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
