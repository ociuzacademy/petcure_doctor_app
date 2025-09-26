// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class TreatmentDetailCard extends StatelessWidget {
  final List<Widget> children;
  const TreatmentDetailCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: children),
      ),
    );
  }
}
