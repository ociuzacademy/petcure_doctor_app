// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/providers/appointment_details_provider.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/widgets/medication_input_card.dart';
import 'package:petcure_doctor_app/widgets/text_fields/custom_text_field.dart';
import 'package:provider/provider.dart';

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
        child: Consumer<AppointmentDetailsProvider>(
          builder: (context, provider, child) {
            return Column(
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
                  validatorFunction: provider.validateWeight,
                ),
                const SizedBox(height: 16),

                // Verdict field
                CustomTextField(
                  textEditingController: verdictController,
                  labelText: 'Diagnosis & Verdict',
                  hintText: 'Enter your diagnosis and treatment plan...',
                  isMultiline: true,
                  validatorFunction: provider.validateVerdict,
                ),
                const SizedBox(height: 16),

                // Duration field
                CustomTextField(
                  textEditingController: provider.daysDurationController,
                  labelText: 'Duration (Days)',
                  hintText: 'e.g. 5',
                  textInputType: TextInputType.number,
                  validatorFunction: provider.validateDaysDuration,
                ),
                const SizedBox(height: 16),

                // Medications Section
                Text(
                  'Medications',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.medicationControllers.length,
                  itemBuilder: (context, index) {
                    final controller = provider.medicationControllers[index];
                    return MedicationInputCard(
                      index: index,
                      onRemove: () => provider.removeMedication(index),
                      nameController: controller.nameController,
                      dosageController: controller.dosageController,
                      initialFoodTiming: controller.foodTiming,
                      initialTimeOfDay: controller.timeOfDay,
                      onFoodTimingChanged: (value) {
                        controller.foodTiming = value;
                      },
                      onTimeOfDayChanged: (values) {
                        controller.timeOfDay = values;
                      },
                    );
                  },
                ),
                if (provider.medicationControllers.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      'No medications added yet.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: provider.addMedication,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Medication'),
                  ),
                ),
                const SizedBox(height: 16),

                // Notes field
                CustomTextField(
                  textEditingController: notesController,
                  labelText: 'Additional Notes (Optional)',
                  hintText: 'Any additional notes or recommendations...',
                  isMultiline: true,
                  validatorFunction: provider.validateNotes,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
