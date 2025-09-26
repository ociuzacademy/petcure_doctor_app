// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/models/treatment_record.dart';

class AdditionalNotesCard extends StatelessWidget {
  const AdditionalNotesCard({super.key, required this.treatmentRecord});

  final TreatmentRecord treatmentRecord;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.note, color: Colors.blue[600], size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                treatmentRecord.additionalNotes!,
                style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
