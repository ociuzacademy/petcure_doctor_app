// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class TreatmentDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isMultiLine;
  const TreatmentDetailRow({
    super.key,
    required this.label,
    required this.value,
    this.isMultiLine = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: isMultiLine
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14, height: isMultiLine ? 1.4 : 1.2),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
