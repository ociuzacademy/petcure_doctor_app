import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/models/prescription_model.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/section_title.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/treatment_detail_card.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/treatment_detail_row.dart';

class PrescriptionSection extends StatelessWidget {
  final PrescriptionModel prescriptionModel;

  const PrescriptionSection({super.key, required this.prescriptionModel});

  @override
  Widget build(BuildContext context) {
    if (prescriptionModel.prescriptions.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Prescription Details'),
        ...prescriptionModel.prescriptions.map((prescription) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TreatmentDetailCard(
                children: [
                  TreatmentDetailRow(
                    label: 'Prescription ID',
                    value: '#${prescription.id}',
                  ),
                  TreatmentDetailRow(
                    label: 'Date',
                    value: AppHelpers.formatDateTime(prescription.issuedDate),
                  ),
                  TreatmentDetailRow(
                    label: 'Duration',
                    value: '${prescription.daysDuration} Days',
                  ),
                  if (prescription.notes.isNotEmpty)
                    TreatmentDetailRow(
                      label: 'Notes',
                      value: prescription.notes,
                      isMultiLine: true,
                    ),
                  const SizedBox(height: 8),
                  const Text(
                    'Medications:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  ...prescription.medications.map((medication) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            medication.name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text('Dosage: ${medication.dosage}'),
                          Text('Timing: ${medication.foodTiming.label}'),
                          Text(
                            'Time of Day: ${medication.timeOfDay.map((e) => e.label).join(", ")}',
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 16),
            ],
          );
        }),
      ],
    );
  }
}
