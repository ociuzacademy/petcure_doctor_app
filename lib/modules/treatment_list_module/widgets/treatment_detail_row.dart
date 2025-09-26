// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class TreatmentDetailRow extends StatelessWidget {
  final String label;
  final String value;
  const TreatmentDetailRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }
}
