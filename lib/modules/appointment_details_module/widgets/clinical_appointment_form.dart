// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/widgets/text_fields/custom_text_field.dart';

class ClinicalAppointmentForm extends StatelessWidget {
  const ClinicalAppointmentForm({
    super.key,
    required this.weightController,
    required this.verdictController,
    required this.notesController,
  });

  final TextEditingController weightController;
  final TextEditingController verdictController;
  final TextEditingController notesController;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Clinical Examination',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Weight field
            CustomTextField(
              textEditingController: weightController,
              labelText: 'Current Weight (kg)',
              hintText: 'Enter current weight',
              textInputType: TextInputType.number,
              validatorFunction: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter weight';
                }
                final weight = double.tryParse(value);
                if (weight == null || weight <= 0) {
                  return 'Please enter a valid weight';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Verdict field
            CustomTextField(
              textEditingController: verdictController,
              labelText: 'Diagnosis & Verdict',
              hintText: 'Enter your diagnosis and treatment plan...',
              isMultiline: true,
              validatorFunction: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter diagnosis and verdict';
                }
                if (value.length < 10) {
                  return 'Please provide detailed diagnosis';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Notes field
            CustomTextField(
              textEditingController: notesController,
              labelText: 'Additional Notes (Optional)',
              hintText: 'Any additional notes or recommendations...',
              isMultiline: true,
              validatorFunction: (value) {
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
